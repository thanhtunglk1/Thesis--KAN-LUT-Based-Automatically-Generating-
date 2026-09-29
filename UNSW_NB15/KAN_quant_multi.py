import torch
import torch.nn as nn
import torch.optim as optim
#from torchvision import transforms, datasets

import sys, json, os, glob, re, joblib
import numpy as np
import pandas as pd
#import matplotlib.pyplot as plt
from datetime import datetime

from torch.utils.data import DataLoader, TensorDataset
from tqdm import tqdm

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity, QuantHardTanh

from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler
from imblearn.pipeline import Pipeline as ImbPipeline

from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix,
    classification_report
)

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
    "layers"          : [42,64,32,10],
    "grid_range"      : [-8, 8],
    "layers_width"    : [6, 6, 6, 6],

    "grid_size"       : 20,
    "spline_order"    : 7,
    "grid_eps"        : 0.05,
    "base_activation" : "nn.SiLU" ,

    "batch_size"      : 256,
    "num_epochs"      : 100,

    "learning_rate"   : 1e-3,
    "weight_decay"    : 1e-3,
    "scheduler_gamma" : 0.9,

    "prune_threshold" : None,
    "pecentage_model" : 0.5,
    "target_epoch"    : 20,
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
   model_dir  = f'models/{datetime.now().strftime("multi%Y%m%d%H%M%S")}'
else:
   print(f"Resuming from checkpoint: {resume_checkpoint_name}") 
   model_dir = os.path.dirname(resume_checkpoint_name)
   ckpt = torch.load(resume_checkpoint_name, map_location=device)

os.makedirs(model_dir, exist_ok = True)

with open(f'{model_dir}/config.json', "w") as f: json.dump(config, f, indent=2)

####################################################################

train_df = pd.read_csv("output/train_split_multi.csv")
test_df  = pd.read_csv("output/valid_split_multi.csv")

X_tr   = train_df.drop(columns=["attack_cat"]).values
y_tr   = train_df["attack_cat"].values

id_to_name = {
    0: "Analysis",
    1: "Backdoor",
    2: "DoS",
    3: "Exploits",
    4: "Fuzzers",
    5: "Generic",
    6: "Normal",
    7: "Reconnaissance",
    8: "Shellcode",
    9: "Worms"
}

# under_strategy = {
#     6: 20_000, # Normal   44800 -> 20000
#     5: 18_000, # Generic  32000 -> 18000
#     3: 16_000, # Exploits 26714 -> 16000
# }

over_strategy = {
    0: 10_000, # Analysis  1600 -> 10000
    1: 10_000, # Backdoor  1397 -> 10000
    8: 10_000, # Shellcode  906 -> 10000
    9: 10_000, # Worms      104 -> 10000
}

# over_strategy = {
#     0: 44_800,
#     1: 44_800,
#     2: 44_800,
#     3: 44_800,
#     4: 44_800,
#     5: 44_800,
#     7: 44_800,
#     8: 44_800,
#     9: 44_800,
# } 

classes, counts = np.unique(y_tr, return_counts=True)
class_counts = dict(zip(classes.tolist(), counts.tolist()))

print("\nPhân bố train gốc:")
for cls, cnt in zip(classes, counts):
    print(f"{str(cls):15s}: {cnt:,}")

print(f"\nTổng số mẫu trước SMOTE: {len(y_tr):,}")

# for cls, target in under_strategy.items():
#     original_count = counts[np.where(classes == cls)[0][0]]
#     print(f"{str(cls):15s}: {original_count:,} → {target:,}")

for cls, target in over_strategy.items():
    original_count = counts[np.where(classes == cls)[0][0]]
    print(f"{str(cls):15s}: {original_count:,} → {target:,}")

# pipeline = ImbPipeline([
#     (
#         "under", RandomUnderSampler(
#             sampling_strategy=under_strategy,
#             random_state=seed
#         )
#     ), (
#         "over", SMOTE(
#             sampling_strategy=over_strategy,
#             k_neighbors=5,
#             random_state=seed
#         )
#     )
# ])
smote = SMOTE(
    sampling_strategy=over_strategy,
    k_neighbors=5,
    random_state=seed
)

classes_before, counts_before = np.unique(y_tr, return_counts=True)
before_dict = dict(zip(classes_before, counts_before))

