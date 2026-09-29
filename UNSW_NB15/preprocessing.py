import os
import json
import warnings
import joblib
import numpy as np
import pandas as pd

from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import RobustScaler
from sklearn.impute import SimpleImputer

from sklearn.feature_selection import VarianceThreshold
from sklearn.ensemble import RandomForestClassifier

warnings.filterwarnings("ignore")


class UNSWPreprocessorKAN:
    """
    Pipeline tiền xử lý UNSW-NB15, thiết kế riêng để làm đầu vào cho KAN (đặc biệt
    KAN-LUT trên FPGA). Khác biệt chính so với bản MLP-only:

      1. Category hiếm được gộp thành "other" trước khi One-Hot (kiểm soát input dim).
      2. Feature selection chạy SAU One-Hot, nhưng chọn theo NHÓM (all-or-nothing) -
         nếu giữ một categorical gốc thì giữ toàn bộ block one-hot của nó, tránh vỡ
         ngữ nghĩa của biến phân loại.
      3. Sau RobustScaler, ép thêm về range cố định [-1, 1] - cần thiết cho grid của
         spline trong KAN, RobustScaler một mình không đảm bảo min/max cố định.
      4. Xuất kèm file metadata (json) ghi lại toàn bộ quyết định (range, category
         giữ lại, input dim...) để bước sinh RTL sau này dùng làm căn cứ.

    LƯU Ý: Validation split KHÔNG được thực hiện trong pipeline này. Hãy tự tách
    validation (stratify theo nhãn) từ file unsw_*_train.csv xuất ra, ngay tại
    bước training - vì lúc đó mới cần validation để canh lịch pruning/QAT.
    """

    def __init__(self,
                 train_path,
                 test_path,
                 output_dir="output",
                 rare_category_threshold=0.01,   # ngưỡng tần suất để giữ category riêng, dưới ngưỡng -> gộp "other"
                 hard_range=(-1.0, 1.0),          # range cố định ép cho spline sau scale
                 random_state=42):
        # LƯU Ý: validation split KHÔNG làm ở đây nữa - sẽ tách trong bước train
        # (train_test_split trên tập train.csv xuất ra từ pipeline này khi cần).

        self.train_path = train_path
        self.test_path = test_path
        self.output_dir = output_dir
        self.rare_category_threshold = rare_category_threshold
        self.hard_range = hard_range
        self.random_state = random_state

        os.makedirs(output_dir, exist_ok=True)

        self.train_df = None
        self.test_df = None

        self.attack_encoder = LabelEncoder()
        self.scaler = RobustScaler()
        self.imputer = SimpleImputer(strategy="median")
        self.upper_bound = {}

        # 3 cột categorical gốc cần gộp nhóm + one-hot
        self.categorical_cols = ["proto", "service", "state"]
        # sau khi gộp nhóm, lưu lại danh sách category được giữ riêng cho mỗi cột
        self.kept_categories = {}
        # sau one-hot, lưu lại mapping: cột gốc -> list tên cột one-hot tương ứng
        self.onehot_groups = {}

        self.log_features = ["dur", "sbytes", "dbytes", "rate", "sload", "dload", "sinpkt", "dinpkt",
                             "sjit", "djit", "stcpb", "dtcpb", "response_body_len", "ct_dst_ltm",
                             "ct_src_dport_ltm", "ct_dst_sport_ltm", "ct_dst_src_ltm", "ct_src_ltm",
                             "ct_srv_dst", "ct_srv_src"]

        self.selected_features_binary = None
        self.selected_features_multi = None

        # min/max thực tế của từng cột liên tục sau scale (log lại cho metadata)
        self.range_stats = {}

####################################################################
    # Bước 1: Load dữ liệu
    def load_data(self):
        """
        Đọc 2 file CSV gốc (train và test) từ đường dẫn self.train_path /
        self.test_path bằng pandas.read_csv, lưu vào self.train_df và
        self.test_df. Không chỉnh sửa nội dung, chỉ load nguyên bản.
        """
        print("=" * 60)
        print("Loading dataset...")

        self.train_df = pd.read_csv(self.train_path)
        self.test_df = pd.read_csv(self.test_path)
        print("Train :", self.train_df.shape)
        print("Test  :", self.test_df.shape)
        print()

####################################################################
    # Bước 2: Làm sạch dữ liệu (giữ nguyên logic gốc)
    def clean_dataframe(self, df, name="dataset"):
        """
        Làm sạch một DataFrame (áp dụng riêng cho train hoặc test), gồm đúng
        4 thao tác cụ thể sau, theo thứ tự:

          1. Xóa khoảng trắng thừa ở đầu/cuối TÊN CỘT (vd " dur " -> "dur").
             Không đụng vào giá trị bên trong các ô dữ liệu.
          2. Xóa hẳn cột "id" nếu tồn tại - đây chỉ là số thứ tự dòng, không
             mang thông tin dự đoán.
          3. Xóa các DÒNG có is_ftp_login mang giá trị 2 hoặc 4 (nếu cột này
             tồn tại) - đây là các mã bất thường/lỗi trong bộ UNSW-NB15 gốc,
             không phải giá trị hợp lệ (hợp lệ chỉ có 0 hoặc 1).
          4. Với cột "service": thay MỌI giá trị đúng bằng dấu gạch ngang "-"
             thành chuỗi "unknown" (dấu "-" là ký hiệu missing value gốc của
             bộ dữ liệu này khi service không xác định được).
          5. Xóa các DÒNG có state == "no" (nếu cột này tồn tại) - đây là giá
             trị trạng thái kết nối không hợp lệ trong bộ dữ liệu gốc.

        Sau các bước trên, reset lại index của DataFrame về 0..n-1.
        In ra số dòng bị xóa (trước/sau) để theo dõi mức độ ảnh hưởng.
        Trả về DataFrame đã làm sạch (không sửa trực tiếp DataFrame gốc, vì
        có gọi df.copy() ở đầu hàm).
        """
        df = df.copy()
        n_before = len(df)

        df.columns = df.columns.str.strip()

        if "id" in df.columns:
            df.drop(columns=["id"], inplace=True)

        if "is_ftp_login" in df.columns:
            df = df[~df["is_ftp_login"].isin([2, 4])]

        if "service" in df.columns:
            df["service"] = df["service"].replace("-", "unknown")

        if "state" in df.columns:
            df = df[df["state"] != "no"]

        df.reset_index(drop=True, inplace=True)

        n_after = len(df)
        print(f"[{name}] Removed {n_before - n_after} rows during cleaning "
              f"({n_before} -> {n_after})")

        return df

    def clean_data(self):
        """
        Gọi clean_dataframe() lần lượt cho self.train_df và self.test_df
        (xem chi tiết 5 thao tác làm sạch trong docstring của clean_dataframe),
        rồi ghi đè kết quả trở lại self.train_df / self.test_df.
        """
        print("=" * 60)
        print("Cleaning Dataset")

        self.train_df = self.clean_dataframe(self.train_df, name="train")
        self.test_df = self.clean_dataframe(self.test_df, name="test")

        print("Train :", self.train_df.shape)
        print("Test  :", self.test_df.shape)

