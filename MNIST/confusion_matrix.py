import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

import sys, json, os, random

import matplotlib.pyplot as plt
from datetime import datetime

from torch.utils.data import DataLoader, Subset
from tqdm import tqdm

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity, QuantHardTanh

sys.path.append('../common')
from KAN_LUT import KAN_LUT
from quant import QuantBrevitasActivation, ScalarBiasScale
from os_path import plot_confusion_matrix

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(device)

is_cuda = device == "cuda"

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

seed = config["random_seed"]
torch.manual_seed(seed)

##########################################################################################
transform = transforms.Compose([transforms.ToTensor(),
                                transforms.Normalize((0.1307,), (0.3081,)),
                                transforms.Lambda(lambda x: x.flatten())])
validset = datasets.MNIST(root="./data", train=False, download=True, transform=transform)

validloader = DataLoader(validset, batch_size = config["batch_size"], shuffle = False)

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

MNIST_input_layer = QuantBrevitasActivation(brevitas_module = first_layer_quant, 
                                            pre_transforms = [bn_in, input_bias],
                                            cuda = device=="cuda").to(device)

kan_lut = KAN_LUT(model_dir, checkpoint, config, MNIST_input_layer, device)
kan_lut.quick_match_check()
model = kan_lut.KAN.to(device)

plot_confusion_matrix(model, validloader, device, model_dir, "KanQuant")