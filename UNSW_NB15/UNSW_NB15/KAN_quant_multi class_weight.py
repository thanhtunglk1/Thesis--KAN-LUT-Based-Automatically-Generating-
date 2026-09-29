import torch
import torch.nn as nn
import torch.optim as optim
#from torchvision import transforms, datasets

import sys, json, os, glob, re
import numpy as np
import pandas as pd
#import matplotlib.pyplot as plt
from datetime import datetime

from torch.utils.data import DataLoader, TensorDataset
from tqdm import tqdm

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity, QuantHardTanh

from sklearn.utils.class_weight import compute_class_weight

sys.path.append('../common')
from KAN_Quant import KANQuant
from quant import QuantBrevitasActivation, ScalarBiasScale
from os_path import find_latest_epoch, plot_and_save_results

####################################################################

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(device)

seed = 1
torch.manual_seed(seed)
np.random.seed(seed)

config = {
    "layers"          : [42, 32, 16, 10],
    "grid_range"      : [-8, 8],
    "layers_width"    : [4, 6, 8, 8],

    "grid_size"       : 7,
    "spline_order"    : 3,
    "grid_eps"        : 0.05,
    "base_activation" : "nn.SiLU" ,

    "batch_size"      : 256,
    "num_epochs"      : 50,

    "learning_rate"   : 1e-2,
    "weight_decay"    : 1e-3,
    "scheduler_gamma" : 0.9,

    "prune_threshold" : None,
    "target_epoch"    : 30,
    "warmup_epochs"   : 10,

    "random_seed"     : seed,

    "resume"          : False,
    "resume_path"     : ""

}

if config.get("resume", False):
   resume_checkpoint_name = find_latest_epoch(config.get("resume_path", "models"))
else: 
   resume_checkpoint_name = None
   
if resume_checkpoint_name is None:
   print(f"Resume requested but no checkpoint found at {config.get('resume_path', 'models')}. Starting fresh.")
   #model_dir  = f'models/{datetime.now().strftime("%d-%m-%Y_%H-%M-%S")}'
   model_dir  = f'models/{datetime.now().strftime("multi%Y%m%d%H%M%Sweight")}'
else:
   print(f"Resuming from checkpoint: {resume_checkpoint_name}") 
   model_dir = os.path.dirname(resume_checkpoint_name)
   ckpt = torch.load(resume_checkpoint_name, map_location=device)

os.makedirs(model_dir, exist_ok = True)

with open(f'{model_dir}/config.json', "w") as f: json.dump(config, f, indent=2)

####################################################################

train_df = pd.read_csv("output/train_split_multi.csv")
test_df  = pd.read_csv("output/valid_split_multi.csv")

X_tr = train_df.drop(columns=["attack_cat"]).values
y_tr = train_df["attack_cat"].values

X_te = test_df.drop(columns=["attack_cat"]).values
y_te = test_df["attack_cat"].values

X_tr_t = torch.from_numpy(X_tr).float().to(device)
y_tr_t = torch.from_numpy(y_tr).long().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_te_t = torch.from_numpy(y_te).long().to(device)

print(f"in_features={X_tr_t.shape[1]}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Data Loaders ===
trainloader = DataLoader(TensorDataset(X_tr_t, y_tr_t), batch_size=config["batch_size"], shuffle=True )
validloader = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=config["batch_size"], shuffle=False)

# === Class Weight ===

classes = np.unique(y_tr)
class_weights = compute_class_weight(class_weight="balanced", classes=classes, y=y_tr)
class_weights = torch.tensor(class_weights, dtype=torch.float32).to(device)

print("Classes:", classes)
print("Class weights:", class_weights)

# === KAN Train ===

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

input_layer = QuantBrevitasActivation(brevitas_module = first_layer_quant, 
                                            pre_transforms = [input_bias],
                                            cuda = device=="cuda").to(device)

model = KANQuant(config = config, input_layer = input_layer, device = device).to(device)

optimize = optim.AdamW(model.parameters(), lr = config['learning_rate'], weight_decay = config['weight_decay'])
sched = optim.lr_scheduler.ExponentialLR(optimize, gamma = config['scheduler_gamma'])
loss_func = nn.CrossEntropyLoss(weight=class_weights)

