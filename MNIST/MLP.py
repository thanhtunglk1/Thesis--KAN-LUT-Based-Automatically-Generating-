import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import transforms, datasets

from torch.utils.data import DataLoader
from tqdm import tqdm

transform = transforms.Compose([transforms.ToTensor(), 
                                transforms.Normalize((0.1307,), (0.3081,))])

trainset = datasets.MNIST(root="./data", train=True , download=True, transform=transform)
validset = datasets.MNIST(root="./data", train=False, download=True, transform=transform)

batchsize = 512

trainloader = DataLoader(trainset, batch_size = batchsize, shuffle = True )
validloader = DataLoader(validset, batch_size = batchsize, shuffle = False)

model = nn.Sequential(
    nn.Linear(28 * 28, 64, bias = True),
    nn.ReLU(),
    nn.Linear(64, 10, bias = True)
    )

if torch.cuda.is_available(): device = "cuda"
else: device = "cpu"

print(f"{device}")

model.to(device)

optimize = optim.AdamW(model.parameters(), lr = 2e-3, weight_decay = 1e-6)
sched = optim.lr_scheduler.ExponentialLR(optimize, gamma=0.8)
loss_func = nn.CrossEntropyLoss()

epochs = 50

for epoch in range(epochs):
    model.train()
    with tqdm(trainloader) as pbar:
        for x,y in pbar:
            x,y = x.view(-1,784).to(device), y.to(device)
            #x,y = x.to(device), y.to(device)
            optimize.zero_grad(); out=model(x); loss=loss_func(out,y)
            loss.backward(); optimize.step()
            acc=(out.argmax(1)==y).float().mean()
            pbar.set_postfix(loss=loss.item(), acc=acc.item(), lr=optimize.param_groups[0]['lr'])
    model.eval(); vl,va=0,0
    with torch.no_grad():
        for x,y in validloader:
            x,y=x.view(-1,784).to(device),y.to(device)
            out=model(x); vl+=loss_func(out,y).item(); va+=(out.argmax(1)==y).float().mean().item()
    print(f"Epoch {epoch+1}, Val Loss: {vl/len(validloader)}, Val Acc: {va/len(validloader)}")
    sched.step()

# Epoch 50, Val Loss: 0.09834192153066397, Val Acc: 0.9699103862047196