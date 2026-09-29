import torch
import torch.nn as nn
import torch.optim as optim
#from torchvision import transforms, datasets

import sys, json, os, glob, re
import numpy as np
#import matplotlib.pyplot as plt
from datetime import datetime

from torch.utils.data import DataLoader, TensorDataset
from tqdm import tqdm

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity, QuantHardTanh

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import load_wine

sys.path.append('../common')
from KAN_Quant import KANQuant
from quant import QuantBrevitasActivation, ScalarBiasScale
from os_path import find_latest_epoch, plot_and_save_results, plot_confusion_matrix

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(device)

seed = 1
torch.manual_seed(seed)
np.random.seed(seed)

config = {
    "layers"          : [13, 10, 3],
    "grid_range"      : [-8, 8],
    "layers_width"    : [6, 6, 6],

    "grid_size"       : 6,
    "spline_order"    : 3,
    "grid_eps"        : 0.05,
    "base_activation" : "nn.SiLU" ,

    "batch_size"      : 64,
    "num_epochs"      : 50,

    "learning_rate"   : 0.05,
    "weight_decay"    : 1e-3,
    "scheduler_gamma" : 0.9,

    "prune_threshold" : 0.08,
    "target_epoch"    : 30,
    "warmup_epochs"   : 10,

    "random_seed"     : seed,

    "resume"          : False,
    "resume_path"     : "",

}

if config.get("resume", False):
   resume_checkpoint_name = find_latest_epoch(config.get("resume_path", "models"))
else: 
   resume_checkpoint_name = None
   
if resume_checkpoint_name is None:
   print(f"Resume requested but no checkpoint found at {config.get('resume_path', 'models')}. Starting fresh.")
   #model_dir  = f'models/{datetime.now().strftime("%d-%m-%Y_%H-%M-%S")}'
   model_dir  = f'models/{datetime.now().strftime("%Y%m%d%H%M%S")}'
else:
   print(f"Resuming from checkpoint: {resume_checkpoint_name}") 
   model_dir = os.path.dirname(resume_checkpoint_name)
   ckpt = torch.load(resume_checkpoint_name, map_location=device)

os.makedirs(model_dir, exist_ok = True)

with open(f'{model_dir}/config.json', "w") as f: json.dump(config, f, indent=2)

#X_all, y_all = make_moons(n_samples=10000, noise=0.2, random_state=seed)

wine = load_wine()
X_all = wine.data           # [N, 13]
y_all = wine.target         # {0,1,2}

X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X_all, y_all, test_size=0.3, random_state=seed, shuffle=True, stratify=y_all
)

scaler = StandardScaler()
X_tr = scaler.fit_transform(X_tr_raw); X_te = scaler.transform(X_te_raw)

X_tr_t = torch.from_numpy(X_tr).float().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_tr_t = torch.from_numpy(y_tr).float().long().to(device)
y_te_t = torch.from_numpy(y_te).float().long().to(device)

dataset = {
    "train_input": X_tr_t,
    "train_label": y_tr_t,
    "test_input":  X_te_t,
    "test_label":  y_te_t,
}
#print(f"in_features={X_tr_t.shape[1]}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Data Loaders ===
trainloader = DataLoader(TensorDataset(X_tr_t, y_tr_t), batch_size=config["batch_size"], shuffle=True)
validloader = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=config["batch_size"], shuffle=False)

