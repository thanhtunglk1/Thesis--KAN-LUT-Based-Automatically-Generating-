import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

import sys, json, os, glob, re
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime

from torch.utils.data import DataLoader
from tqdm import tqdm

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity, QuantHardTanh

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
    "layers"          : [28*28, 64, 10],
    "grid_range"      : [-8, 8],
    "layers_width"    : [1, 6, 6],

    "grid_size"       : 5,
    "spline_order"    : 3,
    "grid_eps"        : 0.03,
    "base_activation" : "nn.SiLU" ,

    "batch_size"      : 256,
    "num_epochs"      : 100,

    "learning_rate"   : 1e-2,
    "weight_decay"    : 1e-4,
    "scheduler_gamma" : 0.99,

    "prune_threshold" : 0.2,
    "pecentage_model" : 0.05,
    "target_epoch"    : 20,
    "warmup_epochs"   : 10,

    "random_seed"     : seed,

    "resume"          : False,
    "resume_path"     : "models/20260501143226/MNIST_Acc0.9247_Loss0.24512626975774765_Epoch100_Remainding0.0587.pth",

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

transform = transforms.Compose([transforms.ToTensor(),
                                transforms.Normalize((0.1307,), (0.3081,))])

trainset = datasets.MNIST(root="./data", train=True , download=True, transform=transform)
validset = datasets.MNIST(root="./data", train=False, download=True, transform=transform)

trainloader = DataLoader(trainset, batch_size = config["batch_size"], shuffle = True )
validloader = DataLoader(validset, batch_size = config["batch_size"], shuffle = False)

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
resume_start_epoch = 0
epoch_run = 0

if resume_checkpoint_name is not None:
   model.load_state_dict(ckpt['model_state_dict'])
   optimize.load_state_dict(ckpt['optimizer_state_dict'])
   sched.load_state_dict(ckpt['scheduler_state_dict'])
   resume_start_epoch = int(ckpt.get("epoch", 0))

Remaining_fraction = 1.0

for epoch in range(resume_start_epoch, config['num_epochs']):
  model.train()
  epoch_train_loss = 0
  epoch_train_acc  = 0
  total_batches    = 0
  with tqdm(trainloader) as pbar:
    for i, (images, labels) in enumerate(pbar):
      images = images.view(-1, 28 * 28).to(device)
      optimize.zero_grad()
      output = model(images)
      loss = loss_func(output, labels.to(device))
      loss.backward()
      optimize.step()

      accuracy = (output.argmax(dim=1) == labels.to(device)).float().mean()
      pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimize.param_groups[0]['lr'])

      epoch_train_loss += loss.item()
      epoch_train_acc  += accuracy.item()
      total_batches    += 1

  average_train_loss = epoch_train_loss / max(total_batches, 1)
  training_loss.append(average_train_loss)

  average_train_acc  = epoch_train_acc  / max(total_batches, 1)
  training_acc.append(average_train_acc)

  if(config["prune_threshold"] is not None):
    if (Remaining_fraction > config['pecentage_model']):
        Remaining_fraction  = model.prune_below_threshold(
          threshold      = config["prune_threshold"],
          epoch          = epoch,
          target_epoch   = config["target_epoch"],
          warmup_epochs  = config["warmup_epochs"],
          show_layer     = True
      )

  print(f"Total remaining fraction: {Remaining_fraction}")

  model.eval()
  val_loss = 0.0
  val_accuracy = 0.0
  with torch.no_grad():
      for images, labels in validloader:
          images = images.view(-1, 28 * 28).to(device)
          output = model(images)
          val_loss += loss_func(output, labels.to(device)).item()
          val_accuracy += ((output.argmax(dim=1) == labels.to(device)).float().mean().item())
  val_loss /= len(validloader)
  val_accuracy /= len(validloader)

  testing_loss.append(val_loss)
  testing_acc.append(val_accuracy)

  sched.step()
  epoch_run += 1
  print(f"Epoch {epoch_run}, Val Loss: {val_loss}, Val Accuracy: {val_accuracy}\n")

  if epoch_run > config["target_epoch"]:
    checkpoint_path = f'{model_dir}/MNIST_Acc{val_accuracy:.4f}_Loss{val_loss:.4f}_Epoch{epoch_run}_Remainding{Remaining_fraction:.4f}.pth'
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
  
