import os
import numpy as np
import pandas as pd

from scipy.io import loadmat
from sklearn.preprocessing import StandardScaler

# ==========================
# Configuration
# ==========================
DATA_PATH = "CWRU_12k_DE_Load0"

WINDOW_SIZE = 512
OVERLAP = 0.25
STEP = int(WINDOW_SIZE*(1-OVERLAP))

classes = {
    "Normal": 0,
    "Ball"  : 1,
    "Inner" : 2,
    "Outer" : 3
}

# ==========================
# Read .mat file
# ==========================

def load_DE_signal(filepath):
    mat = loadmat(filepath)
    key = [k for k in mat.keys() if "DE_time" in k][0]
    return mat[key].flatten()

# ==========================
# Signal preprocessing
# ==========================

def preprocess_signal(signal):
    # Remove DC component
    signal = signal - np.mean(signal)

    # Standardization
    scaler = StandardScaler()
    signal = scaler.fit_transform(
        signal.reshape(-1,1)
    ).flatten()
    return signal

# ==========================
# Create windows
# ==========================

def create_windows(signal):
    windows=[]
    for start in range(0, len(signal)-WINDOW_SIZE+1, STEP):
        windows.append(signal[start:start+WINDOW_SIZE])
    return np.array(windows)

# ==========================
# Main processing
# ==========================

dataset=[]
sample_id=0
class_count={
    "Normal":0,
    "Ball"  :0,
    "Inner" :0,
    "Outer" :0
}

for class_name,label in classes.items():
    folder=os.path.join(DATA_PATH, class_name)

    for file in os.listdir(folder):
        if file.endswith(".mat"):
            print("Processing:",file)
            filepath=os.path.join(folder,file)

            # 1. Load signal
            signal=load_DE_signal(filepath)

            # 2. Preprocessing
            signal=preprocess_signal(signal)

            # 3. Windowing
            windows=create_windows(signal)

            # 4. Save samples
            for w in windows:
                row={}
                row["sample_id"] = sample_id
                row["source"]    = file
                row["class"]     = class_name
                row["label"]     = label

                for i,value in enumerate(w):
                    row[f"x{i+1}"]=value

                dataset.append(row)
                sample_id+=1
                # đếm số mẫu sau preprocessing
                class_count[class_name]+=1

# ==========================
# Export CSV
# ==========================
df=pd.DataFrame(dataset)
df.to_csv("processed_signal.csv", index=False)

# ==========================
# Dataset information
# ==========================
print("\n===== Dataset summary =====")

for cls,count in class_count.items():
    print(f"{cls:8s}: {count} samples")

print("\nTotal samples:",len(df))

print("Dataset shape:",df.shape)

print("\nFirst samples:")
print(df.head())