####################################################################
    # Bước 3: Encode nhãn attack_cat (label mục tiêu, không phải input -> vẫn
    # dùng LabelEncoder bình thường, không cần one-hot ở input side)
    @staticmethod
    def encode_unknown(series, encoder):
        """
        Chuyển một cột dữ liệu dạng chữ (series) thành số nguyên, dựa trên một
        LabelEncoder đã fit sẵn (encoder), nhưng an toàn với giá trị lạ:

          - Với mỗi giá trị trong series, nếu giá trị đó CÓ trong encoder.classes_
            (tức đã từng xuất hiện lúc fit), map thành đúng chỉ số (index) mà
            LabelEncoder đã gán cho nó.
          - Nếu giá trị đó KHÔNG có trong encoder.classes_ (nhãn lạ, chưa từng
            thấy lúc fit), map thành một chỉ số mới duy nhất = len(mapping)
            (tức số thứ tự ngay sau nhãn cuối cùng), coi như nhóm "unknown".

        Mục đích: LabelEncoder.transform() gốc của sklearn sẽ báo lỗi
        ValueError nếu gặp giá trị chưa từng thấy lúc fit; hàm này tránh lỗi
        đó bằng cách gán một mã số riêng cho mọi giá trị lạ.
        """
        mapping = {cls: idx for idx, cls in enumerate(encoder.classes_)}
        unknown = len(mapping)
        return series.map(lambda x: mapping.get(x, unknown))

    def encode_target(self):
        """
        Mã hóa cột nhãn "attack_cat" (tên loại tấn công dạng chữ, vd "Normal",
        "DoS", "Exploits"...) thành số nguyên, để dùng làm target cho bài toán
        phân loại đa lớp. Cụ thể:

          1. Fit self.attack_encoder (LabelEncoder) trên các giá trị attack_cat
             của TRAIN - tự động gán mỗi tên loại tấn công một số nguyên
             (0, 1, 2, ...) theo thứ tự alphabet.
          2. Transform cột attack_cat của train sang số nguyên theo encoder đó.
          3. Transform cột attack_cat của test bằng encode_unknown() - nếu test
             có loại tấn công chưa từng thấy ở train, gán mã "unknown" riêng
             thay vì làm chương trình lỗi.

        Lưu ý: đây là mã hóa nhãn MỤC TIÊU (target/label), khác với việc mã
        hóa các cột INPUT phân loại (proto/service/state) - 2 cột input đó
        được xử lý bằng one-hot ở các bước sau, không dùng LabelEncoder.
        """
        print("=" * 60)
        print("Encoding target (attack_cat)")

        self.attack_encoder.fit(self.train_df["attack_cat"])

        self.train_df["attack_cat"] = self.attack_encoder.transform(self.train_df["attack_cat"])
        self.test_df["attack_cat"] = self.encode_unknown(self.test_df["attack_cat"], self.attack_encoder)

        print("Done.\n")

####################################################################
    # Bước 5: Gộp category hiếm thành "other" (fit trên train, apply cho cả 3 tập)
    # Đây là bước THAY THẾ cho LabelEncoder cứng nhắc trên proto/service/state.
    def fit_category_grouping(self):
        """
        Với mỗi cột trong self.categorical_cols (proto, service, state), tính
        tần suất xuất hiện (%) của từng giá trị TRÊN TẬP TRAIN bằng
        value_counts(normalize=True), rồi quyết định giá trị nào được "giữ
        riêng" và giá trị nào sẽ bị gộp thành "other" ở bước sau:

          - Giá trị có tần suất >= self.rare_category_threshold (mặc định 1%)
            -> được GIỮ RIÊNG (sẽ có một cột one-hot riêng cho nó).
          - Giá trị có tần suất < threshold -> sẽ bị gộp vào "other" (không
            xử lý gộp ở hàm này, chỉ tính TRƯỚC danh sách giữ lại).

        Kết quả lưu vào self.kept_categories[col] = list các giá trị được
        giữ riêng cho cột đó. Chỉ tính toán trên TRAIN để tránh rò rỉ thông
        tin phân phối của test vào quyết định gộp nhóm.
        """
        print("=" * 60)
        print("Fit Category Grouping (rare -> 'other')")

        self.kept_categories.clear()

        for col in self.categorical_cols:
            freq = self.train_df[col].value_counts(normalize=True)
            kept = freq[freq >= self.rare_category_threshold].index.tolist()
            self.kept_categories[col] = kept

            print(f"[{col}] kept {len(kept)} categories "
                  f"(threshold={self.rare_category_threshold}): {kept}")
        print()

    def apply_category_grouping(self):
        """
        Áp dụng danh sách "giá trị được giữ riêng" (self.kept_categories, đã
        tính ở fit_category_grouping) lên CẢ train và test:

        Với mỗi cột trong proto/service/state, với mỗi dòng dữ liệu:
          - Nếu giá trị của dòng đó NẰM TRONG danh sách kept_categories[col]
            -> giữ nguyên giá trị.
          - Nếu KHÔNG nằm trong danh sách đó (bao gồm cả giá trị hiếm ở train
            đã bị loại, LẪN giá trị hoàn toàn mới chỉ xuất hiện ở test mà
            train chưa từng thấy) -> thay bằng chuỗi "other".

        Sau bước này, mỗi cột categorical chỉ còn tối đa
        (số giá trị giữ riêng + 1 nhóm "other"), thay vì hàng trăm giá trị
        gốc như proto ban đầu - chuẩn bị cho bước One-Hot ở kế tiếp.
        """
        print("=" * 60)
        print("Apply Category Grouping")

        for df, name in [(self.train_df, "train"), (self.test_df, "test")]:
            for col in self.categorical_cols:
                kept = self.kept_categories[col]
                # giá trị không nằm trong danh sách giữ lại (kể cả unseen ở test)
                # đều gộp thành "other"
                df[col] = df[col].where(df[col].isin(kept), other="other")

        print("Done.\n")

