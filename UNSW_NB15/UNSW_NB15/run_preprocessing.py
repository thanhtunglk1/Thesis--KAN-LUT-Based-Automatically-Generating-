"""
Script chạy tiền xử lý UNSW-NB15.

QUAN TRỌNG: luôn chạy tiền xử lý qua script này (import class từ
unsw_preprocessor.py) chứ KHÔNG viết code chạy trực tiếp bên trong
unsw_preprocessor.py rồi thực thi file đó như __main__. Lý do: joblib
lưu lại đường dẫn module của class khi dump - nếu chạy trực tiếp
"python unsw_preprocessor.py", class sẽ bị gắn nhãn module là "__main__",
và mọi script khác cố load lại preprocessing_artifacts.joblib (ví dụ
demo_inference.py) sẽ báo lỗi "Can't get attribute 'UNSWNB15Preprocessor'
on <module '__main__'>". Import class như bên dưới rồi chạy sẽ tránh
được lỗi này.
"""

import pandas as pd

from unsw_preprocessor import UNSWNB15Preprocessor


def main():
    train_df = pd.read_csv("dataset/UNSW_NB15_training-set.csv")
    test_df = pd.read_csv("dataset/UNSW_NB15_testing-set.csv")

    preprocessor = UNSWNB15Preprocessor(
        output_dir="output",
        rare_threshold=0.001,
        winsorize_percentile=0.95,
        variance_threshold=0.001,
        correlation_threshold=0.95,
        hard_range=(-1.0, 1.0),
        top_k_units=19,
        validation_size=0.2,
        random_state=1,
    )

    X_train, y_train, X_val, y_val, X_test, y_test = preprocessor.preprocess_train(train_df, test_df)
    return X_train, y_train, X_val, y_val, X_test, y_test


if __name__ == "__main__":
    main()