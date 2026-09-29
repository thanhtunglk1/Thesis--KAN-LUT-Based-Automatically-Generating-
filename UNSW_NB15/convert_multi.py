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
test_df = pd.read_csv("output/valid_split_multi.csv")
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
                                      pre_transforms  = [bn_in, input_bias],
                                      cuda            = device=="cuda").to(device)

kan_lut = KAN_LUT(model_dir, checkpoint, config, input_layer, device)

#=== Convert ===#
kan_lut.quick_match_check()
kan_lut.generate_firmware(bram=False, adder_tree=True, n_adder=4, levels_per_stage=2)
kan_lut.random_test_vector(n_vectors=400, hex_gen=True)