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

def create_balanced_subset(dataset, N, seed=None):
    if seed is not None:
        random.seed(seed)

    # Gom index theo class
    class_indices = {i: [] for i in range(10)}

    for idx, (_, label) in enumerate(dataset):
        class_indices[label].append(idx)

    # Random N ảnh mỗi class
    selected_indices = []

    for class_id in range(10):
        if len(class_indices[class_id]) < N:
            raise ValueError(
                f"Class {class_id} không đủ {N} ảnh."
            )

        selected_indices.extend(
            random.sample(class_indices[class_id], N)
        )

    return Subset(dataset, selected_indices)

validset_n = create_balanced_subset(validset, N=100, seed=seed)

validloader = DataLoader(validset_n, batch_size=1024, shuffle=False)
x, y        = next(iter(validloader))

##########################################################################################

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

kan_lut.generate_firmware(bram=False, adder_tree=True, n_adder=4, levels_per_stage=2)

# kan_lut.random_test_vector(n_vectors=10)
kan_lut.test_from_dataset(x, y, hex_gen=True)
