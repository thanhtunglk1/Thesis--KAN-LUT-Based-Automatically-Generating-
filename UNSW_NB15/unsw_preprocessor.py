"""
UNSW-NB15 Preprocessing Pipeline (bản hợp nhất)
================================================

Khung kiến trúc: giữ nguyên style fit()/transform() kiểu sklearn của
"Pipeline 3", chỉ dùng cho bài toán MULTICLASS (attack_cat).

Các điểm được VÁ / bổ sung so với bản gốc, lấy ý tưởng từ 2 pipeline khác:

  1. Winsorize (q95, tính trên train) TRƯỚC log-transform - tránh outlier
     cực đoan làm hỏng scaler phía sau.
  2. Scaler đổi từ MinMaxScaler áp trực tiếp -> RobustScaler (median/IQR)
     rồi mới ép cứng về hard_range (mặc định [-1, 1]) dựa trên min/max của
     TRAIN sau khi đã robust-scale. Có clip bắt buộc khi transform
     val/test/demo (không còn bị bỏ sót như bản gốc).
  3. Bổ sung đủ 19 cột vào log_columns (thêm các cột đếm ct_*).
  4. Thêm Correlation Filter (|r| > 0.95) SAU Variance Threshold, trước
     Random Forest importance.
  5. Feature selection đổi từ "chọn top-K CỘT" sang "chọn top-K NHÓM
     (unit)": mỗi categorical gốc (proto/service/state) được giữ HOẶC LOẠI
     NGUYÊN CẢ KHỐI one-hot của nó (all-or-nothing), tránh vỡ ngữ nghĩa.
  6. Metadata xuất ra đầy đủ hơn: phân phối lớp (class_distribution),
     mapping id<->tên attack_cat, thống kê range (bao nhiêu điểm val/test
     bị clip khi ép hard-range).
  7. Vẫn giữ được joblib.dump(self, "preprocessing_artifacts.joblib") để
     tái sử dụng nguyên object cho inference/demo sau này.

Thứ tự xử lý (áp dụng giống nhau cho cả fit() nội bộ lẫn transform()):

    clean -> categorical grouping -> one-hot -> impute -> feature
    engineering (ratio) -> winsorize -> log1p -> RobustScaler ->
    hard-range clip [-1,1] -> variance threshold -> correlation filter ->
    (chỉ ở fit) RF importance theo nhóm -> chọn top-K unit -> feature
    selection cuối cùng.
"""

import json
import os

import joblib
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.feature_selection import VarianceThreshold
from sklearn.impute import SimpleImputer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, RobustScaler