# X_tr, y_tr = pipeline.fit_resample(X_tr, y_tr)
X_tr, y_tr = smote.fit_resample(X_tr, y_tr)
classes_after, counts_after = np.unique(y_tr, return_counts=True)
after_dict = dict(zip(classes_after, counts_after))

print("\nPhân bố train sau resampling:")
for cls, cnt in zip(classes_after, counts_after):
    print(f"{id_to_name.get(int(cls), str(cls)):15s}: {cnt:,}")
print(f"\nTổng số mẫu train sau resampling: {len(y_tr):,}")

print("\nSO SÁNH TRƯỚC / SAU RESAMPLING")

print(
    f"\n{'Class':15s}"
    f"{'Before':>12s}"
    f"{'After':>12s}"
    f"{'Change':>12s}"
)

for cls in classes_before:
    before = before_dict[cls]
    after = after_dict.get(cls, 0)
    change = after - before

    print(
        f"{id_to_name.get(int(cls), str(cls)):15s}"
        f"{before:12,d}"
        f"{after:12,d}"
        f"{change:+12,d}"
    )

X_tr_t = torch.from_numpy(X_tr).float().to(device)
y_tr_t = torch.from_numpy(y_tr).long().to(device)

# X_tr_t = torch.from_numpy(X_tr.astype(np.float32)).to(device)
# y_tr_t = torch.from_numpy(y_tr.astype(np.int64)).to(device)

X_te   = test_df.drop(columns=["attack_cat"]).values
y_te   = test_df["attack_cat"].values
X_te_t = torch.from_numpy(X_te).float().to(device)
y_te_t = torch.from_numpy(y_te).long().to(device)

print(f"in_features={X_tr_t.shape[1]}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Data Loaders ===
trainloader = DataLoader(TensorDataset(X_tr_t, y_tr_t), batch_size=config["batch_size"], shuffle=True )
validloader = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=config["batch_size"], shuffle=False)

# === Class Weight ===

# artifacts     = joblib.load("output/preprocessing_artifacts.joblib")
# class_weights = artifacts["class_weights"]
# weights       = torch.tensor(
#     [class_weights[i] for i in range(len(class_weights))],
#     dtype=torch.float32,
#     device=device
# )

# === KAN Train ===
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

input_layer = QuantBrevitasActivation(brevitas_module = first_layer_quant, 
                                            pre_transforms = [bn_in, input_bias],
                                            cuda = device=="cuda").to(device)

model = KANQuant(config = config, input_layer = input_layer, device = device).to(device)

optimize = optim.AdamW(model.parameters(), lr = config['learning_rate'], weight_decay = config['weight_decay'])
sched = optim.lr_scheduler.ExponentialLR(optimize, gamma = config['scheduler_gamma'])
# loss_func = nn.CrossEntropyLoss(weight=weights)
loss_func = nn.CrossEntropyLoss()

# Khởi tạo tracking lịch sử train
training_loss, testing_loss = [], []
training_acc, testing_acc = [], []
resume_start_epoch = 0
epoch_run = 0

training_precision, testing_precision = [], []
training_recall, testing_recall = [], []
training_f1, testing_f1 = [], []

if resume_checkpoint_name is not None:
    model.load_state_dict(ckpt['model_state_dict'])
    optimize.load_state_dict(ckpt['optimizer_state_dict'])
    sched.load_state_dict(ckpt['scheduler_state_dict'])
    resume_start_epoch = int(ckpt.get("epoch", 0))

Remaining_fraction = 1.0