# Khởi tạo tracking lịch sử train
training_loss, testing_loss = [], []
training_acc, testing_acc = [], []
resume_start_epoch = 0
epoch_run = 0

if resume_checkpoint_name is not None:
    model.load_state_dict(ckpt['model_state_dict'])
    optimize.load_state_dict(ckpt['optimizer_state_dict'])
    sched.load_state_dict(ckpt['scheduler_state_dict'])
    resume_start_epoch = int(ckpt.get("epoch", 0))

# ======================================================
# Vòng lặp Huấn luyện (Training Loop)
# ======================================================
for epoch in range(resume_start_epoch, config['num_epochs']):
    model.train()
    epoch_train_loss = 0
    epoch_train_acc = 0
    total_batches = 0

    with tqdm(trainloader, desc=f"Epoch {epoch+1}/{config['num_epochs']}") as pbar:
        for inputs, labels in trainloader:
            inputs, labels = inputs.to(device), labels.to(device)
            
            optimize.zero_grad()
            output = model(inputs)
            loss = loss_func(output, labels)
            loss.backward()
            optimize.step()

            with torch.no_grad():
                accuracy = (output.argmax(dim=1) == labels).float().mean()
                pbar.set_postfix(
                    loss=loss.item(),
                    accuracy=accuracy.item(),
                    lr=optimize.param_groups[0]['lr']
                )
                pbar.update(1)

            epoch_train_loss += loss.item()
            epoch_train_acc += accuracy.item()
            total_batches += 1

    # Lưu metric sau mỗi epoch train
    average_train_loss = epoch_train_loss / max(total_batches, 1)
    average_train_acc = epoch_train_acc / max(total_batches, 1)
    training_loss.append(average_train_loss)
    training_acc.append(average_train_acc)

    # Cơ chế Pruning (nếu có cấu hình)
    if config["prune_threshold"] is not None:
        Remaining_fraction = model.prune_below_threshold(
            threshold=config["prune_threshold"],
            epoch=epoch,
            target_epoch=config["target_epoch"],
            warmup_epochs=config["warmup_epochs"],
            show_layer=True
        )
    else:
        Remaining_fraction = 1.0

    print(f"Total remaining fraction: {Remaining_fraction:.4f}")

    # ======================================================
    # Đánh giá (Validation)
    # ======================================================
    model.eval()
    val_loss = 0.0
    val_accuracy = 0.0

    with torch.no_grad():
        for inputs, labels in validloader:
            inputs, labels = inputs.to(device), labels.to(device)
            output = model(inputs)
            val_loss += loss_func(output, labels).item()
            val_accuracy += (output.argmax(dim=1) == labels).float().mean().item()

    val_loss /= len(validloader)
    val_accuracy /= len(validloader)

    testing_loss.append(val_loss)
    testing_acc.append(val_accuracy)
    
    sched.step()
    epoch_run += 1
    print(f"Epoch {epoch_run} Finished -> Val Loss: {val_loss:.4f}, Val Accuracy: {val_accuracy:.4f}\n")

    # Lưu checkpoint nếu vượt quá target_epoch
    if epoch_run > config["target_epoch"]:
        checkpoint_path = (
            f'{model_dir}/IDSM_Acc{val_accuracy:.4f}_Loss{val_loss:.4f}_'
            f'Epoch{epoch_run}_Remaining{Remaining_fraction:.4f}.pth'
        )
        torch.save({
             'epoch': epoch_run,
             'model_state_dict': model.state_dict(),
             'optimizer_state_dict': optimize.state_dict(),
             'scheduler_state_dict': sched.state_dict(),
             'val_accuracy': val_accuracy,
             'val_loss': val_loss,
             'remaining_fraction': Remaining_fraction,
        }, checkpoint_path)

log_data = {
    "train_acc": training_acc,
    "val_acc": testing_acc,
    "train_loss": training_loss,
    "val_loss": testing_loss
}

with open(f"{model_dir}/KANQuant_training_log.json", "w") as f:
    json.dump(log_data, f)

plot_and_save_results(training_acc, testing_acc, training_loss, testing_loss, model_dir, "KANQuant")