####################################################################
    # Bước 6: One-Hot encode 3 cột categorical đã gộp nhóm
    # Fit "vocabulary" cột one-hot trên train, align val/test theo đúng cột đó
    # (tránh trường hợp val/test sinh ra cột one-hot khác train).
    def one_hot_encode(self):
        """
        Chuyển 3 cột categorical (proto, service, state - đã được gộp nhóm
        "other" ở bước trước) thành các cột nhị phân 0/1 bằng
        pd.get_dummies, mỗi giá trị riêng biệt của một cột gốc trở thành
        MỘT cột mới (vd cột "state" với 3 giá trị FIN/CON/other sẽ tạo ra
        3 cột: "state_FIN", "state_CON", "state_other").

        Cách làm cụ thể:
          1. Chạy pd.get_dummies TRÊN TRAIN trước, lấy đó làm "bộ từ vựng"
             chuẩn - danh sách đầy đủ các cột one-hot sẽ dùng cho cả pipeline
             (biến onehot_columns).
          2. Lưu lại self.onehot_groups[col] = danh sách tên cột one-hot
             thuộc về cột gốc col (vd onehot_groups["state"] = ["state_FIN",
             "state_CON", "state_other"]) - dùng cho bước feature selection
             theo nhóm ở sau.
          3. Với CẢ train và test: tự chạy get_dummies riêng, sau đó
             "reindex" theo đúng danh sách cột one-hot đã lấy từ train -
             cột nào thiếu (test không có giá trị đó) sẽ tự động điền 0,
             cột nào thừa (không có trong train) sẽ bị bỏ. Điều này đảm bảo
             train/test luôn có CÙNG một bộ cột one-hot, số lượng và thứ tự
             giống hệt nhau.
          4. Xóa 3 cột categorical gốc (proto/service/state dạng chữ), thay
             bằng các cột one-hot 0/1 mới, ghép nối lại vào DataFrame.
        """
        print("=" * 60)
        print("One-Hot Encoding")

        train_dummies = pd.get_dummies(self.train_df[self.categorical_cols],
                                        columns=self.categorical_cols, prefix=self.categorical_cols)
        onehot_columns = train_dummies.columns.tolist()

        # lưu lại mapping: cột gốc -> list cột one-hot, dùng cho feature selection theo nhóm
        self.onehot_groups.clear()
        for col in self.categorical_cols:
            prefix = f"{col}_"
            self.onehot_groups[col] = [c for c in onehot_columns if c.startswith(prefix)]

        for df_name in ["train_df", "test_df"]:
            df = getattr(self, df_name)
            dummies = pd.get_dummies(df[self.categorical_cols],
                                      columns=self.categorical_cols, prefix=self.categorical_cols)
            # align cột: thêm cột thiếu = 0, bỏ cột thừa (nếu val/test có category lạ
            # không xuất hiện ở train - dù apply_category_grouping đã gộp "other"
            # nên trường hợp này hiếm, thêm bước align vẫn an toàn hơn)
            dummies = dummies.reindex(columns=onehot_columns, fill_value=0)

            df = df.drop(columns=self.categorical_cols)
            df = pd.concat([df.reset_index(drop=True), dummies.reset_index(drop=True)], axis=1)
            setattr(self, df_name, df)

        print(f"Total one-hot columns: {len(onehot_columns)}")
        for col, cols in self.onehot_groups.items():
            print(f"  {col}: {len(cols)} columns")
        print()

####################################################################
    # Bước 7: Tách feature/label
    def split_dataset(self):
        """
        Tách DataFrame train/test thành 2 phần riêng: đặc trưng đầu vào (X)
        và nhãn (y), cụ thể:

          - self.X_train / self.X_test: toàn bộ cột của train_df/test_df,
            TRỪ 2 cột "label" và "attack_cat" (đây là 2 cột nhãn, không phải
            đặc trưng đầu vào).
          - self.y_train_binary / self.y_test_binary: lấy riêng cột "label"
            (0 = bình thường, 1 = có tấn công) - dùng cho bài toán phân loại
            NHỊ PHÂN.
          - self.y_train_multi / self.y_test_multi: lấy riêng cột "attack_cat"
            (đã mã hóa số ở bước encode_target) - dùng cho bài toán phân loại
            ĐA LỚP (loại tấn công cụ thể).
        """
        print("=" * 60)
        print("Split Features and Labels")

        self.X_train = self.train_df.drop(columns=["label", "attack_cat"])
        self.X_test = self.test_df.drop(columns=["label", "attack_cat"])

        self.y_train_binary = self.train_df["label"]
        self.y_test_binary = self.test_df["label"]

        self.y_train_multi = self.train_df["attack_cat"]
        self.y_test_multi = self.test_df["attack_cat"]

        print("Train :", self.X_train.shape)
        print("Test  :", self.X_test.shape)
        print()

####################################################################
    # Bước 8: Impute missing (chỉ áp dụng cho cột liên tục, one-hot vốn không có NaN)
    def impute_missing(self):
        """
        Điền giá trị thiếu (NaN) trong các cột LIÊN TỤC (không đụng đến các
        cột one-hot 0/1, vì chúng không có NaN sau bước one-hot):

          1. Fit self.imputer (SimpleImputer, strategy="median") TRÊN TRAIN
             - với mỗi cột liên tục, tính median của các giá trị không NaN.
          2. Transform cả train và test: mọi ô đang là NaN trong các cột đó
             sẽ được thay bằng median đã tính từ TRAIN (test không tự tính
             median riêng, để tránh rò rỉ thông tin từ test).
        """
        print("=" * 60)
        print("Impute Missing Values (median)")

        continuous_cols = self._continuous_cols()
        self.imputer.fit(self.X_train[continuous_cols])

        for X in [self.X_train, self.X_test]:
            X[continuous_cols] = self.imputer.transform(X[continuous_cols])

        print("Done.\n")

