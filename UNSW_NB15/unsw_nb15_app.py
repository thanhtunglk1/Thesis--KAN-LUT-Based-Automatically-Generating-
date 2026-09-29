import json
import os
import sys

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantHardTanh
import joblib
import numpy as np
import pandas as pd
import serial
import serial.tools.list_ports
import torch
import torch.nn as nn

from PySide6.QtWidgets import (
    QApplication, QComboBox, QFormLayout, QGroupBox, QHBoxLayout,
    QLabel, QMainWindow, QMessageBox, QPlainTextEdit, QPushButton, QSplitter,
    QVBoxLayout, QWidget,
)

from unsw_preprocessor import UNSWNB15Preprocessor

sys.path.append("../common")
from KAN_LUT import KAN_LUT
from quant import QuantBrevitasActivation, ScalarBiasScale


# from preprocessing import UNSWNB15Preprocessor

# ============================================================
# CONFIG
# ============================================================

MODEL_TAG = "final"
MODEL_DIR = f"models/{MODEL_TAG}"

TEST_FILE = "dataset/UNSW_NB15_testing-set.csv"
PREPROCESSOR_FILE = "output/preprocessing_artifacts.joblib"

BAUDRATES = [
    9600,
    19200,
    38400,
    57600,
    115200,
    230400,
    460800,
    921600,
]

# ============================================================
# LOAD KAN-LUT + PREPROCESSOR
# ============================================================

def load_model():
    device = "cuda" if torch.cuda.is_available() else "cpu"

    with open(os.path.join(MODEL_DIR, "config.json")) as f:
        config = json.load(f)

    pth = next(
        os.path.join(MODEL_DIR, f)
        for f in os.listdir(MODEL_DIR)
        if f.endswith(".pth")
    )

    checkpoint = torch.load(pth, map_location=device)

    # KAN input quantizer

    bn_in = nn.BatchNorm1d(config['layers'][0])
    nn.init.constant_(bn_in.weight.data, 1)
    nn.init.constant_(bn_in.bias.data  , 0)

    bias = ScalarBiasScale(scale=False, bias=True, bias_init=-0.25)

    quant = QuantHardTanh(
        bit_width=config["layers_width"][0],
        quant_type=QuantType.INT,
        return_quant_tensor=False,
        min_val=-1,
        max_val=1,
        act_scaling_impl=ParameterScaling(1.33),
        signed=True,
        narrow_range=False,
    )

    input_layer = QuantBrevitasActivation(
        brevitas_module=quant, pre_transforms=[bn_in, bias], cuda=device == "cuda"
    ).to(device)

    kan = KAN_LUT(MODEL_DIR, checkpoint, config, input_layer, device)

    preprocessor = joblib.load(PREPROCESSOR_FILE)
    
    print("TYPE:", type(preprocessor))
    print("KEYS:", preprocessor.keys() if isinstance(preprocessor, dict) else "not dict")


    return kan, preprocessor, config, device


# ============================================================
# QUANTIZATION + KAN-LUT
# ============================================================
class Processor:

    def __init__(self, kan, preprocessor):
        self.kan = kan
        self.KAN = kan.KAN
        self.pre = preprocessor
        self.device = kan.device

        with torch.no_grad():
            self.input_scale, self.in_bits = (self.KAN.input_layer.get_scale_factor_bits())
            self.output_scale, self.out_bits = (self.KAN.layers[-1].output_quantizer.get_scale_factor_bits())

        self.input_scale = self.input_scale.detach()
        self.output_scale = self.output_scale.detach()

    @torch.inference_mode()
    def preprocess(self, raw):
        """Raw transaction -> selected features -> [-1,1]."""
        return self.pre.transform(raw)

    @torch.inference_mode()
    def quantize(self, X):
        x = torch.tensor(X.to_numpy(), dtype=torch.float32, device=self.device)

        x = self.KAN.input_layer(x)

        return (x / self.input_scale).round().to(torch.int)

    @torch.inference_mode()
    def predict(self, x):
        x_q = x + 2 ** (self.in_bits - 1)
        x_q = x_q.to(torch.long)
        x_q = x_q.squeeze(0)

        # print("\nx_q:")
        # print(x_q)
        # print("shape:", x_q.shape)
        # print("dtype:", x_q.dtype)
        # print("device:", x_q.device)

        # if x_q.ndim == 2 and x_q.shape[0] == 1:
        #     x_q = x_q.squeeze(0)

        # print("x_q:")
        # print(x_q)
        # print("shape:", x_q.shape)
        # print("dtype:", x_q.dtype)
        out_int = self.kan.KAN_LUT_inference(x_q)
        out_float = out_int.float() * self.output_scale

        pred = int(torch.argmax(out_int).item())
        name = self.pre.target_encoder.inverse_transform([pred])[0]

        return out_int.cpu(), out_float.cpu(), pred, name

    def to_bytes(self, x):
        values = x.detach().cpu().flatten().tolist()

        # Mỗi feature = 1 byte
        return bytes(int(v) & 0xFF for v in values)

    @staticmethod
    def hex_dump(data, columns=16):
        values = list(data)

        return "\n".join(
            " ".join(f"{v:02X}" for v in values[i : i + columns])
            for i in range(0, len(values), columns)
        )

    @staticmethod
    def format_values(values, columns=16):
        # values có thể là tensor nhiều chiều (vd shape (1, n_features)).
        # Phải flatten về 1 chiều trước, nếu không int(v) sẽ nhận cả
        # một tensor nhiều phần tử -> "only one element tensors can be
        # converted to Python scalars".
        if torch.is_tensor(values):
            values = values.detach().cpu().reshape(-1).tolist()
        else:
            values = list(values)

        values = [int(v) for v in values]
        width = max(map(lambda x: len(str(x)), values))

        return "\n".join(
            " ".join(f"{v:>{width}}" for v in values[i : i + columns])
            for i in range(0, len(values), columns)
        )


