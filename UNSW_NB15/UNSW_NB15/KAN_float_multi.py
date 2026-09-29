import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

import sys, json
import numpy as np
import pandas as pd

from torch.utils.data import DataLoader, TensorDataset
from tqdm import tqdm

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
import matplotlib.pyplot as plt
import seaborn as sns

sys.path.append('../common')
from KAN_OG import KAN
from os_path import plot_and_save_results, plot_confusion_matrix

# model_dir = f'models/20260501143226'

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

seed = 1
if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(device)

train_df = pd.read_csv("output/train_split_multi.csv")
valid_df = pd.read_csv("output/valid_split_multi.csv")
test_df  = pd.read_csv("output/test_multi.csv")

X_tr   = train_df.drop(columns=["attack_cat"]).values
y_tr   = train_df["attack_cat"].values

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

for cls, target in over_strategy.items():
    original_count = counts[np.where(classes == cls)[0][0]]
    print(f"{str(cls):15s}: {original_count:,} → {target:,}")


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

X_va   = valid_df.drop(columns=["attack_cat"]).values
y_va   = valid_df["attack_cat"].values
X_va_t = torch.from_numpy(X_va).float().to(device)
y_va_t = torch.from_numpy(y_va).long().to(device)

X_te   = test_df.drop(columns=["attack_cat"]).values
y_te   = test_df["attack_cat"].values
X_te_t = torch.from_numpy(X_te).float().to(device)
y_te_t = torch.from_numpy(y_te).long().to(device)


print(f"in_features={X_tr_t.shape[1]}, trainN={len(y_tr)}, testN={len(y_te)}")

# === Data Loaders ===
trainloader = DataLoader(TensorDataset(X_tr_t, y_tr_t), batch_size=256, shuffle=True )
validloader = DataLoader(TensorDataset(X_va_t, y_va_t), batch_size=256, shuffle=False)
testloader  = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=256, shuffle=False)

model = KAN([42,64,32,10], grid_range=[-8,8], grid_size=20, spline_order=7, base_activation=nn.SiLU, enable_scale_spline=True)
model.to(device)

optimize = optim.AdamW(model.parameters(), lr = 1e-3, weight_decay = 1e-4)
# optimize = optim.SGD(model.parameters(), lr = 1e-3, weight_decay = 1e-4)
sched = optim.lr_scheduler.ExponentialLR(optimize, gamma=0.95)
loss_func = nn.CrossEntropyLoss()

epochs = 50
epoch_run = 0

training_loss = []
testing_loss  = []
training_acc  = []
testing_acc   = []

for epoch in range(epochs):
    model.train()
    epoch_train_loss = 0
    epoch_train_acc = 0
    total_batches = 0

    with tqdm(trainloader, desc=f"Epoch {epoch+1}/{epochs}") as pbar:
        for inputs, labels in pbar:
            inputs, labels = inputs.to(device), labels.to(device)
            optimize.zero_grad()
            output = model(inputs)
            loss = loss_func(output, labels)
            loss.backward()
            optimize.step()

            accuracy = (output.argmax(dim=1) == labels).float().mean()
            pbar.set_postfix(loss=loss.item(),accuracy=accuracy.item(),lr=optimize.param_groups[0]['lr'])

            epoch_train_loss += loss.item()
            epoch_train_acc += accuracy.item()
            total_batches += 1

    average_train_loss = epoch_train_loss / max(total_batches, 1)
    average_train_acc = epoch_train_acc / max(total_batches, 1)
    training_loss.append(average_train_loss)
    training_acc.append(average_train_acc)

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
# log_data = {
#     "train_acc" : training_acc,
#     "val_acc"   : testing_acc,
#     "train_loss": training_loss,
#     "val_loss"  : testing_loss
# }

# with open(f"{model_dir}/KANQuant_training_log.json", "w") as f: json.dump(log_data, f)

plot_and_save_results(training_acc, testing_acc, training_loss, testing_loss, "output", "KanFloat")
# plot_confusion_matrix(model, validloader, device, model_dir, "KanFloat")

#=== Confusion matrix & Metrics ===#
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

class_names = [id_to_name[i]for i in range(len(id_to_name))]

# Predict validation set
model.eval()

all_preds = []
all_labels = []

with torch.no_grad():
    for inputs, labels in testloader:
    # for inputs, labels in validloader:
        inputs = inputs.to(device)
        labels = labels.to(device)
        outputs = model(inputs)
        preds = torch.argmax(outputs,dim=1)

        all_preds.extend(preds.cpu().numpy())
        all_labels.extend(labels.cpu().numpy())

all_preds  = np.array(all_preds)
all_labels = np.array(all_labels)

# Basic Metrics
accuracy = accuracy_score(all_labels, all_preds)

precision = precision_score(
    all_labels,
    all_preds,
    average="weighted",
    zero_division=0
)

recall = recall_score(
    all_labels,
    all_preds,
    average="weighted",
    zero_division=0
)

f1 = f1_score(
    all_labels,
    all_preds,
    average="weighted",
    zero_division=0
)

# Confusion Matrix
cm = confusion_matrix(all_labels, all_preds)
cm_df = pd.DataFrame(cm,index=class_names,columns=class_names)
print(cm_df)