bn_in = nn.BatchNorm1d(config['layers'][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data  , 0)

input_bias = ScalarBiasScale(scale = False, bias = True, bias_init = -0.25)

first_layer_quant = QuantHardTanh(
    bit_width           = config['layers_width'][0],
    quant_type          = QuantType.INT,
    return_quant_tensor = False,
    min_val             = -1,
    max_val             = 1,
    act_scaling_impl    = ParameterScaling(1.33),
    signed              = True,
    narrow_range        = False
    )

MNIST_input_layer = QuantBrevitasActivation(brevitas_module = first_layer_quant, 
                                            pre_transforms = [bn_in, input_bias],
                                            cuda = device=="cuda").to(device)

model = KANQuant(config = config, input_layer = MNIST_input_layer, device = device).to(device)

optimize = optim.AdamW(model.parameters(), lr = config['learning_rate'], weight_decay = config['weight_decay'])
sched = optim.lr_scheduler.ExponentialLR(optimize, gamma = config['scheduler_gamma'])
loss_func = nn.CrossEntropyLoss()

training_loss = []
testing_loss  = []
training_acc  = []
testing_acc   = []
best_val_accuracy  = 0.0
resume_start_epoch = 0
epoch_run = 0

if resume_checkpoint_name is not None:
   model.load_state_dict(ckpt['model_state_dict'])
   optimize.load_state_dict(ckpt['optimizer_state_dict'])
   sched.load_state_dict(ckpt['scheduler_state_dict'])
   resume_start_epoch = int(ckpt.get("epoch", 0))

for epoch in range(resume_start_epoch, config['num_epochs']):
  model.train()
  epoch_train_loss = 0
  epoch_train_acc  = 0
  total_batches    = 0
  with tqdm(trainloader) as pbar:
    for i ,(inputs, labels) in enumerate(pbar):
      inputs, labels = inputs.to(device), labels.to(device)
      optimize.zero_grad()
      output = model(inputs)
      loss = loss_func(output, labels)
      loss.backward()
      optimize.step()

      with torch.no_grad():
        accuracy = (output.argmax(dim=1) == labels).float().mean()
        pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimize.param_groups[0]['lr'])

      epoch_train_loss += loss.item()
      epoch_train_acc  += accuracy.item()
      total_batches    += 1

  average_train_loss = epoch_train_loss / max(total_batches, 1)
  training_loss.append(average_train_loss)

  average_train_acc  = epoch_train_acc  / max(total_batches, 1)
  training_acc.append(average_train_acc)

  if config["prune_threshold"] is not None:
    Remaining_fraction  = model.prune_below_threshold(
        threshold     = config["prune_threshold"],
        epoch         = epoch,
        target_epoch  = config["target_epoch"],
        warmup_epochs = config["warmup_epochs"],
        show_layer    = True
    )
  else : Remaining_fraction = 1.0
  print(f"Total remaining fraction: {Remaining_fraction}")

  model.eval()
  val_loss = 0.0
  val_accuracy = 0.0
  with torch.no_grad():
      for inputs, labels in validloader:
          inputs, labels = inputs.to(device), labels.to(device)
          output = model(inputs)
          val_loss += loss_func(output, labels).item()
          val_accuracy += (
              (output.argmax(dim=1) == labels.to(device)).float().mean().item()
          )
  val_loss /= len(validloader)
  val_accuracy /= len(validloader)

  testing_loss.append(val_loss)
  testing_acc.append(val_accuracy)

  sched.step()
  epoch_run += 1
  print(f"Epoch {epoch_run}, Val Loss: {val_loss}, Val Accuracy: {val_accuracy}\n")

  if epoch_run > config["target_epoch"]:
    checkpoint_path = f'{model_dir}/Moon_Acc{val_accuracy:.4f}_Loss{val_loss:.4f}_Epoch{epoch_run}_Remainding{Remaining_fraction:.4f}.pth'
    torch.save({
     'epoch'               : epoch_run,
     'model_state_dict'    : model.state_dict(),
     'optimizer_state_dict': optimize.state_dict(),
     'scheduler_state_dict': sched.state_dict(),
     'val_accuracy'        : val_accuracy,
     'val_loss'            : val_loss,
     'remaining_fraction'  : Remaining_fraction,
    }, checkpoint_path)

log_data = {
    "train_acc" : training_acc,
    "val_acc"   : testing_acc,
    "train_loss": training_loss,
    "val_loss"  : testing_loss
}

with open(f"{model_dir}/KANQuant_training_log.json", "w") as f: json.dump(log_data, f)

plot_and_save_results(training_acc, testing_acc, training_loss, testing_loss, model_dir, "KanQuant")
# plot_confusion_matrix(model, validloader, device, model_dir, "KanQuant")
  
# checkpoint_path = f'{model_dir}/Moon_Acc{val_accuracy:.4f}_Loss{val_loss:.4f}_Epoch{epoch_run}_Remainding{Remaining_fraction:.4f}.pth'
# torch.save({
#    'epoch'               : epoch_run,
#    'model_state_dict'    : model.state_dict(),
#    'optimizer_state_dict': optimize.state_dict(),
#    'scheduler_state_dict': sched.state_dict(),
#    'val_accuracy'        : val_accuracy,
#    'val_loss'            : val_loss,
#    'remaining_fraction'  : Remaining_fraction,
# }, checkpoint_path)