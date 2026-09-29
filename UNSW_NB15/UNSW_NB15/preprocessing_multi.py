import os, json, joblib
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, MinMaxScaler
from sklearn.impute import SimpleImputer
from sklearn.feature_selection import VarianceThreshold
from sklearn.ensemble import RandomForestClassifier
from sklearn.utils.class_weight import compute_class_weight


class UNSWNB15MLPPreprocessor:
    def __init__(self, train_path, test_path, output_dir="output",
                 rare_threshold=0.01, variance_threshold=0.001,
                 top_k_features=20, validation_size=0.15, random_state=42):
        self.train_path, self.test_path = train_path, test_path
        self.output_dir = output_dir
        self.rare_threshold = rare_threshold
        self.variance_threshold = variance_threshold
        self.top_k_features = top_k_features
        self.validation_size = validation_size
        self.random_state = random_state
        os.makedirs(output_dir, exist_ok=True)

        self.target_encoder = LabelEncoder()
        self.imputer = SimpleImputer(strategy="median")
        self.scaler = MinMaxScaler(feature_range=(-1, 1), clip=True)

        self.categorical_columns = ["proto", "service", "state"]
        self.log_columns = [
            "dur", "sbytes", "dbytes", "rate", "sload", "dload",
            "sinpkt", "dinpkt", "sjit", "djit", "stcpb", "dtcpb",
            "response_body_len"
        ]

        self.numeric_columns = []
        self.scale_columns = []
        self.kept_categories = {}
        self.onehot_columns = []
        self.selected_features = []
        self.variance_selector = None
        self.class_weights = None

    def load_data(self):
        train = pd.read_csv(self.train_path)
        test = pd.read_csv(self.test_path)
        print(f"Train: {train.shape} | Test: {test.shape}")
        return train, test

    def clean_data(self, df):
        df = df.copy()
        df.columns = df.columns.str.strip()
        if "id" in df.columns:
            df.drop(columns="id", inplace=True)
        if "service" in df.columns:
            df["service"] = df["service"].replace("-", "unknown")
        df = df.replace([np.inf, -np.inf], np.nan).drop_duplicates()
        return df.reset_index(drop=True)

    def split_train_validation(self, df):
        train, val = train_test_split(
            df, test_size=self.validation_size,
            random_state=self.random_state,
            stratify=df["attack_cat"]
        )
        return train.reset_index(drop=True), val.reset_index(drop=True)

    def encode_target(self, train, val, test):
        self.target_encoder.fit(train["attack_cat"])
        classes = set(self.target_encoder.classes_)

        for name, df in [("Validation", val), ("Test", test)]:
            unknown = set(df["attack_cat"]) - classes
            if unknown:
                raise ValueError(f"{name} contains unseen attack classes: {unknown}")

        y_train = self.target_encoder.transform(train["attack_cat"])
        y_val = self.target_encoder.transform(val["attack_cat"])
        y_test = self.target_encoder.transform(test["attack_cat"])

        print("Class mapping:")
        for i, name in enumerate(self.target_encoder.classes_):
            print(f"{i:2d} -> {name}")

        return y_train, y_val, y_test

    def remove_target(self, df):
        return df.drop(columns=[c for c in ["attack_cat", "label"] if c in df.columns])

    def fit_categories(self, X):
        for col in self.categorical_columns:
            if col in X.columns:
                freq = X[col].value_counts(normalize=True, dropna=False)
                self.kept_categories[col] = freq[freq >= self.rare_threshold].index.tolist()

    def apply_categories(self, X):
        X = X.copy()
        for col in self.categorical_columns:
            if col in X.columns:
                kept = self.kept_categories.get(col, [])
                X[col] = X[col].fillna("unknown")
                X[col] = X[col].where(X[col].isin(kept), "other")
        return X

    def fit_one_hot(self, X):
        cols = [c for c in self.categorical_columns if c in X.columns]
        X = pd.get_dummies(X, columns=cols, dtype=np.float32)
        self.onehot_columns = X.columns.tolist()
        return X

    def apply_one_hot(self, X):
        cols = [c for c in self.categorical_columns if c in X.columns]
        X = pd.get_dummies(X, columns=cols, dtype=np.float32)
        return X.reindex(columns=self.onehot_columns, fill_value=0)

    def fit_imputer(self, X):
        self.numeric_columns = X.select_dtypes(include=np.number).columns.tolist()
        self.imputer.fit(X[self.numeric_columns])

    def apply_imputer(self, X):
        X = X.copy()
        if self.numeric_columns:
            X[self.numeric_columns] = self.imputer.transform(X[self.numeric_columns])
        return X

    def feature_engineering(self, X):
        X = X.copy()
        ratios = {
            "byte_ratio": ("sbytes", "dbytes"),
            "pkt_ratio": ("spkts", "dpkts"),
            "load_ratio": ("sload", "dload"),
            "sbytes_per_pkt": ("sbytes", "spkts"),
            "dbytes_per_pkt": ("dbytes", "dpkts")
        }

        for name, (a, b) in ratios.items():
            if {a, b}.issubset(X.columns):
                X[name] = (X[a] + 1.0) / (X[b] + 1.0)

        return X

    def log_transform(self, X):
        X = X.copy()
        for col in self.log_columns:
            if col in X.columns:
                X[col] = np.log1p(X[col].clip(lower=0))
        return X

    def ensure_numeric(self, X):
        X = X.copy()
        for col in X.columns:
            X[col] = pd.to_numeric(X[col], errors="coerce")
        return X

    def fit_variance_selector(self, X):
        self.variance_selector = VarianceThreshold(self.variance_threshold)
        self.variance_selector.fit(X)
        print(f"Variance filtering: {X.shape[1]} -> "
              f"{self.variance_selector.get_support().sum()} features")

    def apply_variance_selector(self, X):
        cols = X.columns[self.variance_selector.get_support()]
        return X[cols]

    def feature_selection(self, X_train, y_train, X_val, X_test):
        k = min(self.top_k_features, X_train.shape[1])

        rf = RandomForestClassifier(
            n_estimators=300,
            random_state=self.random_state,
            n_jobs=-1,
            class_weight="balanced",
            max_features="sqrt"
        )
        rf.fit(X_train, y_train)

        importance = pd.Series(
            rf.feature_importances_, index=X_train.columns
        ).sort_values(ascending=False)

        self.selected_features = importance.head(k).index.tolist()

        print("Selected features:")
        for i, feature in enumerate(self.selected_features, 1):
            print(f"{i:2d}. {feature:30s} {importance[feature]:.8f}")

        return (
            X_train[self.selected_features],
            X_val[self.selected_features],
            X_test[self.selected_features]
        )

    def fit_final_scaler(self, X):
        self.scale_columns = X.columns.tolist()
        self.scaler.fit(X[self.scale_columns])

    def apply_final_scaler(self, X):
        X = X.copy()
        X[self.scale_columns] = self.scaler.transform(X[self.scale_columns])
        X[self.scale_columns] = X[self.scale_columns].clip(-1, 1)
        return X.astype(np.float32)

    def check_invalid_values(self, *datasets):
        for name, X in datasets:
            nan = X.isna().sum().sum()
            inf = np.isinf(X.to_numpy()).sum()
            print(f"{name:12s}: NaN={nan}, Inf={inf}")
            if nan or inf:
                raise ValueError(f"{name} contains NaN/Inf")

    def check_range(self, *datasets):
        for name, X in datasets:
            min_v, max_v = X.min().min(), X.max().max()
            print(f"{name:12s}: min={min_v:.6f}, max={max_v:.6f}")
            if (X < -1).any().any() or (X > 1).any().any():
                raise ValueError(f"{name} contains values outside [-1, 1]")

    def show_class_distribution(self, *datasets):
        for name, y in datasets:
            print(f"\n{name}:")
            counts = pd.Series(y).value_counts().sort_index()
            for cid, count in counts.items():
                cname = self.target_encoder.inverse_transform([cid])[0]
                print(f"{cid:2d} {cname:20s} {count:8d} ({count/len(y)*100:6.2f}%)")

    def calculate_class_weights(self, y):
        classes = np.unique(y)
        weights = compute_class_weight("balanced", classes=classes, y=y)
        self.class_weights = dict(zip(classes.astype(int), weights.astype(float)))

        print("\nClass weights:")
        for cid, weight in self.class_weights.items():
            cname = self.target_encoder.inverse_transform([cid])[0]
            print(f"{cid:2d} {cname:20s} {weight:.6f}")

        return self.class_weights

    def save_data(self, X_train, y_train, X_val, y_val, X_test, y_test):
        data = [
            ("train_split_multi.csv", X_train, y_train),
            ("valid_split_multi.csv", X_val, y_val),
            ("test_multi.csv", X_test, y_test)
        ]

        for filename, X, y in data:
            df = X.copy()
            df["attack_cat"] = y
            df.to_csv(os.path.join(self.output_dir, filename), index=False)

    def save_artifacts(self):
        artifacts = {
            "target_encoder": self.target_encoder,
            "imputer": self.imputer,
            "scaler": self.scaler,
            "variance_selector": self.variance_selector,
            "kept_categories": self.kept_categories,
            "onehot_columns": self.onehot_columns,
            "numeric_columns": self.numeric_columns,
            "selected_features": self.selected_features,
            "scale_columns": self.scale_columns,
            "class_weights": self.class_weights
        }

        joblib.dump(
            artifacts,
            os.path.join(self.output_dir, "preprocessing_artifacts.joblib")
        )

        metadata = {
            "dataset": "UNSW-NB15",
            "model_target": "KAN",
            "num_classes": len(self.target_encoder.classes_),
            "class_mapping": {
                str(i): name
                for i, name in enumerate(self.target_encoder.classes_)
            },
            "num_features": len(self.selected_features),
            "selected_features": self.selected_features,
            "categorical_columns": self.categorical_columns,
            "rare_threshold": self.rare_threshold,
            "variance_threshold": self.variance_threshold,
            "top_k_features": self.top_k_features,
            "input_range": [-1, 1],
            "dtype": "float32",
            "scaler": "MinMaxScaler(feature_range=(-1,1))",
            "onehot_encoding": "0/1",
            "random_state": self.random_state
        }

        with open(
            os.path.join(self.output_dir, "metadata.json"),
            "w", encoding="utf-8"
        ) as f:
            json.dump(metadata, f, indent=4, ensure_ascii=False)

    def run(self):
        train, test = self.load_data()
        train, test = self.clean_data(train), self.clean_data(test)
        train, val = self.split_train_validation(train)

        y_train, y_val, y_test = self.encode_target(train, val, test)

        X_train = self.remove_target(train)
        X_val = self.remove_target(val)
        X_test = self.remove_target(test)

        self.fit_categories(X_train)
        X_train = self.apply_categories(X_train)
        X_val = self.apply_categories(X_val)
        X_test = self.apply_categories(X_test)

        X_train = self.fit_one_hot(X_train)
        X_val = self.apply_one_hot(X_val)
        X_test = self.apply_one_hot(X_test)

        self.fit_imputer(X_train)
        X_train = self.apply_imputer(X_train)
        X_val = self.apply_imputer(X_val)
        X_test = self.apply_imputer(X_test)

        X_train = self.feature_engineering(X_train)
        X_val = self.feature_engineering(X_val)
        X_test = self.feature_engineering(X_test)

        X_train = self.ensure_numeric(self.log_transform(X_train))
        X_val = self.ensure_numeric(self.log_transform(X_val))
        X_test = self.ensure_numeric(self.log_transform(X_test))

        self.fit_variance_selector(X_train)
        X_train = self.apply_variance_selector(X_train)
        X_val = self.apply_variance_selector(X_val)
        X_test = self.apply_variance_selector(X_test)

        X_train, X_val, X_test = self.feature_selection(X_train, y_train, X_val, X_test)

        self.fit_final_scaler(X_train)
        X_train = self.apply_final_scaler(X_train)
        X_val = self.apply_final_scaler(X_val)
        X_test = self.apply_final_scaler(X_test)

        self.check_invalid_values(
            ("Train", X_train),
            ("Validation", X_val),
            ("Test", X_test)
        )

        self.check_range(
            ("Train", X_train),
            ("Validation", X_val),
            ("Test", X_test)
        )

        self.show_class_distribution(
            ("Train", y_train),
            ("Validation", y_val),
            ("Test", y_test)
        )

        class_weights = self.calculate_class_weights(y_train)

        self.save_data(
            X_train, y_train,
            X_val, y_val,
            X_test, y_test
        )
        self.save_artifacts()

        print("\n" + "=" * 60)
        print("PREPROCESSING COMPLETED")
        print("=" * 60)
        print(f"Features: {X_train.shape[1]}")
        print(f"Train: {X_train.shape}")
        print(f"Val  : {X_val.shape}")
        print(f"Test : {X_test.shape}")
        print(f"Classes: {len(self.target_encoder.classes_)}")
        print("Range: [-1, 1] | dtype: float32")

        return X_train, y_train, X_val, y_val, X_test, y_test, class_weights


# ============================
# RUN
# ============================

preprocessor = UNSWNB15MLPPreprocessor(
    train_path="dataset/UNSW_NB15_training-set.csv",
    test_path="dataset/UNSW_NB15_testing-set.csv",
    output_dir="output",
    rare_threshold=0.01,
    variance_threshold=0.001,
    top_k_features=32,
    validation_size=0.2,
    random_state=1
)

X_train, y_train, X_val, y_val, X_test, y_test, class_weights = preprocessor.run()

print("\nFinal shapes:")
print("X_train:", X_train.shape, "| y_train:", y_train.shape)
print("X_val  :", X_val.shape,   "| y_val  :", y_val.shape)
print("X_test :", X_test.shape,  "| y_test :", y_test.shape)

print("\nClass weights:")
print(class_weights)