####################################################################
    # Helper: cột liên tục thực sự = tất cả cột số TRỪ các cột one-hot
    def _continuous_cols(self):
        """
        Hàm nội bộ trả về danh sách tên các cột được coi là "liên tục thật
        sự" (continuous), tức là: tất cả cột kiểu số trong self.X_train,
        TRỪ các cột one-hot 0/1 đã tạo ra ở one_hot_encode() (được liệt kê
        trong self.onehot_groups). Dùng để đảm bảo các bước winsorize,
        log-transform, scale, ép range CHỈ áp dụng lên cột số thực sự có ý
        nghĩa liên tục (như duration, byte count...), không vô tình áp dụng
        lên các cột nhị phân 0/1 (vốn không nên bị "clip" hay "scale").
        """
        onehot_cols = set()
        for cols in self.onehot_groups.values():
            onehot_cols.update(cols)

        numeric_cols = self.X_train.select_dtypes(include=[np.number]).columns
        return [c for c in numeric_cols if c not in onehot_cols]

####################################################################
    # Bước 9: Winsorize - chỉ áp dụng cho cột liên tục
    def fit_winsorizer(self, percentile=0.95):
        """
        Tính ngưỡng cắt trên (upper bound) cho từng cột liên tục, dựa trên
        giá trị percentile 95 (mặc định) của TRAIN - tức giá trị mà 95% dữ
        liệu train nằm dưới nó. Lưu vào self.upper_bound[col] = ngưỡng đó.
        Chưa cắt dữ liệu ở bước này, chỉ TÍNH ngưỡng.
        """
        print("=" * 60)
        print("Fit Winsorizer")

        self.upper_bound.clear()
        for col in self._continuous_cols():
            self.upper_bound[col] = self.X_train[col].quantile(percentile)

        print(f"Winsorizing {len(self.upper_bound)} continuous columns.")
        print("Done.\n")

    def transform_winsorizer(self):
        """
        Áp dụng ngưỡng đã tính ở fit_winsorizer(): với mỗi cột liên tục, mọi
        giá trị VƯỢT QUÁ ngưỡng upper_bound[col] sẽ bị "kẹp" (clip) xuống
        đúng bằng ngưỡng đó (giá trị nhỏ hơn ngưỡng giữ nguyên). Áp dụng cho
        cả train và test, dùng CHUNG ngưỡng đã tính từ train. Mục đích: giảm
        ảnh hưởng của outlier cực đoan mà không xóa hẳn dòng dữ liệu.
        """
        print("=" * 60)
        print("Apply Winsorizer")

        for col, upper in self.upper_bound.items():
            for X in [self.X_train, self.X_test]:
                X[col] = X[col].clip(upper=upper)
        print("Done.\n")

####################################################################
    # Bước 10: Log-transform cột lệch phải mạnh (chỉ cột liên tục)
    def log_transform(self):
        """
        Áp dụng phép biến đổi log1p (tức log(1 + x), tránh lỗi log(0)) lên
        các cột được liệt kê trong self.log_features (vd dur, sbytes, dbytes,
        rate, sload...) - đây là các cột có phân phối lệch phải rất mạnh
        (đa số giá trị nhỏ, một số ít giá trị cực lớn) trong dữ liệu mạng.
        Chỉ áp dụng cho cột nào vừa nằm trong log_features VỪA là cột liên
        tục thực sự (không áp dụng nếu vô tình trùng tên với cột one-hot).
        Áp dụng cho cả train và test.
        """
        print("=" * 60)
        print("Log Transform")

        continuous_cols = set(self._continuous_cols())
        for col in self.log_features:
            if col in continuous_cols:
                for X in [self.X_train, self.X_test]:
                    X[col] = np.log1p(X[col])
        print("Done.\n")

####################################################################
    # Bước 11: RobustScaler cho cột liên tục
    def fit_scaler(self):
        """
        Fit self.scaler (RobustScaler) trên các cột liên tục của TRAIN -
        với mỗi cột, RobustScaler tính median và IQR (khoảng phần trăm 25-75)
        của cột đó để chuẩn bị cho bước chuẩn hóa. Lưu danh sách cột liên
        tục đã dùng vào self.scale_cols (để dùng lại ở các bước sau).
        """
        print("=" * 60)
        print("Fit RobustScaler")

        self.scale_cols = self._continuous_cols()
        self.scaler.fit(self.X_train[self.scale_cols])
        print(f"Scaling {len(self.scale_cols)} continuous columns.")
        print("Done.\n")

    def transform_scaler(self):
        """
        Áp dụng công thức RobustScaler đã fit: với mỗi giá trị x trong cột
        liên tục, biến đổi thành (x - median) / IQR. Kết quả: đa số giá trị
        sẽ nằm quanh 0, ít bị ảnh hưởng bởi outlier hơn so với chuẩn hóa
        kiểu (x - mean) / std thông thường. Áp dụng cho cả train và test,
        dùng chung median/IQR đã tính từ train.
        """
        print("=" * 60)
        print("Apply RobustScaler")

        for X in [self.X_train, self.X_test]:
            X[self.scale_cols] = self.scaler.transform(X[self.scale_cols])
        print("Done.\n")