# ============================================================
# UART
# ============================================================

class UART:

    def __init__(self):
        self.ser = None

    @staticmethod
    def ports():
        return [p.device for p in serial.tools.list_ports.comports()]

    def connect(self, port, baud):
        self.disconnect()
        self.ser = serial.Serial(
            port=port,
            baudrate=baud,
            bytesize=8,
            parity=serial.PARITY_NONE,
            stopbits=1,
            timeout=1,
            write_timeout=2,
        )

    def disconnect(self):
        if self.ser:
            self.ser.close()
            self.ser = None

    def connected(self):
        return self.ser is not None and self.ser.is_open

    def send(self, data):
        if not self.connected(): raise RuntimeError("UART chưa kết nối.")

        return self.ser.write(data)


class ComPortComboBox(QComboBox):
    """ComboBox tự động quét lại danh sách cổng COM mỗi khi mở dropdown,
    để không bị kẹt danh sách cũ nếu thiết bị được cắm vào sau khi mở app."""

    def __init__(self, refresh_callback, parent=None):
        super().__init__(parent)
        self._refresh_callback = refresh_callback

    def showPopup(self):
        if self._refresh_callback:
            self._refresh_callback()
        super().showPopup()


# ============================================================
# GUI
# ============================================================

class MainWindow(QMainWindow):

    def __init__(self, processor):
        super().__init__()

        self.proc = processor
        self.uart = UART()
        self.result = None
        self.test = pd.read_csv(TEST_FILE)

        # Danh sách tên class (đồng bộ thứ tự với target_encoder.classes_ /
        # với output của model) và map class -> danh sách index dòng trong self.test
        self.class_names = list(self.proc.pre.target_encoder.classes_)
        self.class_to_indices = {
            cls: self.test.index[self.test["attack_cat"] == cls].tolist()
            for cls in self.class_names
        }

        self.setWindowTitle("UNSW-NB15 KAN-LUT → FPGA")
        self.resize(1400, 850)

        self.build_ui()
        self.refresh_ports()

        # Nạp sẵn 1 hàng mặc định cho class đầu tiên
        self.on_class_changed()

    # --------------------------------------------------------
    # UI
    # --------------------------------------------------------

    def build_ui(self):
        root = QWidget()
        self.setCentralWidget(root)

        layout = QVBoxLayout(root)

        title = QLabel("UNSW-NB15 KAN-LUT → FPGA")
        title.setStyleSheet("font-size:22px;font-weight:bold")

        subtitle = QLabel(
            "Random Test Transaction | Preprocessing → Quantization → KAN-LUT"
            " → UART"
        )
        subtitle.setStyleSheet("color:#888")

        layout.addWidget(title)
        layout.addWidget(subtitle)

        splitter = QSplitter()

        splitter.addWidget(self.input_panel())
        splitter.addWidget(self.output_panel())

        splitter.setSizes([650, 750])
        layout.addWidget(splitter, 1)

        self.status = QLabel("Ready")
        self.status.setStyleSheet(
            "background:#181818;color:#00FF55;padding:6px"
        )

        layout.addWidget(self.status)

    # --------------------------------------------------------
    # LEFT PANEL
    # --------------------------------------------------------

    def input_panel(self):
        widget = QWidget()
        layout = QVBoxLayout(widget)

        # Sample selection: chọn class trước, rồi chọn 1 hàng trong class đó
        group = QGroupBox("SAMPLE SELECTION")
        form = QFormLayout(group)

        self.class_combo = QComboBox()
        self.class_combo.addItems(self.class_names)
        self.class_combo.currentIndexChanged.connect(self.on_class_changed)
        form.addRow("Class:", self.class_combo)

        self.row_combo = QComboBox()
        self.row_combo.currentIndexChanged.connect(self.on_row_changed)
        form.addRow("Row:", self.row_combo)

        layout.addWidget(group)

        # Raw transaction
        group = QGroupBox("RAW TRANSACTION")
        box = QVBoxLayout(group)

        self.raw_view = QPlainTextEdit()
        self.raw_view.setReadOnly(True)
        self.style_terminal(self.raw_view)
        box.addWidget(self.raw_view)

        buttons = QHBoxLayout()

        random_btn = QPushButton("RANDOM IN CLASS")
        random_btn.clicked.connect(self.random_transaction)

        run_btn = QPushButton("RUN PYTHON")
        run_btn.setStyleSheet(
            "background:#1976D2;color:white;font-weight:bold"
        )
        run_btn.clicked.connect(self.run_reference)

        buttons.addWidget(random_btn)
        buttons.addWidget(run_btn)

        box.addLayout(buttons)
        layout.addWidget(group, 1)

        return widget

    # --------------------------------------------------------
    # RIGHT PANEL
    # --------------------------------------------------------

    def output_panel(self):
        widget = QWidget()
        layout = QVBoxLayout(widget)

        # Model
        group = QGroupBox("KAN-LUT CONFIG")
        form = QFormLayout(group)

        self.bits_label = QLabel()
        self.scale_label = QLabel()
        self.features_label = QLabel()

        form.addRow("Input bits:", self.bits_label)
        form.addRow("Input scale:", self.scale_label)
        form.addRow("K-features:", self.features_label)

        layout.addWidget(group)

        # UART
        group = QGroupBox("UART PC → FPGA")
        uart = QHBoxLayout(group)

        self.com = ComPortComboBox(refresh_callback=self.refresh_ports)
        self.baud = QComboBox()
        self.baud.addItems(map(str, BAUDRATES))
        self.baud.setCurrentText("115200")

        self.refresh_btn = QPushButton("Refresh")
        self.refresh_btn.clicked.connect(self.refresh_ports)

        self.connect_btn = QPushButton("CONNECT")
        self.connect_btn.clicked.connect(self.toggle_uart)

        send = QPushButton("SEND")
        send.setStyleSheet("background:#8E24AA;color:white;font-weight:bold")
        send.clicked.connect(self.send_uart)

        for w in [
            QLabel("COM:"),
            self.com,
            self.refresh_btn,
            QLabel("Baud:"),
            self.baud,
            self.connect_btn,
            send,
        ]:
            uart.addWidget(w)

        layout.addWidget(group)

        # Quantized input
        layout.addWidget(QLabel("QUANTIZED INPUT"))

        self.x_view = QPlainTextEdit()
        self.x_view.setReadOnly(True)
        self.x_view.setMaximumHeight(90)
        self.style_terminal(self.x_view)
        layout.addWidget(self.x_view, 1)

        # UART bytes
        layout.addWidget(QLabel("UART STREAM"))

        self.hex_view = QPlainTextEdit()
        self.hex_view.setReadOnly(True)
        self.hex_view.setMaximumHeight(90)
        self.style_terminal(self.hex_view)
        layout.addWidget(self.hex_view, 1)

        # Output
        layout.addWidget(QLabel("KAN-LUT OUTPUT"))

        self.output_view = QPlainTextEdit()
        self.output_view.setReadOnly(True)
        self.style_terminal(self.output_view)
        layout.addWidget(self.output_view, 6)

        return widget

    @staticmethod
    def style_terminal(widget):
        widget.setStyleSheet("""
            QPlainTextEdit {
                background:#080808;
                color:#00FF55;
                font-family:Consolas,"Courier New",monospace;
                font-size:11pt;
            }
        """)

    # --------------------------------------------------------
    # SAMPLE SELECTION (class -> row)
    # --------------------------------------------------------

    def load_row(self, idx):
        """Nạp 1 dòng cụ thể (theo index của self.test) làm transaction hiện tại."""
        self.current_idx = idx

        row = self.test.loc[[idx]].copy()

        # Chỉ giữ feature, bỏ target
        X = row.drop(
            columns=["attack_cat", "label", "id"],
            errors="ignore"
        ).copy()
        X = X.reset_index(drop=True)

        self.current_raw = X

        # Hiển thị raw feature dạng bảng 2 cột canh thẳng hàng (cần font
        # monospace ở raw_view thì khoảng trắng căn cột mới thật sự thẳng)
        cols = list(X.columns)
        values = [str(X.iloc[0][col]) for col in cols]

        name_width = max([len("FEATURE")] + [len(c) for c in cols])
        value_width = max([len("VALUE")] + [len(v) for v in values])

        header = f"{'FEATURE':<{name_width}}  {'VALUE':>{value_width}}"
        separator = "-" * len(header)

        lines = [header, separator]
        lines += [
            f"{col:<{name_width}}  {val:>{value_width}}"
            for col, val in zip(cols, values)
        ]

        self.raw_view.setPlainText("\n".join(lines))

        actual_class = self.test.loc[idx, "attack_cat"]
        self.status.setText(f"Selected row idx={idx} | class={actual_class}")

    def on_class_changed(self, _index=None):
        """Khi người dùng đổi class -> nạp lại danh sách hàng thuộc class đó."""
        cls = self.class_combo.currentText()
        indices = self.class_to_indices.get(cls, [])

        self.row_combo.blockSignals(True)
        self.row_combo.clear()
        for i, idx in enumerate(indices):
            self.row_combo.addItem(f"Row {i + 1}/{len(indices)}  (idx {idx})", idx)
        self.row_combo.blockSignals(False)

        if indices:
            self.row_combo.setCurrentIndex(0)
            self.load_row(indices[0])
        else:
            self.raw_view.setPlainText(f"Không có mẫu nào cho lớp '{cls}'.")

    def on_row_changed(self, _index=None):
        """Khi người dùng tự chọn 1 hàng cụ thể trong class hiện tại."""
        idx = self.row_combo.currentData()
        if idx is not None:
            self.load_row(idx)

    def random_transaction(self):
        """Chọn ngẫu nhiên 1 hàng, giới hạn trong class đang được chọn."""
        cls = self.class_combo.currentText()
        indices = self.class_to_indices.get(cls, [])

        if not indices:
            self.status.setText(f"Không có mẫu nào cho lớp '{cls}'.")
            return

        idx = int(np.random.choice(indices))
        pos = indices.index(idx)

        # Đồng bộ lại lựa chọn trên row combobox mà không load lại 2 lần
        self.row_combo.blockSignals(True)
        self.row_combo.setCurrentIndex(pos)
        self.row_combo.blockSignals(False)

        self.load_row(idx)


    # --------------------------------------------------------
    # PYTHON REFERENCE
    # --------------------------------------------------------

    def run_reference(self):
        if not hasattr(self, "current_raw"):
            self.random_transaction()

        try:
            X = self.current_raw.copy()

            # -----------------------------------------------
            # PREPROCESSING
            # -----------------------------------------------

            # X = raw.drop(columns=["attack_cat", "label"], errors="ignore")

            # print("\n===== INPUT TO PREPROCESSOR =====")
            # print("shape:", X.shape)
            # print("columns:", list(X.columns))

            # print("\n===== BEFORE PREPROCESS =====")
            # print("shape:", X.shape)
            # print("columns:")
            # for i, col in enumerate(X.columns):
            #     print(i, col)

            # print("\n===== PREPROCESSOR ATTRIBUTES =====")
            # print(vars(self.proc.pre).keys())

            # print("\n===== INPUT COLUMNS =====")
            # print(list(X.columns))

            X_pre = self.proc.preprocess(X)

            # print("===== AFTER PREPROCESS =====")
            # print("type:", type(X_pre))
            # print("shape:", X_pre.shape)
            # print("dtype:", X_pre.dtype if hasattr(X_pre, "dtype") else "N/A")
            # print("min:", X_pre.min())
            # print("max:", X_pre.max())
            # print(X_pre)

            # -----------------------------------------------
            # QUANTIZATION
            # -----------------------------------------------

            x = self.proc.quantize(X_pre)

            # print("===== AFTER QUANTIZATION =====")
            # print("x:", x)
            # print("shape:", x.shape)
            # print("dtype:", x.dtype)
            uart_data = self.proc.to_bytes(x)

            # -----------------------------------------------
            # KAN LUT
            # -----------------------------------------------

            out_int, out_float, pred, name = self.proc.predict(x)

            # -----------------------------------------------
            # DISPLAY
            # -----------------------------------------------

            # x có shape (1, n_features); len(x) trả về batch size (=1),
            # không phải số feature -> dùng x.numel() (hoặc shape[-1]) cho đúng.
            self.features_label.setText(str(x.numel()))
            self.bits_label.setText(str(self.proc.in_bits))
            self.scale_label.setText(str(self.proc.input_scale))

            self.x_view.setPlainText(self.proc.format_values(x))

            self.hex_view.setPlainText(self.proc.hex_dump(uart_data))

            self.output_view.setPlainText(
                self.format_output(out_int, out_float, pred, name, self.class_names)
            )

            self.result = {
                "x": x,
                "uart": uart_data,
                "prediction": pred,
                "label": name,
            }

            self.status.setText(
                f"Python OK | Prediction: [{pred}] {name} | UART:"
                f" {len(uart_data)} bytes"
            )

        except Exception as e:
            QMessageBox.critical(self, "Reference Error", str(e))

    # --------------------------------------------------------
    # OUTPUT FORMAT
    # --------------------------------------------------------

    @staticmethod
    def format_output(out_int, out_float, pred, name, class_names=None):
        logits = out_float.flatten().float()
        probs = torch.softmax(logits, dim=0)

        lines = [
            f"PREDICTION : [{pred}] {name}",
            "",
            f"{'CLASS':>5} {'NAME':<16} {'INT':>10} {'FLOAT':>14} {'PROB':>8}",
            "-" * 60,
        ]

        for i, (iv, fv, pv) in enumerate(
            zip(out_int.flatten(), logits, probs)
        ):
            marker = " <==" if i == pred else ""
            cls_name = class_names[i] if class_names is not None and i < len(class_names) else "?"

            lines.append(
                f"{i:5d} {cls_name:<16} {int(iv):10d} {float(fv):14.6f} {float(pv) * 100:7.2f}%{marker}"
            )

        return "\n".join(lines)

    # --------------------------------------------------------
    # UART
    # --------------------------------------------------------

    def refresh_ports(self):
        try:
            ports = self.uart.ports()
        except Exception as e:
            ports = []
            self.status.setText(f"Lỗi khi quét cổng COM: {e}")

        current = self.com.currentText()

        self.com.blockSignals(True)
        self.com.clear()
        self.com.addItems(ports)

        # Giữ lại lựa chọn cũ nếu cổng đó vẫn còn trong danh sách mới
        if current and current in ports:
            self.com.setCurrentText(current)
        self.com.blockSignals(False)

        if not self.com.count():
            self.status.setText("Không tìm thấy COM. Hãy cắm thiết bị rồi mở lại danh sách COM.")

    def toggle_uart(self):
        try:
            if self.uart.connected():
                self.uart.disconnect()
                self._set_uart_connected_ui(False)
                self.status.setText("UART disconnected.")
                return

            port = self.com.currentText()

            if not port:
                raise RuntimeError("Chưa chọn COM. Hãy mở lại danh sách COM (dropdown sẽ tự quét lại).")

            self.uart.connect(port, int(self.baud.currentText()))
            self._set_uart_connected_ui(True)

            self.status.setText(f"UART connected: {port}")

        except Exception as e:
            QMessageBox.critical(self, "UART Error", str(e))

    def _set_uart_connected_ui(self, connected: bool):
        """Đồng bộ UI với trạng thái kết nối thật, tránh cảm giác 'chọn COM không ăn'."""
        self.connect_btn.setText("DISCONNECT" if connected else "CONNECT")
        self.com.setEnabled(not connected)
        self.baud.setEnabled(not connected)
        self.refresh_btn.setEnabled(not connected)

    def send_uart(self):
        if self.result is None:
            QMessageBox.warning(self, "UART", "Hãy RUN PYTHON trước.")
            return

        try:
            data = self.result["uart"]
            n = self.uart.send(data)

            self.status.setText(f"TX complete: {n}/{len(data)} bytes")

        except Exception as e:
            QMessageBox.critical(self, "UART Error", str(e))

    # --------------------------------------------------------

    def closeEvent(self, event):
        self.uart.disconnect()
        event.accept()


# ============================================================
# MAIN
# ============================================================


def main():
    app = QApplication(sys.argv)
    kan, preprocessor, config, device = load_model()
    processor = Processor(kan, preprocessor)
    window = MainWindow(processor)
    window.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()