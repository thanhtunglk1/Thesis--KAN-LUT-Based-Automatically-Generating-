import numpy as np
import pandas as pd

from sklearn.preprocessing import StandardScaler


# =====================================
# Configuration
# =====================================

INPUT_FILE = "processed_signal.csv"

OUTPUT_FEATURE_FILE = "time_features_16.csv"
OUTPUT_SCALED_FILE  = "time_features_16_scaled.csv"

WINDOW_SIZE = 1024


# =====================================
# Load dataset
# =====================================

df = pd.read_csv(INPUT_FILE)


signal_columns = [
    f"x{i}" for i in range(1, WINDOW_SIZE + 1)
]


# =====================================
# Feature extraction
# =====================================

def extract_features(signal):

    x = np.asarray(signal, dtype=np.float64)

    eps = 1e-12

    # F1 RMS
    F1 = np.sqrt(np.mean(x**2))

    # F2 Mean
    F2 = np.mean(x)

    # F3 Absolute Mean
    F3 = np.mean(np.abs(x))

    # F4 Mean Square
    F4 = np.mean(x**2)

    # F5 Root Amplitude
    F5 = (np.mean(np.sqrt(np.abs(x))))**2

    # F6 Peak
    F6 = np.max(np.abs(x))

    # F7 Peak-to-Peak
    F7 = np.max(x)-np.min(x)

    # F8 Variance
    F8 = np.var(x, ddof=1)

    # F9 Standard deviation
    F9 = np.sqrt(F8)

    # F10 Third moment
    F10 = np.mean(x**3)

    # F11 Fourth moment
    F11 = np.mean(x**4)

    # F12 Shape factor
    F12 = F1/(F3+eps)

    # F13 Impulse factor
    F13 = F6/(F3+eps)

    # F14 Crest factor
    F14 = F6/(F1+eps)

    # F15 Skewness coefficient
    F15 = F10/((F9+eps)**3)

    # F16 Kurtosis coefficient
    F16 = F11/((F9+eps)**4)

    return [
        F1,F2,F3,F4,
        F5,F6,F7,F8,
        F9,F10,F11,F12,
        F13,F14,F15,F16
    ]

# =====================================
# Extract features
# =====================================

feature_rows = []

for _, row in df.iterrows():

    signal = row[signal_columns].values

    f = extract_features(signal)

    feature_rows.append({
        "sample_id": row["sample_id"],
        "source": row["source"],
        "class": row["class"],
        "label": row["label"],

        "F1_RMS": f[0],
        "F2_Mean": f[1],
        "F3_AbsMean": f[2],
        "F4_MeanSquare": f[3],

        "F5_RootAmplitude": f[4],

        "F6_Peak": f[5],
        "F7_PeakToPeak": f[6],

        "F8_Variance": f[7],
        "F9_Std": f[8],

        "F10_ThirdMoment": f[9],
        "F11_FourthMoment": f[10],

        "F12_ShapeFactor": f[11],
        "F13_ImpulseFactor": f[12],
        "F14_CrestFactor": f[13],

        "F15_SkewnessCoeff": f[14],
        "F16_KurtosisCoeff": f[15]
    })


# DataFrame
feature_df = pd.DataFrame(feature_rows)

# =====================================
# Save raw features
# =====================================

feature_df.to_csv(
    OUTPUT_FEATURE_FILE,
    index=False
)

print("Raw feature shape:", feature_df.shape)

# =====================================
# StandardScaler
# =====================================

feature_columns = [
    col for col in feature_df.columns
    if col.startswith("F")
]

scaler = StandardScaler()

scaled_features = scaler.fit_transform(feature_df[feature_columns])

scaled_df = pd.DataFrame(scaled_features, columns=feature_columns)

# giữ metadata

scaled_df.insert(0, "sample_id" , feature_df["sample_id"])
scaled_df.insert(1, "source"    , feature_df["source"]   )
scaled_df.insert(2, "class"     , feature_df["class"]    )
scaled_df.insert(3, "label"     , feature_df["label"]    )

scaled_df.to_csv( OUTPUT_SCALED_FILE, index=False)
print("Scaled feature shape:", scaled_df.shape)

print("\nSaved:")
print(OUTPUT_FEATURE_FILE)
print(OUTPUT_SCALED_FILE)

print("\nPreview:")
print(scaled_df.head())