####################################################################
    # Bước 12 (MỚI): Ép cột liên tục về range cố định cho spline (vd [-1, 1])
    # RobustScaler chỉ đảm bảo median=0, IQR=1, KHÔNG đảm bảo min/max cố định.
    # KAN cần grid input nằm trong khoảng biết trước -> cần bước ép cứng này.
    #
    # Cách làm: sau RobustScaler, lấy min/max thực tế trên train cho mỗi cột,
    # clip train/val/test vào [min_train, max_train], rồi min-max scale về
    # self.hard_range. Giá trị test/val vượt ngoài min/max train sẽ bị clip
    # (và được log lại trong range_stats để biết mức độ ảnh hưởng).
    def fit_hard_range(self):
        """
        Với mỗi cột liên tục (sau khi đã RobustScaler), tính giá trị nhỏ
        nhất (min) và lớn nhất (max) THỰC TẾ trên TRAIN - lưu vào
        self._train_min / self._train_max. Đây là bước chuẩn bị, chưa biến
        đổi dữ liệu. Mục đích của 2 giá trị này: dùng làm mốc để ép toàn bộ
        cột đó về đúng khoảng self.hard_range (vd [-1, 1]) ở bước
        transform_hard_range() kế tiếp - vì RobustScaler chỉ đảm bảo
        median=0, IQR=1 chứ không đảm bảo min/max nằm trong khoảng cố định
        nào, trong khi KAN cần input nằm trong một range đã biết trước cho
        spline.
        """
        print("=" * 60)
        print("Fit Hard Range (for spline grid)")

        self._train_min = self.X_train[self.scale_cols].min()
        self._train_max = self.X_train[self.scale_cols].max()

        print(f"Target range: {self.hard_range}")
        print("Done.\n")

    def transform_hard_range(self):
        """
        Ép mọi giá trị của các cột liên tục về đúng khoảng self.hard_range
        (mặc định [-1, 1]), theo 3 bước cho MỖI cột, áp dụng cho cả train
        và test:

          1. Đếm số lượng giá trị NẰM NGOÀI khoảng [train_min, train_max]
             (đã tính ở fit_hard_range) - lưu số đếm này vào
             self.range_stats[col] để biết mức độ dữ liệu test lệch khỏi
             phân phối của train (chỉ mang tính thống kê/ghi log).
          2. "Kẹp" (clip) mọi giá trị vào đúng khoảng [train_min, train_max]
             - giá trị nhỏ hơn train_min bị nâng lên = train_min, giá trị
             lớn hơn train_max bị hạ xuống = train_max.
          3. Biến đổi tuyến tính (min-max scaling) giá trị đã kẹp ở bước 2
             từ khoảng [train_min, train_max] sang đúng khoảng self.hard_range
             (vd [-1, 1]), theo công thức:
             x_new = lo + (x_clipped - train_min) * (hi - lo) / (train_max - train_min)

        Nếu một cột có train_min == train_max (cột hằng số, hiếm gặp vì đã
        bị loại ở bước variance threshold), toàn bộ giá trị được gán cứng =
        lo (cận dưới của hard_range) để tránh chia cho 0.

        Cuối cùng, lưu vào self.range_stats: train_min/train_max GỐC (trước
        khi ép range) và target_range đã dùng cho MỖI cột - để phục vụ bước
        sinh RTL/cấu hình grid spline sau này (cần biết chính xác cách map
        ngược từ giá trị đã chuẩn hóa về giá trị vật lý gốc nếu cần).
        """
        print("=" * 60)
        print("Apply Hard Range")

        lo, hi = self.hard_range
        self.range_stats.clear()

        for name, X in [("train", self.X_train), ("test", self.X_test)]:
            for col in self.scale_cols:
                col_min, col_max = self._train_min[col], self._train_max[col]

                # đếm số điểm vượt ngoài range của train TRƯỚC khi clip (để biết
                # mức độ dữ liệu val/test nằm ngoài phân phối train)
                n_out = ((X[col] < col_min) | (X[col] > col_max)).sum()
                if n_out > 0:
                    self.range_stats.setdefault(col, {})[f"{name}_out_of_range_count"] = int(n_out)

                clipped = X[col].clip(lower=col_min, upper=col_max)
                if col_max > col_min:
                    X[col] = lo + (clipped - col_min) * (hi - lo) / (col_max - col_min)
                else:
                    X[col] = lo  # cột hằng số (hiếm gặp sau variance filter)

        # lưu lại range gốc [train_min, train_max] -> [lo, hi] để dùng cho RTL/spline grid
        for col in self.scale_cols:
            self.range_stats.setdefault(col, {})
            self.range_stats[col]["train_min_before_hard_range"] = float(self._train_min[col])
            self.range_stats[col]["train_max_before_hard_range"] = float(self._train_max[col])
            self.range_stats[col]["target_range"] = list(self.hard_range)

        print("Done.\n")

####################################################################
    # Bước 13: Variance Threshold - chạy SAU one-hot, trên toàn bộ cột
    # (bắt được cả cột one-hot gần như hằng số lẫn cột liên tục ít biến thiên)
    def remove_low_variance(self, threshold=0.001):
        """
        Loại bỏ các cột có phương sai (variance) THẤP HƠN threshold (mặc
        định 0.001), tính trên TRAIN (sau khi đã one-hot và ép hard-range).
        Đây là các cột gần như không đổi giá trị giữa các dòng (vd một cột
        one-hot mà >99.9% dòng đều = 0, tức category đó cực hiếm; hoặc một
        cột liên tục gần như hằng số) - những cột này gần như không mang
        thông tin phân biệt giữa các mẫu, nên loại bỏ để giảm input dim.
        Cột nào bị loại sẽ bị xóa khỏi CẢ train và test (qua
        _drop_columns_everywhere), đồng thời cập nhật lại self.onehot_groups
        để các cột one-hot đã bị xóa không còn xuất hiện trong danh sách
        nhóm nữa (qua _update_onehot_groups).
        """
        print("=" * 60)
        print("Variance Threshold")

        selector = VarianceThreshold(threshold)
        selector.fit(self.X_train)
        cols = self.X_train.columns[selector.get_support()]

        self._drop_columns_everywhere(set(self.X_train.columns) - set(cols))
        self._update_onehot_groups(cols)

        print(f"Remaining Features : {len(cols)}")
        print()