class UNSWNB15Preprocessor:

    def __init__(
        self,
        output_dir="output",
        rare_threshold=0.01,
        winsorize_percentile=0.95,
        variance_threshold=0.001,
        correlation_threshold=0.95,
        hard_range=(-1.0, 1.0),
        top_k_units=32,
        validation_size=0.2,
        random_state=1,
    ):
        self.output_dir = output_dir
        self.rare_threshold = rare_threshold
        self.winsorize_percentile = winsorize_percentile
        self.variance_threshold = variance_threshold
        self.correlation_threshold = correlation_threshold
        self.hard_range = hard_range
        self.top_k_units = top_k_units
        self.validation_size = validation_size
        self.random_state = random_state

        os.makedirs(output_dir, exist_ok=True)

        # ---- các transformer sklearn ----
        self.target_encoder = LabelEncoder()
        self.imputer = SimpleImputer(strategy="median")
        self.scaler = RobustScaler()

        # ---- cấu hình cột ----
        self.categorical_columns = ["proto", "service", "state"]
        self.log_columns = [
            "dur", "sbytes", "dbytes", "rate", "sload", "dload",
            "sinpkt", "dinpkt", "sjit", "djit", "stcpb", "dtcpb",
            "response_body_len", "ct_dst_ltm", "ct_src_dport_ltm",
            "ct_dst_sport_ltm", "ct_dst_src_ltm", "ct_src_ltm",
            "ct_srv_dst", "ct_srv_src",
        ]

        # ---- trạng thái học được từ fit() ----
        self.kept_categories = {}          # col -> list category giữ riêng
        self.onehot_columns = []           # toàn bộ cột one-hot (bộ từ vựng chuẩn)
        self.onehot_groups = {}            # col gốc -> list cột one-hot con (cập nhật dần)
        self.numeric_columns = []          # cột số dùng để impute
        self.continuous_columns = []       # cột liên tục thực sự (số, KHÔNG phải one-hot)
        self.upper_bound = {}              # col -> ngưỡng winsorize (q95 của train)
        self.scale_columns = []            # cột liên tục đưa vào RobustScaler
        self._train_min = None             # min của train sau RobustScaler (cho hard-range)
        self._train_max = None             # max của train sau RobustScaler (cho hard-range)
        self.range_stats = {}              # thống kê số điểm bị clip khi ép hard-range
        self.variance_kept_columns = []    # cột còn lại sau variance threshold
        self.correlation_kept_columns = [] # cột còn lại sau correlation filter
        self.units = []                    # danh sách unit (nhóm one-hot / cột lẻ) đã xếp hạng
        self.selected_features = []        # danh sách cột cuối cùng đưa vào model

        self.class_distribution = {}
        self.attack_cat_mapping = {}

        self.is_fitted = False

    # =========================================================
    # CLEANING
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
        """Chuyển attack_cat (chữ) -> số nguyên, AN TOÀN với nhãn lạ.

        Khác với LabelEncoder.transform() gốc (sẽ ném ValueError nếu gặp
        nhãn chưa từng thấy lúc fit), hàm này gán mọi nhãn lạ vào một mã số
        riêng = len(classes_) (nhóm "unknown"). Quan trọng cho inference/
        demo về sau: một mẫu dữ liệu mới có thể mang attack_cat chưa từng
        xuất hiện lúc train, không nên làm chương trình crash.
        """
        mapping = {cls: idx for idx, cls in enumerate(self.target_encoder.classes_)}
        unknown_idx = len(mapping)
        return pd.Series(y).map(lambda v: mapping.get(v, unknown_idx)).to_numpy()

    def inverse_transform_target(self, y_encoded):
        """Chuyển ngược số nguyên -> tên attack_cat. Mã "unknown_idx" (=
        len(classes_)) được map về chuỗi "unknown"."""
        classes = list(self.target_encoder.classes_)

        def _inv(v):
            v = int(v)
            return classes[v] if v < len(classes) else "unknown"

        return pd.Series(y_encoded).map(_inv).to_numpy()

    # =========================================================
    # CATEGORICAL: gộp category hiếm -> "other"
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
    # ONE-HOT
    # =========================================================

    def fit_one_hot(self, X):
        cols = [c for c in self.categorical_columns if c in X.columns]
        X = pd.get_dummies(X, columns=cols, dtype=np.float32)
        self.onehot_columns = X.columns.tolist()

        self.onehot_groups = {}
        for col in cols:
            prefix = f"{col}_"
            self.onehot_groups[col] = [c for c in self.onehot_columns if c.startswith(prefix)]
        return X

    def apply_one_hot(self, X):
        cols = [c for c in self.categorical_columns if c in X.columns]
        X = pd.get_dummies(X, columns=cols, dtype=np.float32)
        # align cột: thiếu -> điền 0, thừa -> bỏ. Đảm bảo train/val/test/demo
        # luôn cùng một bộ cột one-hot, đúng thứ tự.
        return X.reindex(columns=self.onehot_columns, fill_value=0)

    def _onehot_flat(self):
        flat = set()
        for cols in self.onehot_groups.values():
            flat.update(cols)
        return flat

    def _update_onehot_groups(self, remaining_columns):
        """Sau khi variance/correlation filter loại một số cột one-hot con,
        cập nhật lại onehot_groups để feature-importance theo nhóm tính đúng."""
        remaining = set(remaining_columns)
        for col in list(self.onehot_groups.keys()):
            self.onehot_groups[col] = [c for c in self.onehot_groups[col] if c in remaining]

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
    # FEATURE ENGINEERING (ratio)
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
    # HELPER: xác định cột liên tục thực sự (số, không phải one-hot)
    # =========================================================

    def _compute_continuous_columns(self, X):
        onehot_flat = self._onehot_flat()
        numeric_cols = X.select_dtypes(include=np.number).columns.tolist()
        return [c for c in numeric_cols if c not in onehot_flat]

    # =========================================================
    # WINSORIZE (MỚI - vá từ Pipeline 1 & 2)
    # =========================================================

    def fit_winsorizer(self, X):
        self.upper_bound = {}
        for col in self.continuous_columns:
            self.upper_bound[col] = X[col].quantile(self.winsorize_percentile)

    def apply_winsorizer(self, X):
        X = X.copy()
        for col, upper in self.upper_bound.items():
            if col in X.columns:
                X[col] = X[col].clip(upper=upper)
        return X

    # =========================================================
    # LOG TRANSFORM
    # =========================================================

    def log_transform(self, X):
        X = X.copy()
        continuous_set = set(self.continuous_columns)
        for col in self.log_columns:
            if col in X.columns and col in continuous_set:
                X[col] = np.log1p(X[col].clip(lower=0))
        return X

    # =========================================================
    # NUMERIC SAFETY
    # =========================================================

    def ensure_numeric(self, X):
        X = X.copy()
        for col in X.columns:
            X[col] = pd.to_numeric(X[col], errors="coerce")
        return X

    # =========================================================
    # SCALER: RobustScaler (chỉ cột liên tục)
    # =========================================================

    def fit_scaler(self, X):
        self.scale_columns = [c for c in self.continuous_columns if c in X.columns]
        self.scaler.fit(X[self.scale_columns])

    def apply_scaler(self, X):
        X = X.copy()
        cols = [c for c in self.scale_columns if c in X.columns]
        X[cols] = self.scaler.transform(X[cols])
        return X

    # =========================================================
    # HARD RANGE (MỚI - vá từ Pipeline 2): ép cứng về [-1, 1]
    # dựa trên min/max của TRAIN sau khi đã RobustScaler, có clip bắt buộc.
    # =========================================================

    def fit_hard_range(self, X):
        self._train_min = X[self.scale_columns].min()
        self._train_max = X[self.scale_columns].max()

    def apply_hard_range(self, X, record_stats=False, split_name="data"):
        X = X.copy()
        lo, hi = self.hard_range

        for col in self.scale_columns:
            if col not in X.columns:
                continue
            col_min, col_max = self._train_min[col], self._train_max[col]

            if record_stats:
                n_out = int(((X[col] < col_min) | (X[col] > col_max)).sum())
                if n_out > 0:
                    self.range_stats.setdefault(col, {})[f"{split_name}_out_of_range_count"] = n_out

            clipped = X[col].clip(lower=col_min, upper=col_max)
            if col_max > col_min:
                X[col] = lo + (clipped - col_min) * (hi - lo) / (col_max - col_min)
            else:
                X[col] = lo  # cột hằng số, tránh chia cho 0

        return X

    # =========================================================
    # VARIANCE THRESHOLD (chạy trên TOÀN BỘ cột, sau khi đã scale)
    # =========================================================

    def fit_variance(self, X):
        # selector = VarianceThreshold(self.variance_threshold)
        # selector.fit(X)
        # self.variance_kept_columns = X.columns[selector.get_support()].tolist()
        # self._update_onehot_groups(self.variance_kept_columns)

        """
        Variance filtering theo kiểu group-safe.

        - Continuous/numeric scalar: áp dụng VarianceThreshold.
        - One-hot categorical groups: giữ nguyên toàn bộ group.
        """

        onehot_flat = self._onehot_flat()

        # Chỉ variance-filter các feature không phải one-hot
        non_onehot_columns = [c for c in X.columns if c not in onehot_flat]

        kept_non_onehot = []

        if non_onehot_columns:
            selector = VarianceThreshold(self.variance_threshold)
            selector.fit(X[non_onehot_columns])
            kept_non_onehot = [c for c, keep in zip(non_onehot_columns, selector.get_support()) if keep]

        # One-hot: giữ nguyên toàn bộ các cột
        kept_onehot = [c for c in X.columns if c in onehot_flat]
        self.variance_kept_columns = [c for c in X.columns if c in kept_non_onehot or c in kept_onehot]

    def apply_variance(self, X):
        cols = [c for c in self.variance_kept_columns if c in X.columns]
        return X[cols]

    # =========================================================
    # CORRELATION FILTER (MỚI - vá từ Pipeline 2)
    # =========================================================

    def fit_correlation_filter(self, X):
        # corr = X.corr().abs()
        # upper = corr.where(np.triu(np.ones(corr.shape), k=1).astype(bool))
        # drop_cols = [c for c in upper.columns if any(upper[c] > self.correlation_threshold)]

        # self.correlation_kept_columns = [c for c in X.columns if c not in drop_cols]
        # # self._update_onehot_groups(self.correlation_kept_columns)
        # return drop_cols

        """
        Correlation filter chỉ áp dụng cho continuous/numeric features.
    
        One-hot categorical groups được giữ nguyên toàn bộ.
        RF group selection ở bước sau sẽ quyết định giữ/bỏ cả group.
        """
    
        onehot_flat = self._onehot_flat()
    
        # Chỉ correlation-filter các feature không phải one-hot
        numeric_columns = [c for c in X.columns if c not in onehot_flat]
    
        drop_cols = []
    
        if len(numeric_columns) > 1:
            corr = X[numeric_columns].corr().abs()
            upper = corr.where(np.triu(np.ones(corr.shape), k=1).astype(bool)) 
            drop_cols = [c for c in upper.columns if any( upper[c] > self.correlation_threshold)]
    
        # Giữ toàn bộ one-hot + numeric chưa bị correlation filter
        self.correlation_kept_columns = [c for c in X.columns if c not in drop_cols]

        return drop_cols

    def apply_correlation_filter(self, X):
        cols = [c for c in self.correlation_kept_columns if c in X.columns]
        return X[cols]

    # =========================================================
    # FEATURE SELECTION theo NHÓM (all-or-nothing cho one-hot)
    # (MỚI - vá từ Pipeline 2, thay cho chọn top-K cột lẻ của bản gốc)
    # =========================================================

    def fit_feature_selection(self, X, y):
        if len(X) != len(y):
            raise ValueError(f"Feature selection: X và y không cùng số dòng! X={len(X)}, y={len(y)}")

        rf = RandomForestClassifier(
            n_estimators=300,
            random_state=self.random_state,
            n_jobs=-1,
            max_features="sqrt",
        )
        rf.fit(X, y)
        raw_importance = dict(zip(X.columns, rf.feature_importances_))

        onehot_flat = self._onehot_flat()

        units = []
        for col, cols in self.onehot_groups.items():
            available_cols = [c for c in cols if c in X.columns]
            # if not cols:
            if not available_cols:
                continue
            units.append({
                "name": col,
                "columns": cols,
                #"importance": float(sum(raw_importance[c] for c in cols)),
                "importance": float(sum(raw_importance[c] for c in available_cols)),
            })

        for col in X.columns:
            if col not in onehot_flat:
                units.append({
                    "name": col,
                    "columns": [col],
                    "importance": float(raw_importance[col]),
                })

        units = sorted(units, key=lambda u: u["importance"], reverse=True)
        self.units = units

        if self.top_k_units is None:
            chosen = units
        else:
            chosen = units[: min(self.top_k_units, len(units))]

        self.selected_features = [c for u in chosen for c in u["columns"]]

        print(f"    Total units available : {len(units)}")
        print(f"    Units selected        : {len(chosen)}")
        print(f"    -> Input columns      : {len(self.selected_features)}")
        print("\n    Top units:")
        for i, u in enumerate(chosen, start=1):
            print(f"      {i:02d}. {u['name']:<20} n_cols={len(u['columns']):<3} importance={u['importance']:.6f}")

    def apply_feature_selection(self, X):
        cols = [c for c in self.selected_features if c in X.columns]
        return X[cols]

    # =========================================================
    # FIT: học toàn bộ tham số của pipeline trên TRAIN
    # =========================================================

    def fit(self, X, y):
        print("\n" + "=" * 70)
        print("                FIT PREPROCESSOR")
        print("=" * 70)

        y = pd.Series(y).reset_index(drop=True)
        X = X.reset_index(drop=True)

        if len(X) != len(y):
            raise ValueError(f"X và y không cùng số dòng: X={len(X)}, y={len(y)}")

        print(f"[INFO] Input X shape : {X.shape}")
        print(f"[INFO] Target size   : {len(y)}")
        print(f"[INFO] Target classes: {pd.Series(y).nunique()}")

        # ---------- 1. TARGET ----------
        print("\n[1] TARGET ENCODING")
        self.fit_target(y)
        print(f"    Number classes : {len(self.target_encoder.classes_)}")
        print(f"    Classes        : {list(self.target_encoder.classes_)}")

        # ---------- 2. CATEGORICAL GROUPING ----------
        print("\n[2] CATEGORICAL FEATURES (rare -> other)")
        self.fit_categories(X)
        X = self.apply_categories(X)
        for col, kept in self.kept_categories.items():
            print(f"    {col:<10}: {len(kept)} categories kept -> {kept}")

        # ---------- 3. ONE-HOT ----------
        print("\n[3] ONE-HOT ENCODING")
        before = X.shape
        X = self.fit_one_hot(X)
        print(f"    Before : {before}  ->  After : {X.shape}")
        for col, cols in self.onehot_groups.items():
            print(f"    {col:<10}: {len(cols)} one-hot columns")

        # ---------- 4. IMPUTATION ----------
        print("\n[4] IMPUTATION (median)")
        self.fit_imputer(X)
        missing_before = int(X[self.numeric_columns].isna().sum().sum())
        X = self.apply_imputer(X)
        print(f"    Numeric columns : {len(self.numeric_columns)}")
        print(f"    Missing before  : {missing_before}")

        # ---------- 5. FEATURE ENGINEERING ----------
        print("\n[5] FEATURE ENGINEERING (ratio)")
        before_cols = set(X.columns)
        X = self.feature_engineering(X)
        new_cols = [c for c in X.columns if c not in before_cols]
        print(f"    New ratio features: {new_cols}")

        # xác định cột liên tục THỰC SỰ ngay sau feature engineering,
        # dùng xuyên suốt cho winsorize/log/scale/hard-range
        self.continuous_columns = self._compute_continuous_columns(X)
        print(f"    Continuous columns: {len(self.continuous_columns)}")

        # ---------- 6. WINSORIZE ----------
        print(f"\n[6] WINSORIZE (q{int(self.winsorize_percentile * 100)})")
        self.fit_winsorizer(X)
        X = self.apply_winsorizer(X)
        print(f"    Columns winsorized: {len(self.upper_bound)}")

        # ---------- 7. LOG TRANSFORM ----------
        print("\n[7] LOG TRANSFORM")
        applied = [c for c in self.log_columns if c in X.columns and c in self.continuous_columns]
        X = self.log_transform(X)
        print(f"    Columns: {applied}")

        # ---------- 8. NUMERIC SAFETY ----------
        X = self.ensure_numeric(X)

        # ---------- 9. ROBUST SCALER ----------
        print("\n[8] ROBUST SCALER")
        self.fit_scaler(X)
        X = self.apply_scaler(X)
        print(f"    Scaled columns: {len(self.scale_columns)}")

        # ---------- 10. HARD RANGE ----------
        print(f"\n[9] HARD RANGE -> {self.hard_range}")
        self.fit_hard_range(X)
        X = self.apply_hard_range(X, record_stats=False)
        print("    Done.")

        # ---------- 11. VARIANCE THRESHOLD ----------
        print("\n[10] VARIANCE THRESHOLD")
        before_n = X.shape[1]
        self.fit_variance(X)
        X = self.apply_variance(X)
        print(f"    Before: {before_n}  After: {X.shape[1]}  Removed: {before_n - X.shape[1]}")

        # ---------- 12. CORRELATION FILTER ----------
        print(f"\n[11] CORRELATION FILTER (|r| > {self.correlation_threshold})")
        before_n = X.shape[1]
        dropped = self.fit_correlation_filter(X)
        X = self.apply_correlation_filter(X)
        print(f"    Before: {before_n}  After: {X.shape[1]}  Removed: {len(dropped)}")
        if dropped:
            print(f"    Dropped columns: {dropped}")

        # ---------- 13. RF FEATURE SELECTION (theo nhóm) ----------
        print(f"\n[12] RANDOM FOREST FEATURE SELECTION (top {self.top_k_units} units)")
        y_encoded = self.transform_target(y)
        self.fit_feature_selection(X, y_encoded)

        self.is_fitted = True

        print("\n" + "=" * 70)
        print("              FIT COMPLETED")
        print("=" * 70)
        print(f"[INFO] Final input features: {len(self.selected_features)}")
        print(f"[INFO] Number of classes   : {len(self.target_encoder.classes_)}")

        return self

    # =========================================================
    # TRANSFORM: áp dụng lại đúng các bước đã fit (dùng cho train/val/test/demo)
    # =========================================================

    def transform(self, X, split_name="data"):
        if not self.is_fitted:
            raise RuntimeError("Preprocessor has not been fitted.")

        X = self.clean(X, remove_duplicates=False)
        X = self.apply_categories(X)
        X = self.apply_one_hot(X)
        X = self.apply_imputer(X)
        X = self.feature_engineering(X)
        X = self.apply_winsorizer(X)
        X = self.log_transform(X)
        X = self.ensure_numeric(X)
        X = self.apply_scaler(X)
        X = self.apply_hard_range(X, record_stats=True, split_name=split_name)
        X = self.apply_variance(X)
        X = self.apply_correlation_filter(X)
        X = self.apply_feature_selection(X)

        return X.astype(np.float32)

    # =========================================================
    # CLASS DISTRIBUTION REPORT
    # =========================================================

    def class_distribution_report(self, y_train_raw, y_val_raw, y_test_raw):
        print("\n[CLASS DISTRIBUTION REPORT]")

        self.attack_cat_mapping = {
            "id_to_name": {str(i): cls for i, cls in enumerate(self.target_encoder.classes_)},
            "name_to_id": {cls: int(i) for i, cls in enumerate(self.target_encoder.classes_)},
        }

        def dist(y_raw):
            counts = y_raw.value_counts()
            return {str(k): int(v) for k, v in counts.items()}

        self.class_distribution = {
            "train": dist(y_train_raw),
            "val": dist(y_val_raw),
            "test": dist(y_test_raw),
        }

        print(json.dumps(self.class_distribution, indent=2, ensure_ascii=False))

    # =========================================================
    # PIPELINE ĐẦY ĐỦ: train + val + test
    # =========================================================

    def preprocess_train(self, train_df, test_df):
        print("\n" + "=" * 70)
        print("              UNSW-NB15 PREPROCESSING")
        print("=" * 70)

        print(f"[INFO] Original train shape : {train_df.shape}")
        print(f"[INFO] Original test shape  : {test_df.shape}")

        # ---------- CLEAN ----------
        train_df = self.clean(train_df, remove_duplicates=False)
        test_df = self.clean(test_df, remove_duplicates=False)

        # ---------- TRAIN / VAL SPLIT (có stratify) ----------
        print("\n[TRAIN / VALIDATION SPLIT]")
        train_df, val_df = train_test_split(
            train_df,
            test_size=self.validation_size,
            random_state=self.random_state,
            stratify=train_df["attack_cat"],
        )
        print(f"    Train      : {train_df.shape}")
        print(f"    Validation : {val_df.shape}")
        print(f"    Test       : {test_df.shape}")

        y_train_raw = train_df["attack_cat"]
        y_val_raw = val_df["attack_cat"]
        y_test_raw = test_df["attack_cat"]

        drop_cols = ["attack_cat", "label"]
        X_train_raw = train_df.drop(columns=drop_cols, errors="ignore")
        X_val_raw = val_df.drop(columns=drop_cols, errors="ignore")
        X_test_raw = test_df.drop(columns=drop_cols, errors="ignore")

        # ---------- FIT (chỉ trên train) ----------
        print("\n" + "-" * 70)
        print("FITTING PREPROCESSOR ON TRAINING DATA ONLY")
        print("-" * 70)
        self.fit(X_train_raw, y_train_raw)

        # ---------- TRANSFORM ----------
        print("\n" + "-" * 70)
        print("TRANSFORMING DATASETS")
        print("-" * 70)

        X_train = self.transform(X_train_raw, split_name="train")
        X_val = self.transform(X_val_raw, split_name="val")
        X_test = self.transform(X_test_raw, split_name="test")

        print(f"    X_train : {X_train.shape}")
        print(f"    X_val   : {X_val.shape}")
        print(f"    X_test  : {X_test.shape}")

        y_train = self.transform_target(y_train_raw)
        y_val = self.transform_target(y_val_raw)
        y_test = self.transform_target(y_test_raw)

        # ---------- CLASS DISTRIBUTION ----------
        self.class_distribution_report(y_train_raw, y_val_raw, y_test_raw)

        # ---------- SUMMARY ----------
        print("\n" + "=" * 70)
        print("                  FINAL SUMMARY")
        print("=" * 70)
        print(f"    Train : X={X_train.shape}, y={y_train.shape}")
        print(f"    Val   : X={X_val.shape}, y={y_val.shape}")
        print(f"    Test  : X={X_test.shape}, y={y_test.shape}")
        print(f"    Classes : {len(self.target_encoder.classes_)}")
        print(f"    Feature range : {self.hard_range} (onehot columns giữ 0/1)")

        if self.range_stats:
            print("\n    Out-of-range clip stats (val/test so với train):")
            print(json.dumps(self.range_stats, indent=2, ensure_ascii=False))

        # ---------- SAVE ----------
        self.save_processed_data(X_train, y_train, X_val, y_val, X_test, y_test)
        self.save_artifacts()

        print("\n" + "=" * 70)
        print("             PREPROCESSING COMPLETED")
        print("=" * 70)

        return X_train, y_train, X_val, y_val, X_test, y_test

    # =========================================================
    # DEMO / INFERENCE
    # =========================================================

    def preprocess_demo(self, raw_sample):
        if not self.is_fitted:
            raise RuntimeError("Load fitted preprocessing artifacts first.")
        raw_sample = raw_sample.copy()
        X_demo = raw_sample.drop(columns=["attack_cat", "label"], errors="ignore")
        return self.transform(X_demo, split_name="demo")

    # =========================================================
    # SAVE / LOAD
    # =========================================================

    def save_artifacts(self):
        # (1) Dump nguyên object - dùng lại trực tiếp cho demo/inference
        #     bằng UNSWNB15Preprocessor.load_artifacts(path), rồi gọi
        #     preprocessor.preprocess_demo(raw_sample) hoặc .transform(X).
        joblib.dump(self, os.path.join(self.output_dir, "preprocessing_artifacts.joblib"))

        # (2) Metadata dạng JSON, đọc được không cần Python - tham khảo nhanh
        #     hoặc dùng cho bước sinh cấu hình phần cứng/RTL sau này nếu cần.
        metadata = {
            "dataset": "UNSW-NB15",
            "num_classes": len(self.target_encoder.classes_),
            "num_features": len(self.selected_features),
            "selected_features": self.selected_features,
            "hard_range": list(self.hard_range),
            "dtype": "float32",
            "rare_threshold": self.rare_threshold,
            "winsorize_percentile": self.winsorize_percentile,
            "variance_threshold": self.variance_threshold,
            "correlation_threshold": self.correlation_threshold,
            "top_k_units": self.top_k_units,
            "random_state": self.random_state,
            "kept_categories": self.kept_categories,
            "onehot_group_sizes": {k: len(v) for k, v in self.onehot_groups.items()},
            "range_stats": self.range_stats,
            "class_distribution": self.class_distribution,
            "attack_cat_mapping": self.attack_cat_mapping,
        }

        with open(os.path.join(self.output_dir, "metadata.json"), "w", encoding="utf-8") as f:
            json.dump(metadata, f, indent=4, ensure_ascii=False, default=str)

    @classmethod
    def load_artifacts(cls, path):
        """Load lại nguyên object preprocessor đã fit, dùng cho demo/inference:

            preprocessor = UNSWNB15Preprocessor.load_artifacts(
                "output/preprocessing_artifacts.joblib"
            )
            X_demo = preprocessor.preprocess_demo(raw_sample_df)
        """
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