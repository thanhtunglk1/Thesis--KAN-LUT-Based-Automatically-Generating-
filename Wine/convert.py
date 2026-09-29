import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

import sys, json, os

import matplotlib.pyplot as plt
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
from KAN_LUT import KAN_LUT
from quant import QuantBrevitasActivation, ScalarBiasScale

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(device)

is_cuda = device == "cuda"

model_tag = 202607041449591
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

###########################################################################################
wine = load_wine()
X_all = wine.data           # [N, 13]
y_all = wine.target         # {0,1,2}

X_tr_raw, X_te_raw, y_tr, y_te = train_test_split(
    X_all, y_all, test_size=0.3, random_state=config['random_seed'], shuffle=True, stratify=y_all
)

scaler = StandardScaler()
X_tr = scaler.fit_transform(X_tr_raw); X_te = scaler.transform(X_te_raw)

X_tr_t = torch.from_numpy(X_tr).float().to(device)
X_te_t = torch.from_numpy(X_te).float().to(device)
y_tr_t = torch.from_numpy(y_tr).float().long().to(device)
y_te_t = torch.from_numpy(y_te).float().long().to(device)

validloader = DataLoader(TensorDataset(X_te_t, y_te_t), batch_size=config["batch_size"], shuffle=False)

all_x = []
all_y = []

for inputs, labels in validloader:
    all_x.append(inputs)
    all_y.append(labels)

x_test = torch.cat(all_x, dim=0)
y_test = torch.cat(all_y, dim=0)

###########################################################################################

bn_in = nn.BatchNorm1d(config['layers'][0])
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data  , 0)

input_bias = ScalarBiasScale(scale = False, bias = True, bias_init = -0.25)

first_layer_quant = QuantHardTanh(
    bit_width           = config['layers_width'][0],
    quant_type          = QuantType.INT,
    return_quant_tensor = False,
    min_val             = config['grid_range'][0],
    max_val             = config['grid_range'][1],
    act_scaling_impl    = ParameterScaling(1.33),
    signed              = True,
    narrow_range        = False
    )

input_layer = QuantBrevitasActivation(brevitas_module = first_layer_quant, 
                                            pre_transforms = [bn_in, input_bias],
                                            cuda = device=="cuda").to(device)

kan_lut = KAN_LUT(model_dir, checkpoint, config, input_layer, device)

kan_lut.quick_match_check(n = 10)

kan_lut.generate_firmware(bram=False, adder_tree=True, n_adder=4, levels_per_stage=1)

# kan_lut.random_test_vector(n_vectors=10)

kan_lut.test_from_dataset(x_test, y_test)