####################################################################
    # Bước 14: Correlation Filter - chạy SAU one-hot
    def remove_high_correlation(self, threshold=0.95):
        """
        Loại bỏ các cột có tương quan (correlation, giá trị tuyệt đối) CAO
        HƠN threshold (mặc định 0.95) với một cột khác, tính trên TRAIN:

          1. Tính ma trận tương quan Pearson giữa TẤT CẢ các cặp cột (bao
             gồm cả cột liên tục lẫn cột one-hot) bằng self.X_train.corr(),
             lấy giá trị tuyệt đối.
          2. Chỉ xét nửa trên đường chéo của ma trận (tránh đếm trùng một
             cặp 2 lần, và tránh so một cột với chính nó).
          3. Với mỗi cột, nếu nó có tương quan > threshold với BẤT KỲ cột
             nào khác (xét theo thứ tự cột trong DataFrame) -> đánh dấu cột
             đó để loại bỏ.
          4. Xóa các cột đã đánh dấu khỏi cả train và test, cập nhật lại
             self.onehot_groups tương tự remove_low_variance.

        Mục đích: 2 cột tương quan gần như tuyệt đối mang thông tin gần như
        trùng lặp - giữ cả hai không giúp ích thêm nhiều nhưng làm tăng số
        chiều đầu vào không cần thiết cho phần cứng.
        """
        print("=" * 60)
        print("Correlation Filter")

        corr = self.X_train.corr().abs()
        upper = corr.where(np.triu(np.ones(corr.shape), k=1).astype(bool))
        drop_columns = [column for column in upper.columns if any(upper[column] > threshold)]

        self._drop_columns_everywhere(drop_columns)
        remaining = [c for c in self.X_train.columns]
        self._update_onehot_groups(remaining)

        print(f"Removed Features : {len(drop_columns)}")
        print(f"Remaining Features : {self.X_train.shape[1]}")
        print()

####################################################################
    # Helper: xóa cột đồng bộ trên train/val/test
    def _drop_columns_everywhere(self, cols_to_drop):
        """
        Hàm nội bộ: xóa đồng thời một danh sách cột (cols_to_drop) khỏi CẢ
        self.X_train và self.X_test, đảm bảo 2 tập luôn có cùng bộ cột sau
        mỗi lần lọc feature (variance threshold, correlation filter...).
        """
        cols_to_drop = list(cols_to_drop)
        for attr in ["X_train", "X_test"]:
            X = getattr(self, attr)
            X.drop(columns=[c for c in cols_to_drop if c in X.columns], inplace=True)

    # Helper: cập nhật lại onehot_groups sau khi một số cột one-hot bị loại bởi
    # variance/correlation filter (để feature selection theo nhóm vẫn đúng)
    def _update_onehot_groups(self, remaining_cols):
        """
        Hàm nội bộ: sau khi một số cột one-hot bị xóa (do variance/correlation
        filter), cập nhật lại self.onehot_groups[col] để chỉ còn giữ những
        tên cột one-hot THỰC SỰ CÒN TỒN TẠI (nằm trong remaining_cols). Việc
        này đảm bảo bước feature_importance() sau này tính đúng nhóm, không
        bị lỗi tham chiếu tới cột đã bị xóa.
        """
        remaining_cols = set(remaining_cols)
        for col in self.categorical_cols:
            self.onehot_groups[col] = [c for c in self.onehot_groups[col] if c in remaining_cols]

####################################################################
    # Bước 15: Random Forest importance - tính trên từng cột one-hot,
    # sau đó AGGREGATE (cộng dồn) importance trong cùng nhóm categorical
    # thành một "importance nhóm" - phục vụ chọn feature theo hướng 2
    # (all-or-nothing): giữ hoặc loại NGUYÊN block one-hot của một categorical.
    def feature_importance(self, target="binary"):
        """
        Xếp hạng độ quan trọng của các đặc trưng đầu vào, dùng mô hình
        RandomForestClassifier (300 cây quyết định), theo các bước:

          1. Chọn nhãn y: nếu target="binary" dùng self.y_train_binary (tấn
             công hay không), nếu target="multi" dùng self.y_train_multi
             (loại tấn công cụ thể).
          2. Train RandomForest trên self.X_train (toàn bộ cột hiện có, gồm
             cả cột liên tục lẫn cột one-hot) với nhãn y đã chọn.
          3. Lấy độ quan trọng (feature_importances_) của TỪNG CỘT one-hot
             riêng lẻ từ RandomForest đã train.
          4. GOM NHÓM (aggregate): với mỗi categorical gốc (proto/service/
             state), CỘNG DỒN importance của tất cả cột one-hot thuộc nhóm
             đó thành một con số "importance nhóm" duy nhất - gọi nhóm này
             là một "unit". Mỗi cột liên tục (không thuộc nhóm one-hot nào)
             cũng là một "unit" riêng, với importance = chính nó.
          5. Sắp xếp toàn bộ danh sách unit (cả nhóm categorical lẫn cột
             liên tục) theo importance giảm dần.
          6. Lưu kết quả vào self.units_binary (nếu target="binary") hoặc
             self.units_multi (nếu target="multi") - dùng cho bước
             select_top_features() kế tiếp.

        Mục đích của việc gom nhóm: đảm bảo khi chọn top feature, một
        categorical gốc (vd "state") được GIỮ HOẶC LOẠI NGUYÊN CẢ KHỐI one-hot
        của nó (all-or-nothing), tránh trường hợp giữ state_FIN nhưng loại
        state_SYN làm model không còn phân biệt được 2 giá trị đó.
        """
        print("=" * 60)
        print(f"Random Forest Feature Importance ({target})")

        y = self.y_train_binary if target == "binary" else self.y_train_multi

        rf = RandomForestClassifier(n_estimators=300, random_state=self.random_state, n_jobs=-1)
        rf.fit(self.X_train, y)

        raw_importance = dict(zip(self.X_train.columns, rf.feature_importances_))

        # gom cột one-hot cùng nhóm lại thành 1 "unit", cột liên tục là unit riêng lẻ
        onehot_cols_flat = set()
        for cols in self.onehot_groups.values():
            onehot_cols_flat.update(cols)

        units = []  # mỗi unit: {"name":..., "columns":[...], "importance": sum}
        for col, cols in self.onehot_groups.items():
            if len(cols) == 0:
                continue
            units.append({
                "name": col,
                "columns": cols,
                "importance": sum(raw_importance[c] for c in cols)
            })

        for col in self.X_train.columns:
            if col not in onehot_cols_flat:
                units.append({
                    "name": col,
                    "columns": [col],
                    "importance": raw_importance[col]
                })

        units = sorted(units, key=lambda u: u["importance"], reverse=True)

        if target == "binary":
            self.units_binary = units
        else:
            self.units_multi = units

        print(pd.DataFrame([{"unit": u["name"], "n_cols": len(u["columns"]),
                              "importance": u["importance"]} for u in units]))
        print()

