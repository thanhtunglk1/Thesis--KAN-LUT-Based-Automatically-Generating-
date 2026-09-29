import json
import os
import joblib
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.feature_selection import VarianceThreshold
from sklearn.impute import SimpleImputer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, MinMaxScaler

class UNSWNB15Preprocessor:

    def __init__(
        self,
        output_dir="output",
        rare_threshold=0.01,
        variance_threshold=0.001,
        top_k_features=32,
        validation_size=0.2,
        random_state=1,
    ):
        self.output_dir = output_dir
        self.rare_threshold = rare_threshold
        self.variance_threshold = variance_threshold
        self.top_k_features = top_k_features
        self.validation_size = validation_size
        self.random_state = random_state

        os.makedirs(output_dir, exist_ok=True)

        self.target_encoder = LabelEncoder()
        self.imputer = SimpleImputer(strategy="median")
        self.scaler = MinMaxScaler(feature_range=(-1, 1), clip=False)
        self.variance_selector = None

        self.categorical_columns = ["proto", "service", "state"]
        self.log_columns = [
            "dur", "sbytes", "dbytes", "rate", "sload", "dload",
            "sinpkt", "dinpkt", "sjit", "djit", "stcpb", "dtcpb",
            "response_body_len"
        ]

        self.kept_categories = {}
        self.onehot_columns = []
        self.numeric_columns = []
        self.selected_features = []
        self.scale_columns = []
        self.is_fitted = False

    # =========================================================
    # HELPER: HIỂN THỊ THÔNG TIN
    # =========================================================

    def print_shape(self, name, X):
        print(f"[INFO] {name}: shape={X.shape}")

    def print_columns(self, name, X, max_cols=15):
        cols = X.columns.tolist()
        print(f"[INFO] {name}: {len(cols)} features")
        if len(cols) <= max_cols: print(f"       {cols}")
        else                    : print(f"       {cols[:max_cols]} ...")

    def print_memory(self, name, X):
        memory_mb = X.memory_usage(deep=True).sum() / 1024**2
        print(f"[INFO] {name}: memory={memory_mb:.2f} MB")

    # =========================================================
    # BASIC CLEANING
    # =========================================================

    def clean(self, df, remove_duplicates=False):
        df = df.copy()
        df.columns = df.columns.str.strip()

        if "id" in df.columns:
            df.drop(columns=["id"], inplace=True)

        if "service" in df.columns:
            df["service"] = df["service"].replace("-", "unknown")

        df = df.replace([np.inf, -np.inf], np.nan)

        if remove_duplicates:
            df = df.drop_duplicates()

        return df.reset_index(drop=True)

    # =========================================================
    # TARGET
    # =========================================================

    def fit_target(self, y):
        self.target_encoder.fit(y)

    def transform_target(self, y):
        return self.target_encoder.transform(y)

    # =========================================================
    # CATEGORICAL
    # =========================================================

    def fit_categories(self, X):
        for col in self.categorical_columns:
            if col not in X.columns:
                continue

            freq = X[col].value_counts(normalize=True, dropna=False)
            self.kept_categories[col] = freq[freq >= self.rare_threshold].index.tolist()

    def apply_categories(self, X):
        X = X.copy()
        for col in self.categorical_columns:
            if col not in X.columns:
                continue

            kept = self.kept_categories.get(col, [])
            X[col] = X[col].fillna("unknown")
            X[col] = X[col].where(X[col].isin(kept), "other")

        return X

    # =========================================================
    # ONE HOT
    # =========================================================

    def fit_one_hot(self, X):
        cols = [c for c in self.categorical_columns if c in X.columns]
        X = pd.get_dummies(X, columns=cols, dtype=np.float32)
        self.onehot_columns = X.columns.tolist()
        return X

    def apply_one_hot(self, X):
        cols = [c for c in self.categorical_columns if c in X.columns]
        X = pd.get_dummies(X, columns=cols, dtype=np.float32)
        return X.reindex(columns=self.onehot_columns, fill_value=0)

    # =========================================================
    # IMPUTATION
    # =========================================================

    def fit_imputer(self, X):
        self.numeric_columns = X.select_dtypes(include=np.number).columns.tolist()
        self.imputer.fit(X[self.numeric_columns])

    def apply_imputer(self, X):
        X = X.copy()
        if self.numeric_columns:
            X[self.numeric_columns] = self.imputer.transform(X[self.numeric_columns])
        return X

    # =========================================================
    # FEATURE ENGINEERING
    # =========================================================

    def feature_engineering(self, X):
        X = X.copy()
        ratios = {
            "byte_ratio": ("sbytes", "dbytes"),
            "pkt_ratio": ("spkts", "dpkts"),
            "load_ratio": ("sload", "dload"),
            "sbytes_per_pkt": ("sbytes", "spkts"),
            "dbytes_per_pkt": ("dbytes", "dpkts"),
        }

        for name, (a, b) in ratios.items():
            if {a, b}.issubset(X.columns):
                X[name] = (X[a] + 1.0) / (X[b] + 1.0)

        return X

    # =========================================================
    # LOG TRANSFORMATION
    # =========================================================

    def log_transform(self, X):
        X = X.copy()
        for col in self.log_columns:
            if col in X.columns:
                X[col] = np.log1p(X[col].clip(lower=0))
        return X

    # =========================================================
    # NUMERIC
    # =========================================================

    def ensure_numeric(self, X):
        X = X.copy()
        for col in X.columns:
            X[col] = pd.to_numeric(X[col], errors="coerce")
        return X

    # =========================================================
    # VARIANCE
    # =========================================================

    def fit_variance(self, X):
        self.variance_selector = VarianceThreshold(self.variance_threshold)
        self.variance_selector.fit(X)

    def apply_variance(self, X):
        columns = X.columns[self.variance_selector.get_support()]
        return X[columns]

    # =========================================================
    # FEATURE SELECTION
    # =========================================================

    def fit_feature_selection(self, X, y):
        print(f"    X shape: {X.shape}")
        print(f"    y shape: {y.shape}")
        if len(X) != len(y):
            raise ValueError(
                f"Feature selection: X và y không cùng số dòng! "
                f"X={len(X)}, y={len(y)}"
            )
        if self.top_k_features is None:
            self.selected_features = X.columns.tolist()
            print("    Random Forest feature selection: BYPASSED")
            print(f"    Using all {len(self.selected_features)} features")
            return
    
        k = min(self.top_k_features, X.shape[1])
        print(f"    Number of input features: {X.shape[1]}")
        print(f"    Selecting top K         : {k}")

        rf = RandomForestClassifier(
            n_estimators=300,
            random_state=self.random_state,
            n_jobs=-1,
            max_features="sqrt"
        )
        print("    Training Random Forest...")
        rf.fit(X, y)
        print("    Random Forest completed.")

        importance = pd.Series(rf.feature_importances_, index=X.columns).sort_values(ascending=False)
        self.selected_features = importance.head(k).index.tolist()

        print("\n    Selected features:")

        for i, feature in enumerate(self.selected_features, start=1):
            print(
                f"      {i:02d}. {feature:<30} "
                f"importance={importance[feature]:.6f}"
            )

    def apply_feature_selection(self, X):
        return X[self.selected_features]

    # =========================================================
    # SCALER
    # =========================================================

    def fit_scaler(self, X):
        self.scale_columns = X.columns.tolist()
        self.scaler.fit(X[self.scale_columns])

    def apply_scaler(self, X):
        X = X.copy()
        X[self.scale_columns] = self.scaler.transform(X[self.scale_columns])
        # X[self.scale_columns] = X[self.scale_columns].clip(-1, 1)
        return X.astype(np.float32)

    # =========================================================
    # COMPLETE FIT & TRANSFORM
    # =========================================================

    def fit(self, X, y):

        print("\n" + "=" * 70)
        print("                FIT PREPROCESSOR")
        print("=" * 70)

        print(f"[INFO] Input X shape : {X.shape}")
        print(f"[INFO] Target size   : {len(y)}")
        print(f"[INFO] Target classes: {pd.Series(y).nunique()}")
        print(f"[INFO] Classes       : {sorted(pd.Series(y).unique())}")

        # ---------------------------------------------------------
        # 1. CLEANING
        # ---------------------------------------------------------

        if len(X) != len(y): raise ValueError(
            f"X và y không cùng số dòng: "
            f"X={len(X)}, y={len(y)}"
        )
    
        # print("\n[1] BASIC CLEANING")

        # X_before = X.shape

        # X = self.clean(X, remove_duplicates=True)

        # print(f"    Before cleaning : {X_before}")
        # print(f"    After cleaning  : {X.shape}")

        # ---------------------------------------------------------
        # 2. TARGET
        # ---------------------------------------------------------
        print("\n[1] TARGET ENCODING")

        self.fit_target(y)

        print(f"    Number classes : {len(self.target_encoder.classes_)}")
        print(f"    Classes        : {list(self.target_encoder.classes_)}")

        # ---------------------------------------------------------
        # 3. CATEGORICAL
        # ---------------------------------------------------------
        print("\n[2] CATEGORICAL FEATURES")

        self.fit_categories(X)
        X = self.apply_categories(X)

        for col in self.categorical_columns:
            if col in self.kept_categories:
                kept = self.kept_categories[col]

                print(
                    f"    {col:<10}: "
                    f"{len(kept)} categories kept"
                )

                print(f"               {kept}")

        # ---------------------------------------------------------
        # 4. ONE HOT
        # ---------------------------------------------------------
        print("\n[3] ONE-HOT ENCODING")

        before_onehot = X.shape

        X = self.fit_one_hot(X)

        print(f"    Before one-hot : {before_onehot}")
        print(f"    After one-hot  : {X.shape}")
        print(f"    Features       : {len(self.onehot_columns)}")

        # ---------------------------------------------------------
        # 5. IMPUTATION
        # ---------------------------------------------------------
        print("\n[4] IMPUTATION")

        self.fit_imputer(X)

        missing_before = X[self.numeric_columns].isna().sum().sum()

        X = self.apply_imputer(X)

        missing_after = X[self.numeric_columns].isna().sum().sum()

        print(f"    Numeric features : {len(self.numeric_columns)}")
        print(f"    Missing before   : {missing_before}")
        print(f"    Missing after    : {missing_after}")

        # ---------------------------------------------------------
        # 6. FEATURE ENGINEERING
        # ---------------------------------------------------------
        print("\n[5] FEATURE ENGINEERING")
        before_fe = X.shape[1]
        X = self.feature_engineering(X)
        after_fe = X.shape[1]

        print(f"    Features before : {before_fe}")
        print(f"    Features after  : {after_fe}")
        print(f"    New features    : {after_fe - before_fe}")

        new_features = [c for c in X.columns if c not in self.onehot_columns]

        if new_features: print(f"    Added features  : {new_features}")

        # ---------------------------------------------------------
        # 7. LOG TRANSFORMATION
        # ---------------------------------------------------------
        print("\n[6] LOG TRANSFORMATION")

        log_applied = [
            col for col in self.log_columns
            if col in X.columns
        ]

        X = self.log_transform(X)

        print(f"    Log features: {len(log_applied)}")
        print(f"    Columns     : {log_applied}")

        # ---------------------------------------------------------
        # 8. ENSURE NUMERIC
        # ---------------------------------------------------------
        print("\n[7] NUMERIC CONVERSION")
        X = self.ensure_numeric(X)

        print(f"    Shape: {X.shape}")
        print(f"    Dtype: {X.dtypes.value_counts().to_dict()}")

        # ---------------------------------------------------------
        # 9. VARIANCE THRESHOLD
        # ---------------------------------------------------------
        print("\n[8] VARIANCE FEATURE SELECTION")
        before_variance = X.shape[1]

        self.fit_variance(X)
        X = self.apply_variance(X)
        after_variance = X.shape[1]

        print(f"    Before : {before_variance} features")
        print(f"    After  : {after_variance} features")
        print(f"    Removed: {before_variance - after_variance} features")
        print(f"    Threshold: {self.variance_threshold}")

        # ---------------------------------------------------------
        # 10. RANDOM FOREST FEATURE SELECTION
        # ---------------------------------------------------------
        print("\n[9] RANDOM FOREST FEATURE SELECTION")

        y_encoded = self.transform_target(y)

        self.fit_feature_selection(X, y_encoded)

        print(f"    Before selection : {X.shape[1]} features")
        print(f"    Selected         : {len(self.selected_features)} features")
        print(f"    Top-K            : {self.top_k_features}")

        print("\n    Selected features:")
        for i, feature in enumerate(self.selected_features, start=1):
            print(f"      {i:02d}. {feature}")

        X = self.apply_feature_selection(X)

        # ---------------------------------------------------------
        # 11. SCALING
        # ---------------------------------------------------------
        print("\n[10] MIN-MAX SCALING")
        self.fit_scaler(X)

        print(f"    Features : {len(self.scale_columns)}")
        print(f"    Range    : [-1, 1]")
        print(f"    Clip     : True")

        # ---------------------------------------------------------
        # FINISH
        # ---------------------------------------------------------
        self.is_fitted = True

        print("\n" + "=" * 70)
        print("              FIT COMPLETED")
        print("=" * 70)

        print(f"[INFO] Final features: {len(self.selected_features)}")
        print(f"[INFO] Classes       : {len(self.target_encoder.classes_)}")
        print(f"[INFO] Fitted        : {self.is_fitted}")

        return self

    def transform(self, X):
        if not self.is_fitted: raise RuntimeError("Preprocessor has not been fitted.")

        print("\n[TRANSFORM]")
        print(f"    Input shape: {X.shape}")
        X = self.clean(X, remove_duplicates=False)
        print(f"    After cleaning        : {X.shape}")
        X = self.apply_categories(X)
        print(f"    After categories      : {X.shape}")
        X = self.apply_one_hot(X)
        print(f"    After one-hot         : {X.shape}")
        X = self.apply_imputer(X)
        print(f"    After imputation      : {X.shape}")
        X = self.feature_engineering(X)
        print(f"    After feature eng.    : {X.shape}")
        X = self.log_transform(X)
        print(f"    After log transform   : {X.shape}")
        X = self.ensure_numeric(X)
        print(f"    After numeric         : {X.shape}")
        X = self.apply_variance(X)
        print(f"    After variance        : {X.shape}")
        X = self.apply_feature_selection(X)
        print(f"    After feature select. : {X.shape}")
        X = self.apply_scaler(X)  
        print(f"    After scaling         : {X.shape}")
        print(f"    Final dtype           : {X.dtypes.unique()}")

        return X

    # =========================================================
    # TRAIN / DEMO PIPELINES
    # =========================================================

    def preprocess_train(self, train_df, test_df):
        print("\n" + "=" * 70)
        print("              UNSW-NB15 PREPROCESSING")
        print("=" * 70)

        print("\n[DATASET INFORMATION]")
        print(f"    Original train shape : {train_df.shape}")
        print(f"    Original test shape  : {test_df.shape}")

        print("\n[ORIGINAL DATA]")
        print(f"Train: {train_df.shape}")
        print(f"Test : {test_df.shape}")

        print("\nOriginal train class distribution:")
        print(train_df["attack_cat"].value_counts())

        # ---------------------------------------------------------
        # CLEAN DATA
        # ---------------------------------------------------------
        print("\n[CLEANING DATA]")

        train_before_rows = len(train_df)
        test_before_rows  = len(test_df)

        train_before_cols = train_df.shape[1]
        test_before_cols  = test_df.shape[1]

        train_df = self.clean(train_df, remove_duplicates=False)
        test_df  = self.clean(test_df , remove_duplicates=False)

        print("\n[AFTER CLEANING]")

        print(
            f"Train rows: "
            f"{train_before_rows:,} → {len(train_df):,}"
        )

        print(
            f"Train cols: "
            f"{train_before_cols} → {train_df.shape[1]}"
        )

        print(
            f"Test rows: "
            f"{test_before_rows:,} → {len(test_df):,}"
        )

        print(
            f"Test cols: "
            f"{test_before_cols} → {test_df.shape[1]}"
        )

        # ---------------------------------------------------------
        # TRAIN / VALIDATION SPLIT
        # ---------------------------------------------------------
        print("\n[TRAIN / VALIDATION SPLIT]")

        train_df, val_df = train_test_split(
            train_df,
            test_size=self.validation_size,
            random_state=self.random_state,
            stratify=train_df["attack_cat"]
        )

        print(f"    Train      : {train_df.shape}")
        print(f"    Validation : {val_df.shape}")
        print(f"    Test       : {test_df.shape}")

        print(
            f"    Validation ratio: "
            f"{self.validation_size:.2f}"
        )

        print("\n[AFTER TRAIN / VALIDATION SPLIT]")

        print(f"Train      : {len(train_df):,}")
        print(f"Validation : {len(val_df):,}")
        print(f"Test       : {len(test_df):,}")

        print("\nTrain distribution:")
        print(train_df["attack_cat"].value_counts().sort_index())

        print("\nValidation distribution:")
        print(val_df["attack_cat"].value_counts().sort_index())


        # ---------------------------------------------------------
        # TARGET
        # ---------------------------------------------------------
        y_train_raw = train_df["attack_cat"]
        y_val_raw = val_df["attack_cat"]
        y_test_raw = test_df["attack_cat"]

        print("\n[TARGET DISTRIBUTION]")

        print("\n    Train:")
        print(y_train_raw.value_counts())

        print("\n    Validation:")
        print(y_val_raw.value_counts())

        print("\n    Test:")
        print(y_test_raw.value_counts())

        # ---------------------------------------------------------
        # REMOVE TARGET COLUMNS
        # ---------------------------------------------------------
        drop_cols = ["attack_cat", "label"]

        X_train_raw = train_df.drop(columns=drop_cols, errors="ignore")
        X_val_raw   = val_df.drop(columns=drop_cols, errors="ignore")
        X_test_raw  = test_df.drop(columns=drop_cols, errors="ignore")

        print("\n[FEATURE DATA]")
        print(f"    X_train_raw : {X_train_raw.shape}")
        print(f"    X_val_raw   : {X_val_raw.shape}")
        print(f"    X_test_raw  : {X_test_raw.shape}")

        # ---------------------------------------------------------
        # FIT PREPROCESSOR
        # ---------------------------------------------------------
        print("\n" + "-" * 70)
        print("FITTING PREPROCESSOR ON TRAINING DATA ONLY")
        print("-" * 70)

        self.fit(X_train_raw, y_train_raw)

        # ---------------------------------------------------------
        # TRANSFORM
        # ---------------------------------------------------------
        print("\n" + "-" * 70)
        print("TRANSFORMING DATASETS")
        print("-" * 70)

        print("\n[TRANSFORM TRAIN]")
        X_train = self.transform(X_train_raw)
        print(f"    Result: {X_train.shape}")

        print("\n[TRANSFORM VALIDATION]")
        X_val = self.transform(X_val_raw)
        print(f"    Result: {X_val.shape}")

        print("\n[TRANSFORM TEST]")
        X_test = self.transform(X_test_raw)
        print(f"    Result: {X_test.shape}")

        # ---------------------------------------------------------
        # TARGET ENCODING
        # ---------------------------------------------------------
        y_train = self.transform_target(y_train_raw)
        y_val = self.transform_target(y_val_raw)
        y_test = self.transform_target(y_test_raw)

        print("\n[TARGET ENCODING]")
        print(f"    y_train: {y_train.shape}")
        print(f"    y_val  : {y_val.shape}")
        print(f"    y_test : {y_test.shape}")

        # ---------------------------------------------------------
        # FINAL SUMMARY
        # ---------------------------------------------------------
        print("\n" + "=" * 70)
        print("                  FINAL SUMMARY")
        print("=" * 70)

        print(f"    Train      : X={X_train.shape}, y={y_train.shape}")
        print(f"    Validation : X={X_val.shape}, y={y_val.shape}")
        print(f"    Test       : X={X_test.shape}, y={y_test.shape}")

        print(f"\n    Number of classes : {len(self.target_encoder.classes_)}")
        print(f"    Number of features: {len(self.selected_features)}")
        print(f"    Feature range     : [-1, 1]")
        print(f"    Data type         : float32")

        print("\n    Classes:")
        for i, cls in enumerate(self.target_encoder.classes_):
            print(f"      {i}: {cls}")

        # ---------------------------------------------------------
        # SAVE
        # ---------------------------------------------------------
        print("\n[SAVING DATA]")

        self.save_processed_data(
            X_train, y_train,
            X_val  ,  y_val ,
            X_test , y_test
        )

        self.save_artifacts()

        print("\n" + "=" * 70)
        print("             PREPROCESSING COMPLETED")
        print("=" * 70)

        return (X_train, y_train,
                X_val  , y_val  ,
                X_test , y_test
        )

    def preprocess_demo(self, raw_sample):
        if not self.is_fitted:
            raise RuntimeError("Load fitted preprocessing artifacts first.")

        raw_sample = raw_sample.copy()
        X_demo = raw_sample.drop(columns=["attack_cat", "label"], errors="ignore")
        return self.transform(X_demo)

    # =========================================================
    # SAVE / LOAD
    # =========================================================

    def save_artifacts(self):
        joblib.dump(self, os.path.join(self.output_dir, "preprocessing_artifacts.joblib"))

        metadata = {
            "dataset": "UNSW-NB15",
            "num_classes": len(self.target_encoder.classes_),
            "num_features": len(self.selected_features),
            "selected_features": self.selected_features,
            "input_range": [-1, 1],
            "dtype": "float32",
            "rare_threshold": self.rare_threshold,
            "variance_threshold": self.variance_threshold,
            "top_k_features": self.top_k_features,
            "random_state": self.random_state,
        }

        with open(os.path.join(self.output_dir, "metadata.json"), "w", encoding="utf-8") as f:
            json.dump(metadata, f, indent=4, ensure_ascii=False)

    @classmethod
    def load_artifacts(cls, path):
        return joblib.load(path)

    def save_processed_data(self, X_train, y_train, X_val, y_val, X_test, y_test):
        datasets = [
            ("train_split_multi.csv", X_train, y_train),
            ("valid_split_multi.csv", X_val, y_val),
            ("test_multi.csv", X_test, y_test),
        ]

        for filename, X, y in datasets:
            df = X.copy()
            df["attack_cat"] = y
            path = os.path.join(self.output_dir, filename)
            df.to_csv(path, index=False)
            print(f"Saved: {path}")

# Load dữ liệu
train_df = pd.read_csv("dataset/UNSW_NB15_training-set.csv")
test_df = pd.read_csv("dataset/UNSW_NB15_testing-set.csv")

# Tạo preprocessor
preprocessor = UNSWNB15Preprocessor(
    output_dir="output",
    rare_threshold=0.001,
    variance_threshold=0.001,
    top_k_features=48,
    validation_size=0.2,
    random_state=1
)

# Tiền xử lý
X_train, y_train, X_val, y_val, X_test, y_test = preprocessor.preprocess_train(train_df, test_df)