# False Positive Rate
# Multi-class One-vs-Rest
FP = cm.sum(axis=0) - np.diag(cm)
FN = cm.sum(axis=1) - np.diag(cm)
TP = np.diag(cm)
TN = cm.sum() - (FP + FN + TP)

FPR_each_class = FP / (FP + TN + 1e-12)
FPR = np.mean(FPR_each_class)

# Classification Report
report = classification_report(
    all_labels,
    all_preds,
    target_names=class_names,
    digits=4,
    zero_division=0
)

# Print Metrics
print("\n==============================")
print("KANQuant Final Evaluation")
print("==============================")
print(f"Accuracy  : {accuracy:.4f}")
print(f"Precision : {precision:.4f}")
print(f"Recall/DR : {recall:.4f}")
print(f"F1-score  : {f1:.4f}")
print(f"FPR       : {FPR:.6f}")

print("\nClassification Report")
print(report)

log_file = "output/evaluation_metrics.txt"

with open(log_file, "w", encoding="utf-8") as f:

    f.write("==============================\n")
    f.write("KANQuant Final Evaluation\n")
    f.write("==============================\n")

    f.write(f"Accuracy  : {accuracy:.4f}\n")
    f.write(f"Precision : {precision:.4f}\n")
    f.write(f"Recall/DR : {recall:.4f}\n")
    f.write(f"F1-score  : {f1:.4f}\n")
    f.write(f"FPR       : {FPR:.6f}\n")

    f.write("\n==============================\n")
    f.write("FPR Each Class\n")
    f.write("==============================\n")

    for class_name, fpr_value in zip(class_names, FPR_each_class):
        f.write(f"{class_name:<30}: {fpr_value:.6f}\n")

    f.write("\n==============================\n")
    f.write("Confusion Matrix\n")
    f.write("==============================\n")

    f.write(cm_df.to_string())
    f.write("\n")

    f.write("\n==============================\n")
    f.write("Classification Report\n")
    f.write("==============================\n")

    f.write(report)

# Plot Confusion Matrix
plt.figure(figsize=(16, 14))

sns.heatmap(
    cm,
    annot=True,
    fmt="d",
    cmap="Blues",
    xticklabels=class_names,
    yticklabels=class_names,
    annot_kws={
        "size": 16,      # Kích thước số trong ô
        "weight": "bold"
    },
    linewidths=0.5,
    linecolor="gray",
    cbar_kws={
        "label": "Number of Samples"
    }
)

plt.xlabel(
    "Predicted Label",
    fontsize=18,
    fontweight="bold",
    labelpad=12
)

plt.ylabel(
    "True Label",
    fontsize=18,
    fontweight="bold",
    labelpad=12
)

plt.title(
    "KAN Float Confusion Matrix",
    fontsize=22,
    fontweight="bold",
    pad=20
)

plt.xticks(
    fontsize=15,
    rotation=45,
    ha="right",
    fontweight="bold"
)

plt.yticks(
    fontsize=15,
    rotation=0,
    fontweight="bold"
)

# Font của colorbar
cbar = plt.gca().collections[0].colorbar
cbar.ax.tick_params(labelsize=14)
cbar.set_label(
    "Number of Samples",
    fontsize=16,
    fontweight="bold"
)

plt.tight_layout()

plt.savefig(
    f"output/KAN_Float_confusion_matrix_counts.png",
    dpi=300,
    bbox_inches="tight"
)

plt.close()


# ============================
# Normalized Confusion Matrix
# ============================
cm_normalized = cm.astype(float) / (
    cm.sum(axis=1, keepdims=True) + 1e-12
)

plt.figure(figsize=(16, 14))

sns.heatmap(
    cm_normalized,
    annot=True,
    fmt=".2f",
    cmap="Blues",
    xticklabels=class_names,
    yticklabels=class_names,
    vmin=0,
    vmax=1,
    annot_kws={
        "size": 16,      # Kích thước số trong ô
        "weight": "bold"
    },
    linewidths=0.5,
    linecolor="gray",
    cbar_kws={
        "label": "Normalized Value"
    }
)

plt.xlabel(
    "Predicted Label",
    fontsize=18,
    fontweight="bold",
    labelpad=12
)

plt.ylabel(
    "True Label",
    fontsize=18,
    fontweight="bold",
    labelpad=12
)

plt.title(
    "KAN Float Normalized Confusion Matrix",
    fontsize=22,
    fontweight="bold",
    pad=20
)

plt.xticks(
    fontsize=15,
    rotation=45,
    ha="right",
    fontweight="bold"
)

plt.yticks(
    fontsize=15,
    rotation=0,
    fontweight="bold"
)

# Font của colorbar
cbar = plt.gca().collections[0].colorbar
cbar.ax.tick_params(labelsize=14)
cbar.set_label(
    "Normalized Value",
    fontsize=16,
    fontweight="bold"
)

plt.tight_layout()

plt.savefig(
    f"output/KAN_Float_confusion_matrix_normalized.png",
    dpi=300,
    bbox_inches="tight"
)

plt.close()
