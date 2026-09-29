import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

import sys, json

from torch.utils.data import DataLoader
from tqdm import tqdm

sys.path.append('../common')
from KAN_OG import KAN
from os_path import plot_and_save_results, plot_confusion_matrix

model_dir = f'models/final'

transform = transforms.Compose([transforms.ToTensor(), 
                                transforms.Normalize((0.1307,), (0.3081,))])

trainset = datasets.MNIST(root="./data", train=True , download=True, transform=transform)
validset = datasets.MNIST(root="./data", train=False, download=True, transform=transform)

batchsize = 512

trainloader = DataLoader(trainset, batch_size = batchsize, shuffle = True )
validloader = DataLoader(validset, batch_size = batchsize, shuffle = False)

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(device)

bn_in = nn.BatchNorm1d(28 * 28)
nn.init.constant_(bn_in.weight.data, 1)
nn.init.constant_(bn_in.bias.data  , 0)

model = nn.Sequential(
    bn_in,
    KAN([28 * 28, 64, 10], grid_range=[-8,8], grid_size=5, spline_order=3, base_activation=nn.SiLU, enable_scale_spline=True)
)

model.to(device)

optimize = optim.AdamW(model.parameters(), lr = 2e-3, weight_decay = 1e-6)
# optimize = optim.SGD(model.parameters(), lr = 1e-3, weight_decay = 1e-4)
sched = optim.lr_scheduler.ExponentialLR(optimize, gamma=0.8)
loss_func = nn.CrossEntropyLoss()

epochs = 50

training_loss = []
testing_loss  = []
training_acc  = []
testing_acc   = []

for epoch in range(epochs):
    model.train()
    epoch_train_loss = 0
    epoch_train_acc  = 0
    total_batches    = 0
    with tqdm(trainloader) as pbar:
        for x,y in pbar:
            x,y = x.view(-1,784).to(device), y.to(device)
            #x,y = x.to(device), y.to(device)
            optimize.zero_grad(); out=model(x); loss=loss_func(out,y)
            loss.backward(); optimize.step()
            acc=(out.argmax(1)==y).float().mean()
            pbar.set_postfix(loss=loss.item(), acc=acc.item(), lr=optimize.param_groups[0]['lr'])

            epoch_train_loss += loss.item()
            epoch_train_acc  += acc.item()
            total_batches    += 1

    average_train_loss = epoch_train_loss / max(total_batches, 1)
    training_loss.append(average_train_loss)

    average_train_acc  = epoch_train_acc  / max(total_batches, 1)
    training_acc.append(average_train_acc)

    model.eval(); vl,va=0,0
    with torch.no_grad():
        for x,y in validloader:
            x,y=x.view(-1,784).to(device),y.to(device)
            out=model(x); vl+=loss_func(out,y).item(); va+=(out.argmax(1)==y).float().mean().item()
    
    vl /= len(validloader)
    va /= len(validloader)
    testing_loss.append(vl)
    testing_acc.append(va)
    print(f"Epoch {epoch+1}, Val Loss: {vl}, Val Acc: {va}\n")
    sched.step()

# log_data = {
#     "train_acc" : training_acc,
#     "val_acc"   : testing_acc,
#     "train_loss": training_loss,
#     "val_loss"  : testing_loss
# }

# with open(f"{model_dir}/KANQuant_training_log.json", "w") as f: json.dump(log_data, f)

plot_and_save_results(training_acc, testing_acc, training_loss, testing_loss, model_dir, "KanFloat")
plot_confusion_matrix(model, validloader, device, model_dir, "KanFloat")

# Epoch 50, Val Loss: 0.09723133444786072, Val Acc: 0.9710477948188782