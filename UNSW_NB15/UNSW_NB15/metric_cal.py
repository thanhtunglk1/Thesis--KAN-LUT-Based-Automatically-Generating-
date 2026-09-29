import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

import numpy as np
import pandas as pd

import sys, json, os

import matplotlib.pyplot as plt
from datetime import datetime

from torch.utils.data import DataLoader, TensorDataset

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity, QuantHardTanh

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
from KAN_LUT import KAN_LUT
from quant import QuantBrevitasActivation, ScalarBiasScale

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"
is_cuda = device == "cuda"
print(device)

model_tag = "final"
model_dir = f"models/{model_tag}"

with open(os.path.join(model_dir, "config.json"), "r") as f: config = json.load(f)

try:
    file_path = next(
        os.path.join(model_dir, f)
        for f in os.listdir(model_dir)
        if f.endswith(".pth")
    )

    checkpoint = torch.load(file_path, map_location=device)
    print("Loaded:", file_path)

except StopIteration:
    raise FileNotFoundError(f"No model checkpoint files found in '{model_dir}' folder.")

#=== Valid data load ===#
# test_df = pd.read_csv("output/valid_split_multi.csv")
test_df = pd.read_csv("output/test_multi.csv")
X_te = test_df.drop(columns=["attack_cat"]).values
y_te = test_df["attack_cat"].values

X_te_t = torch.from_numpy(X_te).float().to(device)
y_te_t = torch.from_numpy(y_te).long().to(device)

validloader = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=config["batch_size"], shuffle=False)

#=== Model build ===#
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
                                      pre_transforms  = [bn_in,input_bias],
                                      cuda            = device=="cuda").to(device)

kan_lut = KAN_LUT(model_dir, checkpoint, config, input_layer, device)

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
model = kan_lut.KAN.to(device)
model.eval()

all_preds = []
all_labels = []

with torch.no_grad():
    for inputs, labels in validloader:
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

# False Positive Rate
# Multi-class One-vs-Rest
FP = cm.sum(axis=0) - np.diag(cm)
FN = cm.sum(axis=1) - np.diag(cm)
TP = np.diag(cm)
TN = cm.sum() - (FP + FN + TP)

FPR_each_class = FP / (FP + TN + 1e-12)
FPR = np.mean(FPR_each_class)

# Print Metrics
print("\n==============================")
print("KANQuant Final Evaluation")
print("==============================")
print(f"Accuracy  : {accuracy:.4f}")
print(f"Precision : {precision:.4f}")
print(f"Recall/DR : {recall:.4f}")
print(f"F1-score  : {f1:.4f}")
print(f"FPR       : {FPR:.6f}")

# Classification Report
report = classification_report(
    all_labels,
    all_preds,
    target_names=class_names,
    digits=4,
    zero_division=0
)
print("\nClassification Report")
print(report)

# Save Classification Report
with open(f"{model_dir}/classification_report.txt", "w") as f:f.write(report)

# Plot Confusion Matrix
plt.figure(figsize=(12,10))

sns.heatmap(
    cm,
    annot=True,
    fmt="d",
    cmap="Blues",
    xticklabels=class_names,
    yticklabels=class_names
)


plt.xlabel("Predicted Label")
plt.ylabel("True Label")
plt.title("KANQuant Confusion Matrix")
plt.xticks(rotation=45, ha="right")
plt.yticks(rotation=0)
plt.tight_layout()

cm_path = (f"{model_dir}/KANQuant_confusion_matrix.png")
plt.savefig(cm_path, dpi=300, bbox_inches="tight")
plt.close()

# Save Confusion Matrix CSV
cm_df = pd.DataFrame(cm, index=class_names, columns=class_names)
cm_df.to_csv(f"{model_dir}/KANQuant_confusion_matrix.csv")

# ============================
# Save Final Metrics JSON
# ============================

final_metrics = {
    "Accuracy"           :float(accuracy),
    "Precision"          :float(precision),
    "Recall_DR"          :float(recall),
    "F1_score"           :float(f1),
    "False_Positive_Rate":float(FPR)
}

with open(f"{model_dir}/KANQuant_final_metrics.json", "w") as f:
    json.dump(final_metrics, f, indent=4)


print("\nSaved:")
print(f"- {cm_path}")
print(f"- {model_dir}/KANQuant_confusion_matrix.csv")
print(f"- {model_dir}/KANQuant_final_metrics.json")