####################################################################
    # Bước 16: Chọn top-K UNIT quan trọng nhất (không phải top-K cột).
    # Một categorical group tính là 1 unit dù mở rộng thành nhiều cột one-hot -
    # đảm bảo giữ/loại nguyên khối, đúng hướng "all-or-nothing" đã chọn.
    def select_top_features(self, top_k_units=15):
        """
        Chọn ra bộ đặc trưng cuối cùng sẽ đưa vào KAN, dựa trên danh sách
        "unit" đã xếp hạng ở feature_importance() (self.units_binary /
        self.units_multi):

          1. Lấy top_k_units UNIT có importance cao nhất (mặc định 15 unit -
             LƯU Ý: đây là số UNIT, một unit categorical có thể mở rộng
             thành NHIỀU cột one-hot, nên số cột input cuối cùng thường sẽ
             LỚN HƠN 15).
          2. Với mỗi unit được chọn, lấy TOÀN BỘ danh sách cột thuộc unit đó
             (nếu là categorical thì lấy hết các cột one-hot con, nếu là cột
             liên tục thì chỉ có 1 cột chính nó) - gộp lại thành danh sách
             cột cuối cùng.
          3. Làm việc này RIÊNG cho 2 bài toán: self.selected_features_binary
             (dựa trên self.units_binary) và self.selected_features_multi
             (dựa trên self.units_multi) - vì đặc trưng quan trọng cho bài
             toán nhị phân có thể khác với đa lớp.
          4. Cắt self.X_train/X_test theo đúng danh sách cột đã chọn, lưu
             kết quả riêng vào self.X_train_binary/X_test_binary (cho bài
             toán nhị phân) và self.X_train_multi/X_test_multi (cho bài
             toán đa lớp).
        """
        print("=" * 60)
        print(f"Select Top {top_k_units} Units")

        def build_feature_list(units):
            chosen_units = units if top_k_units is None else units[:top_k_units]
            cols = []
            for u in chosen_units:
                cols.extend(u["columns"])
            return cols, chosen_units

        self.selected_features_binary, chosen_binary = build_feature_list(self.units_binary)
        self.selected_features_multi, chosen_multi = build_feature_list(self.units_multi)

        self.X_train_binary = self.X_train[self.selected_features_binary]
        self.X_test_binary = self.X_test[self.selected_features_binary]

        self.X_train_multi = self.X_train[self.selected_features_multi]
        self.X_test_multi = self.X_test[self.selected_features_multi]

        print(f"Binary   : {len(chosen_binary)} units -> {len(self.selected_features_binary)} input columns")
        print(f"Multi    : {len(chosen_multi)} units -> {len(self.selected_features_multi)} input columns")
        print()

####################################################################
    # Bước 17: Thống kê phân phối lớp (để bước sau tự quyết định class-weight/sampler)
    def class_distribution_report(self):
        """
        Đếm số lượng mẫu của từng giá trị nhãn, riêng cho cả 2 bài toán và
        cả 2 tập dữ liệu (không tính val vì val không được tách trong
        pipeline này):

          - self.class_dist["binary"]["train"/"test"]: số mẫu nhãn 0 (bình
            thường) và 1 (tấn công) trong y_train_binary/y_test_binary.
          - self.class_dist["multi"]["train"/"test"]: số mẫu của từng mã số
            loại tấn công (đã encode) trong y_train_multi/y_test_multi.

        Kết quả chỉ để GHI LẠI THÔNG TIN (không tự động cân bằng lớp) - bước
        training sau này (nơi sẽ tự tách validation) tự quyết định có cần
        class-weight hay oversampling hay không, dựa trên báo cáo này.
        """
        print("=" * 60)
        print("Class Distribution Report")

        def distribution_by_id(y):
            counts = y.value_counts().sort_index()
            return {str(int(k)): int(v) for k, v in counts.items()}

        def distribution_by_name(y):
            counts = y.value_counts().sort_index()

            result = {}
            for idx, cnt in counts.items():
                if idx < len(self.attack_encoder.classes_):
                    name = self.attack_encoder.inverse_transform([idx])[0]
                else:
                    name = "unknown"

                result[name] = int(cnt)

            return result

        # Lưu mapping id -> tên và tên -> id
        self.attack_cat_mapping = {
            "id_to_name": {
                str(i): cls
                for i, cls in enumerate(self.attack_encoder.classes_)
            },
            "name_to_id": {
                cls: int(i)
                for i, cls in enumerate(self.attack_encoder.classes_)
            }
        }

        self.class_dist = {
            "binary": {
                "train": {
                    "0": int((self.y_train_binary == 0).sum()),
                    "1": int((self.y_train_binary == 1).sum())
                },
                "test": {
                    "0": int((self.y_test_binary == 0).sum()),
                    "1": int((self.y_test_binary == 1).sum())
                }
            },

            "multi": {
                "train_by_id"  : distribution_by_id(self.y_train_multi),
                "train_by_name": distribution_by_name(self.y_train_multi),

                "test_by_id"  : distribution_by_id(self.y_test_multi),
                "test_by_name": distribution_by_name(self.y_test_multi)
            }
        }

        print(json.dumps(self.class_dist, indent=2, ensure_ascii=False))
        print()