# === Training Loop ===
for epoch in range(resume_start_epoch, config['num_epochs']):
    model.train()
    epoch_train_loss = 0
    epoch_train_acc = 0
    total_batches = 0

    train_preds = []
    train_labels = []

    with tqdm(trainloader, desc=f"Epoch {epoch+1}/{config['num_epochs']}") as pbar:
        for inputs, labels in pbar:
            inputs, labels = inputs.to(device), labels.to(device)
            
            optimize.zero_grad()
            output = model(inputs)
            loss = loss_func(output, labels)
            loss.backward()
            optimize.step()
            
            preds = output.argmax(dim=1)
            train_preds.extend(preds.detach().cpu().numpy())
            train_labels.extend(labels.detach().cpu().numpy())

            # accuracy = (output.argmax(dim=1) == labels).float().mean()
            accuracy = (preds == labels).float().mean()

            pbar.set_postfix(loss=loss.item(), accuracy=accuracy.item(), lr=optimize.param_groups[0]['lr'])
            
            epoch_train_loss += loss.item()
            epoch_train_acc += accuracy.item()
            total_batches += 1

    average_train_loss = epoch_train_loss / max(total_batches, 1)
    # average_train_acc = epoch_train_acc / max(total_batches, 1)
    # training_loss.append(average_train_loss)
    # training_acc.append(average_train_acc)

    train_accuracy  = accuracy_score(train_labels, train_preds)
    train_precision = precision_score(train_labels, train_preds, average="macro", zero_division=0)
    train_recall    = recall_score(train_labels, train_preds, average="macro", zero_division=0)
    train_f1        = f1_score(train_labels, train_preds, average="macro", zero_division=0)

    # Lưu metric
    training_loss.append(average_train_loss)
    training_acc.append(train_accuracy)
    training_precision.append(train_precision)
    training_recall.append(train_recall)
    training_f1.append(train_f1)

    # === Pruning ===
    if(config["prune_threshold"] is not None):
        if (Remaining_fraction > config['pecentage_model']):
         Remaining_fraction  = model.prune_below_threshold(
          threshold      = config["prune_threshold"],
          epoch          = epoch,
          target_epoch   = config["target_epoch"],
          warmup_epochs  = config["warmup_epochs"],
          show_layer     = True
        )

    print(f"Total remaining fraction: {Remaining_fraction:.4f}")

    # === Validation ===
    model.eval()
    val_loss = 0.0
    val_accuracy = 0.0
    total_val_batches = 0

    val_preds = []
    val_labels = []

    with torch.no_grad():
        for inputs, labels in validloader:
            inputs, labels = inputs.to(device), labels.to(device)
            output = model(inputs)
            loss = loss_func(output, labels)
            preds = output.argmax(dim=1)
            # val_loss += loss_func(output, labels).item()
            # val_accuracy += (output.argmax(dim=1) == labels).float().mean().item()
            val_loss += loss.item()
            val_accuracy += (preds == labels).float().mean().item()

            total_val_batches += 1

            val_preds.extend(preds.cpu().numpy())
            val_labels.extend(labels.cpu().numpy())

    # val_loss /= len(validloader)
    # val_accuracy /= len(validloader)

    # testing_loss.append(val_loss)
    # testing_acc.append(val_accuracy)

    val_loss      = val_loss / max(total_val_batches, 1)
    val_accuracy  = accuracy_score(val_labels, val_preds)
    val_precision = precision_score(val_labels, val_preds, average="macro", zero_division=0)
    val_recall    = recall_score(val_labels, val_preds, average="macro", zero_division=0)
    val_f1        = f1_score(val_labels, val_preds, average="macro", zero_division=0)

    # Lưu metric
    testing_loss.append(val_loss)
    testing_acc.append(val_accuracy)
    testing_precision.append(val_precision)
    testing_recall.append(val_recall)
    testing_f1.append(val_f1)
    
    sched.step()
    epoch_run += 1
    # print(f"Epoch {epoch_run} Finished -> Val Loss: {val_loss:.4f}, Val Accuracy: {val_accuracy:.4f}\n")

    print(
        f"\nEpoch [{epoch_run}/{config['num_epochs']}]"
        f"\n"
        f"Train | "
        f"Loss: {average_train_loss:.4f} | "
        f"Acc: {train_accuracy:.4f} | "
        f"Precision: {train_precision:.4f} | "
        f"Recall: {train_recall:.4f} | "
        f"F1-Macro: {train_f1:.4f}"
        f"\n"
        f"Val   | "
        f"Loss: {val_loss:.4f} | "
        f"Acc: {val_accuracy:.4f} | "
        f"Precision: {val_precision:.4f} | "
        f"Recall: {val_recall:.4f} | "
        f"F1-Macro: {val_f1:.4f}"
        f"\n"
    )

    # Lưu checkpoint nếu vượt quá target_epoch
    if epoch_run > config["target_epoch"]:
        checkpoint_path = (
            f'{model_dir}/IDSM_Acc{val_accuracy:.4f}_Loss{val_loss:.4f}_'
            f'Preci{val_precision:.4f}_Recall{val_recall:.4f}_F1{val_f1:.4f}'
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