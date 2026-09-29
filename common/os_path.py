import torch, re, os, glob
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.metrics import confusion_matrix

def extract_epoch(file_path: str):
   pt_name = os.path.basename(file_path)
   m = re.search(r'Epoch(\d+)', pt_name)
   if m is not None: return int(m.group(1)) 
   else            : return -1
   
def find_latest_epoch(path_dir: str):
   if os.path.isfile(path_dir): return path_dir
   if os.path.isdir(path_dir) : 
      latest_epoch_file_name = sorted(glob.glob(os.path.join(path_dir,"*.pth")), 
                                 key=lambda p: (extract_epoch(p), p))
      return latest_epoch_file_name[-1] if latest_epoch_file_name else None
   
def extract_input_layer_params(bn_in, input_bias, mean = 0.0, variance = 1.0):
    # --- BatchNorm params ---
    mu    = bn_in.running_mean.detach()   
    var   = bn_in.running_var.detach()    
    gamma = bn_in.weight.detach()         
    beta  = bn_in.bias.detach()           
    eps   = bn_in.eps.detach()

    # --- Bias shift ---
    b = input_bias.bias.detach()          # scalar

    # --- Fold tất cả vào A, C ---
    std = torch.sqrt(var + eps)

    A = gamma / (std * variance)                             
    C = beta - (gamma * mu / std) - A * mean + b         

    return A, C
   
def plot_and_save_results(train_acc, val_acc, train_loss, val_loss, save_dir, name):
    # Tạo thư mục nếu chưa có
    os.makedirs(save_dir, exist_ok=True)
    
    epochs = range(1, len(train_acc) + 1)
    
    # Khởi tạo figure với 2 cột
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 6))
    
    # 1. Đồ thị Accuracy
    ax1.plot(epochs, train_acc, 'b-', linewidth=1.5, label='Training Acc')
    ax1.plot(epochs, val_acc, 'r-', linewidth=1.5, label='Validation Acc')
    ax1.set_title('Model Accuracy', fontsize=14, fontweight='bold')
    ax1.set_xlabel('Epochs')
    ax1.set_ylabel('Accuracy')
    ax1.legend()
    ax1.grid(True, linestyle='--', alpha=0.7)

    # 2. Đồ thị Loss
    ax2.plot(epochs, train_loss, 'b-', linewidth=1.5, label='Training Loss')
    ax2.plot(epochs, val_loss, 'r-', linewidth=1.5, label='Validation Loss')
    ax2.set_title('Model Loss', fontsize=14, fontweight='bold')
    ax2.set_xlabel('Epochs')
    ax2.set_ylabel('Loss')
    ax2.legend()
    ax2.grid(True, linestyle='--', alpha=0.7)

    plt.tight_layout()

    # Lưu hình ảnh - dpi 300 để đảm bảo độ nét khi đưa vào báo cáo
    save_path = os.path.join(save_dir, f'{name}_training_plots.png')
    plt.savefig(save_path, dpi=300, bbox_inches='tight')
    
    print(f"Figure saved at: {save_path}")
    plt.close()

def plot_confusion_matrix(model, dataloader, device, save_path, name):
    model.eval()
    all_preds = []
    all_labels = []
    
    with torch.no_grad():
        for images, labels in dataloader:
            images = images.view(-1, 28 * 28).to(device)
            outputs = model(images)
            preds = outputs.argmax(dim=1)
            
            all_preds.extend(preds.cpu().numpy())
            all_labels.extend(labels.numpy())

    # Tính toán ma trận
    cm = confusion_matrix(all_labels, all_preds)
    
    # Vẽ biểu đồ
    plt.figure(figsize=(10, 8))
    sns.heatmap(cm, annot=True, fmt='d', cmap='Blues', 
                xticklabels=range(10), yticklabels=range(10))
    plt.xlabel('Predicted Label')
    plt.ylabel('True Label')
    plt.title(f'Confusion Matrix - {name}')
    
    # Lưu và hiển thị
    plt.savefig(f"{save_path}/{name}_confusion_matrix.png")
    plt.close()