####################################################################
    # Bước 18: Xuất CSV
    def export_csv(self):
        """
        Ghi kết quả tiền xử lý cuối cùng ra 4 file CSV trong self.output_dir:

          - unsw_binary_train.csv: X_train_binary + thêm cột "label" (nhãn
            nhị phân) từ y_train_binary.
          - unsw_binary_test.csv: tương tự nhưng dùng X_test_binary/
            y_test_binary.
          - unsw_multiclass_train.csv: X_train_multi + thêm cột "attack_cat"
            (nhãn đa lớp, đã encode số) từ y_train_multi.
          - unsw_multiclass_test.csv: tương tự nhưng dùng X_test_multi/
            y_test_multi.

        Không xuất file validation - việc tách validation để tự làm ở bước
        training, từ chính file unsw_*_train.csv này.
        """
        print("=" * 60)
        print("Export CSV")

        def prepare_features(X):
            X_export = X.copy()

            # Nếu còn cột object thì encode
            obj_cols = X_export.select_dtypes(include=["object"]).columns.tolist()
            if obj_cols:
                print(f"Cảnh báo: tìm thấy cột object: {obj_cols}")
                for col in obj_cols:
                    X_export[col] = X_export[col].astype("category").cat.codes

            return X_export.astype("float32")

        # ---------------- Binary ----------------
        print("Binary feature shape :", self.X_train_binary.shape)
        train_binary = prepare_features(self.X_train_binary)
        train_binary["label"] = self.y_train_binary.astype("int64").values
        train_binary.to_csv(
            os.path.join(self.output_dir, "unsw_binary_train.csv"),
            index=False
        )

        test_binary = prepare_features(self.X_test_binary)
        test_binary["label"] = self.y_test_binary.astype("int64").values
        test_binary.to_csv(
            os.path.join(self.output_dir, "unsw_binary_test.csv"),
            index=False
        )

        # ---------------- Multiclass ----------------

        print("Multi feature shape  :", self.X_train_multi.shape)
        train_multi = prepare_features(self.X_train_multi)
        train_multi["attack_cat"] = self.y_train_multi.astype("int64").values
        train_multi.to_csv(
            os.path.join(self.output_dir, "unsw_multiclass_train.csv"),
            index=False
        )

        test_multi = prepare_features(self.X_test_multi)
        test_multi["attack_cat"] = self.y_test_multi.astype("int64").values
        test_multi.to_csv(
            os.path.join(self.output_dir, "unsw_multiclass_test.csv"),
            index=False
        )

        print("Binary columns :", len(train_binary.columns) - 1)
        print("Multi columns  :", len(train_multi.columns) - 1)
        print("Finished.\n")    

####################################################################
    # Bước 19: Lưu artifacts (encoder/scaler/imputer/mapping) + metadata JSON
    # cho bước sinh RTL / cấu hình grid spline sau này.
    def save_artifacts(self):
        """
        Lưu lại 2 file để phục vụ tái sử dụng và tra cứu sau này:

          1. preprocessing_artifacts.joblib (dùng joblib.dump) - chứa các
             OBJECT Python thực tế cần để tái áp dụng đúng pipeline này lên
             dữ liệu mới sau này mà KHÔNG cần fit lại từ đầu: attack_encoder,
             scaler (RobustScaler đã fit), imputer (đã fit), upper_bound
             (ngưỡng winsorize), kept_categories (danh sách category giữ
             riêng), onehot_groups (mapping cột gốc -> cột one-hot),
             scale_cols (danh sách cột đã scale), hard_range, và danh sách
             feature cuối cùng cho cả 2 bài toán.

          2. preprocessing_metadata.json (dùng json.dump, đọc được bằng mắt
             thường/text editor, không cần Python) - chứa các THÔNG TIN TÓM
             TẮT dạng con số/text để bước sinh RTL và cấu hình grid spline
             tham khảo trực tiếp: ngưỡng gộp category, danh sách category
             giữ lại theo từng cột, kích thước từng nhóm one-hot, khoảng
             range cố định đã dùng, thống kê min/max gốc + số điểm ngoài
             range (range_stats), số chiều đầu vào cuối cùng cho cả 2 bài
             toán (input_dim_binary/input_dim_multi), danh sách tên feature
             đã chọn, và bảng phân phối lớp.
        """
        print("=" * 60)
        print("Saving artifacts & metadata")

        artifacts = {
            "attack_encoder": self.attack_encoder,
            "scaler": self.scaler,
            "imputer": self.imputer,
            "upper_bound": self.upper_bound,
            "kept_categories": self.kept_categories,
            "onehot_groups": self.onehot_groups,
            "scale_cols": self.scale_cols,
            "hard_range": self.hard_range,
            "selected_features_binary": self.selected_features_binary,
            "selected_features_multi": self.selected_features_multi,
        }
        joblib.dump(artifacts, os.path.join(self.output_dir, "preprocessing_artifacts.joblib"))

        metadata = {
            "rare_category_threshold": self.rare_category_threshold,
            "kept_categories": self.kept_categories,
            "onehot_group_sizes": {k: len(v) for k, v in self.onehot_groups.items()},
            "hard_range": self.hard_range,
            "range_stats": self.range_stats,
            "input_dim_binary": len(self.selected_features_binary),
            "input_dim_multi": len(self.selected_features_multi),
            "selected_features_binary": self.selected_features_binary,
            "selected_features_multi": self.selected_features_multi,
            "class_distribution": self.class_dist,
            "attack_cat_mapping": self.attack_cat_mapping,
        }
        with open(os.path.join(self.output_dir, "preprocessing_metadata.json"), "w") as f:
            json.dump(metadata, f, indent=2, default=str)

        #print("Saved artifacts + metadata.\n")


####################################################################

pipeline = UNSWPreprocessorKAN(
    train_path="dataset/UNSW_NB15_training-set.csv",
    test_path="dataset/UNSW_NB15_testing-set.csv",
    rare_category_threshold=0.01,   # chỉnh lại sau khi xem value_counts() thực tế
    hard_range=(-1.0, 1.0),
)

# 1. Load & clean
pipeline.load_data()
pipeline.clean_data()

# 2. Encode nhãn mục tiêu
pipeline.encode_target()

# 3. Gộp category hiếm -> "other", rồi One-Hot
pipeline.fit_category_grouping()
pipeline.apply_category_grouping()
pipeline.one_hot_encode()

# 4. Tách feature/label
pipeline.split_dataset()

# 5. Impute missing
pipeline.impute_missing()

# 6. Winsorize -> Log -> RobustScaler (chỉ cột liên tục, one-hot giữ nguyên 0/1)
pipeline.fit_winsorizer()
pipeline.transform_winsorizer()
pipeline.log_transform()
pipeline.fit_scaler()
pipeline.transform_scaler()

# 7. Ép range cố định cho spline (vd [-1, 1])
pipeline.fit_hard_range()
pipeline.transform_hard_range()

# 8. Feature selection SAU one-hot: variance -> correlation -> RF importance theo nhóm
pipeline.remove_low_variance()
pipeline.remove_high_correlation()
pipeline.feature_importance(target="binary")
pipeline.feature_importance(target="multi")
pipeline.select_top_features(top_k_units=32)

# 9. Báo cáo phân phối lớp (để bước training tự tách validation + quyết định
#    class-weight/sampler dựa trên unsw_*_train.csv)
pipeline.class_distribution_report()

# 10. Xuất CSV (chỉ train/test) + lưu artifact/metadata
pipeline.export_csv()
pipeline.save_artifacts()