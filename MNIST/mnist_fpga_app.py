import sys, os, json
import numpy as np
import torch
import torch.nn as nn
import serial
import serial.tools.list_ports

from PySide6.QtCore import Qt, QPoint
from PySide6.QtGui import QColor, QImage, QPainter, QPen
from PySide6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout,
    QGroupBox, QPushButton, QLabel, QComboBox, QPlainTextEdit,
    QSplitter, QMessageBox, QFormLayout, QTextEdit
)

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantHardTanh

sys.path.append("../common")
from KAN_LUT import KAN_LUT
from quant import QuantBrevitasActivation, ScalarBiasScale

# ============================================================
# CONFIG
# ============================================================

IMG_SIZE = 28
N_PIXELS = 784
CANVAS_SIZE = 480
MODEL_TAG = "final"
MODEL_DIR = f"models/{MODEL_TAG}"
BAUDRATES = [9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600]

# ============================================================
# LOAD KAN LUT
# ============================================================

def load_model():
    device = "cuda" if torch.cuda.is_available() else "cpu"
    print("Device:", device)

    config_path = os.path.join(MODEL_DIR, "config.json")
    if not os.path.exists(config_path):
        raise FileNotFoundError(f"Không tìm thấy {config_path}")

    with open(config_path, "r") as f:
        config = json.load(f)

    pth_files = [os.path.join(MODEL_DIR, f) for f in os.listdir(MODEL_DIR) if f.endswith(".pth")]
    if not pth_files:
        raise FileNotFoundError(f"Không tìm thấy .pth trong {MODEL_DIR}")

    checkpoint_path = pth_files[0]
    checkpoint = torch.load(checkpoint_path, map_location=device)
    print("Loaded:", checkpoint_path)

    # MNIST input layer
    bn_in = nn.BatchNorm1d(config["layers"][0])
    nn.init.constant_(bn_in.weight.data, 1)
    nn.init.constant_(bn_in.bias.data, 0)

    input_bias = ScalarBiasScale(scale=False, bias=True, bias_init=-0.25)

    first_layer_quant = QuantHardTanh(
        bit_width=config["layers_width"][0],
        quant_type=QuantType.INT,
        return_quant_tensor=False,
        min_val=config["grid_range"][0],
        max_val=config["grid_range"][1],
        act_scaling_impl=ParameterScaling(1.33),
        signed=True,
        narrow_range=False
    )

    MNIST_input_layer = QuantBrevitasActivation(
        brevitas_module=first_layer_quant,
        pre_transforms=[bn_in, input_bias],
        cuda=device == "cuda"
    ).to(device)

    # KAN LUT
    kan_lut = KAN_LUT(MODEL_DIR, checkpoint, config, MNIST_input_layer, device)
    # kan_lut.quick_match_check()

    return kan_lut, config, device

# ============================================================
# QUANTIZATION
# ============================================================

class QuantumProcessor:
    def __init__(self, kan_lut, config):
        self.kan = kan_lut
        self.KAN = kan_lut.KAN
        self.device = kan_lut.device
        with torch.no_grad():
            self.input_scale , self.in_bits  = self.KAN.input_layer.get_scale_factor_bits()
            self.output_scale, self.out_bits = self.KAN.layers[-1].output_quantizer.get_scale_factor_bits()

        self.input_scale  = self.input_scale.detach()
        self.output_scale = self.output_scale.detach()

        # Số lớp đầu ra: giả định phần tử cuối của config["layers"] là kích thước lớp cuối (số class)
        self.num_classes = int(config["layers"][-1])

    @torch.inference_mode()
    def quantize(self, image):
        # image: uint8 28x28, range 0..255
        x = torch.from_numpy(image.astype(np.float32) / 255.0).reshape(1, 784).to(self.device)

        # Giống torchvision.Normalize((0.1307,), (0.3081,))
        x = (x - 0.1307) / 0.3081

        # Quantization
        x = (self.KAN.input_layer(x) / self.input_scale).round().to(torch.int)
        return x[0]

    def x_to_bytes(self, x):
        values = x.detach().cpu().flatten().tolist()
        if len(values) != 784:
            raise ValueError(f"Expected 784 values, got {len(values)}")
        return bytes(int(v) & 0xFF for v in values)

    @torch.inference_mode()
    def predict(self, x):
        x_q = (x + 2 ** (self.in_bits - 1)).to(torch.int)
        out_int = self.kan.KAN_LUT_inference(x_q)
        out_float = out_int.to(torch.float32) * self.output_scale
        pred = int(torch.argmax(out_int).item())
        return out_int.cpu(), out_float.cpu(), pred

    def hex_string(self, data, columns=16):
        values = list(data)
        lines = []
        for i in range(0, len(values), columns):
            row = values[i:i + columns]
            lines.append(" ".join(f"{v:02X}" for v in row))
        return "\n".join(lines)

    # --------------------------------------------------------
    # RX: giải mã kết quả FPGA gửi về
    # --------------------------------------------------------

    def rx_byte_layout(self):
        n_value_bytes = self.num_classes   # 10 byte
        n_index_bytes = 1                  # 1 byte prediction
        total_bytes = n_value_bytes + n_index_bytes

        return n_value_bytes, n_index_bytes, total_bytes

    @staticmethod
    def unpack_signed_bytes(data: bytes, num_values: int):
        """
        Decode signed 8-bit two's complement.

        Ví dụ:
            0x00 ->   0
            0x01 ->   1
            0x7F -> 127
            0x80 -> -128
            0xFF ->  -1
        """

        if len(data) < num_values:
            raise ValueError(
                f"Không đủ byte để giải mã: "
                f"cần {num_values}, nhận {len(data)}"
            )

        values = []

        for b in data[:num_values]:
            if b & 0x80:
                # MSB = 1 -> số âm
                value = b - 256
            else:
                # MSB = 0 -> số dương
                value = b

            values.append(value)

        return values

    def parse_fpga_response(self, data: bytes):
        """
        Parse 11 byte từ FPGA:

            data[0:10] -> 10 output signed 8-bit
            data[10]   -> prediction/index
        """

        n_value_bytes, n_index_bytes, total = self.rx_byte_layout()

        if len(data) != total:
            raise ValueError(
                f"Kích thước dữ liệu FPGA không đúng: "
                f"cần {total} byte, nhận {len(data)} byte."
            )

        # --------------------------------------------
        # 10 byte output
        # --------------------------------------------

        value_bytes = data[:n_value_bytes]

        fpga_int = self.unpack_signed_bytes(
            value_bytes,
            self.num_classes
        )

        # --------------------------------------------
        # Byte cuối = prediction
        # --------------------------------------------

        fpga_index = int(data[n_value_bytes])

        # Nếu muốn quy đổi sang giá trị float
        fpga_float = [
            v * float(self.output_scale)
            for v in fpga_int
        ]

        return {
            "raw": data,
            "value_bytes": value_bytes,
            "int": fpga_int,
            "float": fpga_float,
            "index": fpga_index,
        }

    @staticmethod
    def compare(python_int, fpga_int, python_pred, fpga_pred):
        diffs = [int(f) - int(p) for p, f in zip(python_int, fpga_int)]
        max_abs_diff = max((abs(d) for d in diffs), default=0)
        return {
            "diffs": diffs,
            "max_abs_diff": max_abs_diff,
            "values_match": max_abs_diff == 0,
            "index_match": int(python_pred) == int(fpga_pred),
        }

# ============================================================
# CANVAS
# ============================================================

class MNISTCanvas(QWidget):
    def __init__(self):
        super().__init__()
        self.setFixedSize(CANVAS_SIZE, CANVAS_SIZE)
        self.image = QImage(28, 28, QImage.Format_RGB32)
        self.image.fill(Qt.black)
        self.drawing = False
        self.last_point = None

    def clear(self):
        self.image.fill(Qt.black)
        self.update()

    def to_pixel(self, x, y):
        px = max(0, min(27, int(x * IMG_SIZE / CANVAS_SIZE)))
        py = max(0, min(27, int(y * IMG_SIZE / CANVAS_SIZE)))
        return px, py

    def mousePressEvent(self, event):
        if event.button() != Qt.LeftButton:
            return
        self.drawing = True
        px, py = self.to_pixel(event.position().x(), event.position().y())
        self.last_point = QPoint(px, py)
        self.draw_point(px, py)

    def mouseMoveEvent(self, event):
        if not self.drawing:
            return
        px, py = self.to_pixel(event.position().x(), event.position().y())
        point = QPoint(px, py)

        painter = QPainter(self.image)
        painter.setPen(QPen(Qt.white, 2, Qt.SolidLine, Qt.RoundCap, Qt.RoundJoin))
        painter.drawLine(self.last_point, point)
        painter.end()

        self.last_point = point
        self.update()

    def mouseReleaseEvent(self, event):
        if event.button() == Qt.LeftButton:
            self.drawing = False
            self.last_point = None

    def draw_point(self, x, y):
        painter = QPainter(self.image)
        painter.setPen(QPen(Qt.white, 2, Qt.SolidLine, Qt.RoundCap, Qt.RoundJoin))
        painter.drawPoint(x, y)
        painter.end()
        self.update()

    def get_image(self):
        img = self.image.convertToFormat(QImage.Format_Grayscale8)
        data = np.frombuffer(img.bits(), dtype=np.uint8)
        data = data.reshape(img.height(), img.bytesPerLine())
        return data[:, :28].copy()

    def paintEvent(self, event):
        painter = QPainter(self)
        painter.fillRect(self.rect(), Qt.black)
        painter.drawImage(self.rect(), self.image)

        # Grid 28x28
        painter.setPen(QPen(QColor(55, 55, 55), 1))
        cell = CANVAS_SIZE / 28
        for i in range(29):
            p = int(i * cell)
            painter.drawLine(p, 0, p, CANVAS_SIZE)
            painter.drawLine(0, p, CANVAS_SIZE, p)
        painter.end()

# ============================================================
# UART
# ============================================================

class UART:
    def __init__(self):
        self.ser = None

    @staticmethod
    def ports():
        return [p.device for p in serial.tools.list_ports.comports()]

    def connect(self, port, baudrate):
        self.disconnect()
        self.ser = serial.Serial(
            port=port, baudrate=baudrate, bytesize=serial.EIGHTBITS,
            parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
            timeout=1, write_timeout=2
        )

    def disconnect(self):
        if self.ser is not None:
            self.ser.close()
            self.ser = None

    def is_connected(self):
        return self.ser is not None and self.ser.is_open

    def send(self, data):
        if not self.is_connected():
            raise RuntimeError("UART chưa kết nối.")
        if len(data) != 784:
            raise ValueError(f"UART data phải 784 byte, hiện tại {len(data)} byte.")
        n = self.ser.write(data)
        self.ser.flush()
        return n

    def recv(self, n_bytes, timeout=2.0):
        """Đọc chính xác n_bytes từ FPGA."""
        if not self.is_connected():
            raise RuntimeError("UART chưa kết nối.")

        self.ser.timeout = timeout
        data = self.ser.read(n_bytes)

        if len(data) != n_bytes:
            raise RuntimeError(
                f"Chỉ nhận được {len(data)}/{n_bytes} byte "
                f"(timeout hoặc mất dữ liệu)."
            )

        return data

# ============================================================
# GUI
# ============================================================

class MainWindow(QMainWindow):
    def __init__(self, kan_lut, config):
        super().__init__()
        self.qproc = QuantumProcessor(kan_lut, config)
        self.uart = UART()
        self.result = None

        self.setWindowTitle("MNIST → FPGA")
        self.resize(1250, 800)

        self.build_ui()
        self.refresh_ports()
        # self.update_rx_info()

    def build_ui(self):
        root = QWidget()
        self.setCentralWidget(root)

        main_layout = QVBoxLayout(root)

        title = QLabel("MNIST → FPGA")
        title.setStyleSheet("font-size:22px;font-weight:bold;")
        main_layout.addWidget(title)

        subtitle = QLabel("Python Golden Reference | Quantization → LUT → UART")
        subtitle.setStyleSheet("color:#888;")
        main_layout.addWidget(subtitle)

        splitter = QSplitter(Qt.Horizontal)
        main_layout.addWidget(splitter, 1)

        # LEFT
        left = QWidget()
        left_layout = QVBoxLayout(left)

        canvas_group = QGroupBox("MNIST INPUT 28 × 28")
        canvas_layout = QVBoxLayout(canvas_group)

        self.canvas = MNISTCanvas()
        canvas_layout.addWidget(self.canvas, alignment=Qt.AlignCenter)

        buttons = QHBoxLayout()
        clear_btn = QPushButton("CLEAR")
        clear_btn.clicked.connect(self.clear)

        run_btn = QPushButton("RUN PYTHON")
        run_btn.setStyleSheet("background:#1976D2;color:white;font-weight:bold;")
        run_btn.clicked.connect(self.run_reference)

        buttons.addWidget(clear_btn)
        buttons.addWidget(run_btn)
        canvas_layout.addLayout(buttons)
        left_layout.addWidget(canvas_group)

        # prediction_group = QGroupBox("PREDICTION")
        # prediction_layout = QVBoxLayout(prediction_group)
        # self.prediction = QLabel("-")
        # self.prediction.setAlignment(Qt.AlignCenter)
        # self.prediction.setStyleSheet("font-size:64px;font-weight:bold;color:#00DD77;")
        # prediction_layout.addWidget(self.prediction)

        # left_layout.addWidget(prediction_group)
        splitter.addWidget(left)

        # RIGHT
        right = QWidget()
        right_layout = QVBoxLayout(right)

        # model_group = QGroupBox("QUANTIZATION")
        # model_layout = QFormLayout(model_group)

        # self.scale_label = QLabel(str(self.qproc.input_scale))
        # self.bits_label = QLabel(str(self.qproc.in_bits))
        # self.out_scale_label = QLabel(str(self.qproc.output_scale))

        # model_layout.addRow("Input scale:", self.scale_label)
        # model_layout.addRow("Input bits:", self.bits_label)
        # model_layout.addRow("Output scale:", self.out_scale_label)
        # right_layout.addWidget(model_group)

        # UART Control (TX: PC -> FPGA)
        uart_group = QGroupBox("UART PC → FPGA")
        uart_layout = QHBoxLayout(uart_group)

        self.com_combo = QComboBox()
        self.baud_combo = QComboBox()
        self.baud_combo.addItems([str(b) for b in BAUDRATES])
        self.baud_combo.setCurrentText("115200")

        refresh_btn = QPushButton("Refresh")
        refresh_btn.clicked.connect(self.refresh_ports)

        connect_btn = QPushButton("CONNECT")
        connect_btn.clicked.connect(self.toggle_uart)

        send_btn = QPushButton("SEND 784 BYTES")
        send_btn.setStyleSheet("background:#8E24AA;color:white;font-weight:bold;")
        send_btn.clicked.connect(self.send_uart)

        uart_layout.addWidget(QLabel("COM:"))
        uart_layout.addWidget(self.com_combo)
        uart_layout.addWidget(refresh_btn)
        uart_layout.addWidget(QLabel("Baud:"))
        uart_layout.addWidget(self.baud_combo)
        uart_layout.addWidget(connect_btn)
        uart_layout.addWidget(send_btn)
        right_layout.addWidget(uart_group, 0)

        # UART RX (FPGA -> PC)
        rx_group = QGroupBox("UART FPGA → PC (RX)")
        rx_layout = QVBoxLayout(rx_group)

        # rx_layout.addWidget(QLabel("FPGA RAW (hex)"))

        self.fpga_hex_view = QPlainTextEdit()
        self.fpga_hex_view.setReadOnly(True)
        self.fpga_hex_view.setMaximumHeight(70)
        self.fpga_hex_view.setStyleSheet("""
        QPlainTextEdit {
            background: #080808;
            color: #00FF55;
            font-family: Consolas, "Courier New", monospace;
        }
        """)

        rx_layout.addWidget(self.fpga_hex_view)

        right_layout.addWidget(rx_group, 1)

        # Views
        right_layout.addWidget(QLabel("QUANTIZED x — 784 values"))
        # self.x_view = QPlainTextEdit()
        # self.x_view.setReadOnly(True)
        # right_layout.addWidget(self.x_view)
        self.x_view = QPlainTextEdit()
        self.x_view.setReadOnly(True)
        self.x_view.setStyleSheet("""
QPlainTextEdit {
    background: #080808;
    color: #00FF55;
    font-family: Consolas, "Courier New", monospace;
    font-size: 11pt;
}
""")
        right_layout.addWidget(self.x_view, 1)

        right_layout.addWidget(QLabel("UART DATA — 784 BYTES"))
        self.hex_view = QPlainTextEdit()
        self.hex_view.setReadOnly(True)
        self.hex_view.setStyleSheet("background:#080808;color:#00FF55;font-family:Consolas;")
        right_layout.addWidget(self.hex_view, 1)

        right_layout.addWidget(QLabel("KAN LUT OUTPUT — PYTHON vs FPGA"))
        # self.output_view = QPlainTextEdit()
        # self.output_view.setReadOnly(True)
        # right_layout.addWidget(self.output_view)

        self.output_view = QTextEdit() 
        self.output_view.setReadOnly(True) 
        self.output_view.setStyleSheet(""" 
            QTextEdit { background: #080808; color: #00FF55; font-family: Consolas, "Courier New", monospace; font-size: 11pt; } 
        """)
        right_layout.addWidget(self.output_view, 5)

        splitter.addWidget(right)
        splitter.setSizes([600, 650])

        self.status = QLabel("Ready")
        self.status.setStyleSheet("background:#181818;color:#00FF55;padding:6px;")
        main_layout.addWidget(self.status)

    # ========================================================
    # RX INFO
    # ========================================================

    # def update_rx_info(self):
    #     n_value_bytes, n_index_bytes, total = self.qproc.rx_byte_layout()
    #     self.rx_info_label.setText(
    #         f"Cần nhận: {total} byte  "
    #         f"({self.qproc.num_classes} class × {self.qproc.out_bits} bit → {n_value_bytes} byte giá trị "
    #         f"+ {n_index_bytes} byte index)"
    #     )

    # ========================================================
    # RUN
    # ========================================================

    def run_reference(self):
        try:
            self.status.setText("Running Python reference...")
            image = self.canvas.get_image()
            x = self.qproc.quantize(image)
            out_int, out_float, pred = self.qproc.predict(x)
            uart_data = self.qproc.x_to_bytes(x)

            prob = torch.softmax(out_float, dim=0)

            self.result = {
                "image": image, "x": x, "uart": uart_data, "prob": prob,
                "out_int": out_int, "out_float": out_float, "prediction": pred
            }

            x_values = x.detach().cpu().flatten().tolist()
            self.x_view.setPlainText(self.format_values(x_values, 16))
            self.hex_view.setPlainText(self.qproc.hex_string(uart_data))
            self.fpga_hex_view.clear()

            self.render_output_table()

            self.status.setText(f"Python OK | Prediction = {pred} | UART = 784 bytes")

        except Exception as e:
            QMessageBox.critical(self, "Python Reference Error", str(e))
            self.status.setText("Python reference ERROR")

    # ========================================================
    # OUTPUT TABLE (Python + FPGA nếu có)
    # ========================================================

    def render_output_table(self):
        if self.result is None:
            return

        out_int   = self.result["out_int"]
        out_float = self.result["out_float"]
        prob      = self.result["prob"]
        pred      = self.result["prediction"]

        int_values   = out_int.flatten().tolist()
        float_values = out_float.flatten().tolist()
        prob_values  = prob.detach().cpu().flatten().tolist()
        num_classes  = len(int_values)

        fpga = self.result.get("fpga")
        cmp_ = self.result.get("compare")

        html = [
            '<pre style="font-family: Consolas, \'Courier New\', monospace; '
            'font-size: 11pt; color: #00FF55;">'
        ]

        if fpga is None:
            html.append(f"{'CLASS':>6} {'INT':>10} {'FLOAT':>14} {'PROB':>12}")
            html.append("\n" + "-" * 46 + "\n")
        else:
            html.append(f"{'CLASS':>6} {'INT(PY)':>10} {'INT(FPGA)':>10} {'DIFF':>7} {'FLOAT':>14} {'PROB':>12}")
            html.append("\n" + "-" * 66 + "\n")

        for i in range(num_classes):
            is_pred_py   = (i == pred)
            is_pred_fpga = (fpga is not None and i == fpga["index"])

            row = f"{i:>6} {int(int_values[i]):>10d}"
            if fpga is not None:
                diff = cmp_["diffs"][i]
                row += f" {int(fpga['int'][i]):>10d} {diff:>7d}"
            row += f" {float(float_values[i]):>14.6f} {float(prob_values[i]) * 100:>11.2f}%"

            if is_pred_py and is_pred_fpga:
                row = f"<b style='color:#00FF88;'>{row}  <-- PY &amp; FPGA</b>"
            elif is_pred_py:
                row = f"<b>{row}  <-- PY</b>"
            elif is_pred_fpga:
                row = f"<b style='color:#FFD54F;'>{row}  <-- FPGA</b>"

            html.append(row + "\n")

        if fpga is not None:
            match_txt = "MATCH" if cmp_["index_match"] else "MISMATCH"
            color = "#00FF88" if cmp_["index_match"] else "#FF5555"
            html.append(
                f"\n<span style='color:{color};font-weight:bold;'>"
                f"So sánh dự đoán: Python = {pred}  |  FPGA = {fpga['index']}  |  {match_txt}"
                f"</span>\n"
                f"Sai lệch INT lớn nhất giữa các lớp: {cmp_['max_abs_diff']}\n"
            )

        html.append("</pre>")
        self.output_view.setHtml("".join(html))

    # ========================================================
    # UART ACTIONS (TX)
    # ========================================================

    def refresh_ports(self):
        self.com_combo.clear()
        ports = self.uart.ports()
        self.com_combo.addItems(ports)
        if not ports:
            self.status.setText("Không tìm thấy COM.")

    def toggle_uart(self):
        try:
            if self.uart.is_connected():
                self.uart.disconnect()
                self.status.setText("UART disconnected.")
                return

            port = self.com_combo.currentText()
            if not port:
                raise RuntimeError("Chưa chọn COM port.")

            baud = int(self.baud_combo.currentText())
            self.uart.connect(port, baud)
            self.status.setText(f"UART connected: {port} @ {baud}")

        except Exception as e:
            QMessageBox.critical(self, "UART Error", str(e))

    def send_uart(self):
        if self.result is None:
            QMessageBox.warning(
                self,
                "UART",
                "Hãy RUN PYTHON trước."
            )
            return

        if not self.uart.is_connected():
            QMessageBox.warning(
                self,
                "UART",
                "UART chưa kết nối."
            )
            return

        try:
            # ==================================================
            # TX: PC -> FPGA
            # ==================================================

            data = self.result["uart"]

            if len(data) != 784:
                raise RuntimeError(
                    f"Internal error: {len(data)} bytes"
                )

            self.status.setText(
                "Đang gửi 784 byte tới FPGA..."
            )
            QApplication.processEvents()

            n = self.uart.send(data)

            if n != 784:
                raise RuntimeError(
                    f"Chỉ gửi được {n}/784 byte."
                )

            self.status.setText(
                "TX OK — đang chờ FPGA trả về 11 byte..."
            )
            QApplication.processEvents()

            # ==================================================
            # RX: FPGA -> PC
            # ==================================================

            _, _, total_bytes = self.qproc.rx_byte_layout()

            # total_bytes = 11
            rx_data = self.uart.recv(
                total_bytes,
                timeout=5.0
            )

            # ==================================================
            # PARSE FPGA RESPONSE
            # ==================================================

            fpga = self.qproc.parse_fpga_response(rx_data)

            # ==================================================
            # COMPARE PYTHON vs FPGA
            # ==================================================

            cmp_ = self.qproc.compare(
                self.result["out_int"].flatten().tolist(),
                fpga["int"],
                self.result["prediction"],
                fpga["index"],
            )

            self.result["fpga"] = fpga
            self.result["compare"] = cmp_

            # ==================================================
            # UPDATE GUI
            # ==================================================

            self.fpga_hex_view.setPlainText(
                self.qproc.hex_string(rx_data)
            )

            self.render_output_table()

            match_txt = (
                "MATCH"
                if cmp_["index_match"]
                else "MISMATCH"
            )

            self.status.setText(
                f"TX 784 OK | RX {total_bytes} OK | "
                f"Python={self.result['prediction']} | "
                f"FPGA={fpga['index']} | "
                f"{match_txt} | "
                f"max|diff|={cmp_['max_abs_diff']}"
            )

        except Exception as e:
            QMessageBox.critical(
                self,
                "UART TX/RX Error",
                str(e)
            )

            self.status.setText(
                "UART TX/RX ERROR"
            )


    # ========================================================
    # UART ACTIONS (RX)
    # ========================================================

    def receive_fpga(self):
        if self.result is None:
            QMessageBox.warning(self, "FPGA RX", "Hãy RUN PYTHON trước để có kết quả tham chiếu.")
            return

        if not self.uart.is_connected():
            QMessageBox.warning(self, "FPGA RX", "UART chưa kết nối.")
            return

        try:
            _, _, total_bytes = self.qproc.rx_byte_layout()
            self.status.setText(f"Đang chờ nhận {total_bytes} byte từ FPGA...")
            QApplication.processEvents()

            data = self.uart.recv(total_bytes, timeout=5.0)
            fpga = self.qproc.parse_fpga_response(data)

            cmp_ = self.qproc.compare(
                self.result["out_int"].flatten().tolist(),
                fpga["int"],
                self.result["prediction"],
                fpga["index"],
            )

            self.result["fpga"] = fpga
            self.result["compare"] = cmp_

            self.fpga_hex_view.setPlainText(self.qproc.hex_string(data))
            self.render_output_table()

            match_txt = "MATCH" if cmp_["index_match"] else "MISMATCH"
            self.status.setText(
                f"FPGA RX OK | predict FPGA={fpga['index']} | predict Python={self.result['prediction']} | "
                f"{match_txt} | max|diff|={cmp_['max_abs_diff']}"
            )

        except Exception as e:
            QMessageBox.critical(self, "FPGA RX Error", str(e))
            self.status.setText("FPGA RX ERROR")

    # ========================================================
    # UTILS
    # ========================================================

    def clear(self):
        self.canvas.clear()
        self.result = None
        # self.prediction.setText("-")
        self.x_view.clear()
        self.hex_view.clear()
        self.fpga_hex_view.clear()
        self.output_view.clear()
        self.status.setText("Canvas cleared.")

    # @staticmethod
    # def format_values(values, columns=16):
    #     lines = []
    #     for i in range(0, len(values), columns):
    #         row = values[i:i + columns]
    #         lines.append(" ".join(str(int(v)) for v in row))
    #     return "\n".join(lines)

    @staticmethod
    def format_values(values, columns=16):
        lines = []
        values = [int(v) for v in values]
        # Tìm độ rộng lớn nhất, kể cả dấu âm
        width = max(len(str(v)) for v in values)
        for i in range(0, len(values), columns):
            row = values[i:i + columns]
            # Căn phải, mỗi số chiếm cùng một số ký tự
            line = " ".join(f"{v:>{width}}" for v in row)
            lines.append(line)
        return "\n".join(lines)

    def closeEvent(self, event):
        self.uart.disconnect()
        event.accept()

# ============================================================
# MAIN
# ============================================================

def main():
    app = QApplication(sys.argv)
    app.setStyleSheet("""
    /* =====================================================
       GLOBAL LIGHT THEME
       ===================================================== */

    QMainWindow {
        background-color: #F3F5F7;
    }

    QWidget {
        background-color: #F3F5F7;
        color: #263238;
    }

    QLabel {
        background-color: transparent;
        color: #263238;
    }

    /* =====================================================
       GROUP BOX
       ===================================================== */

    QGroupBox {
        background-color: #FFFFFF;
        color: #37474F;
        border: 1px solid #D9DEE3;
        border-radius: 8px;
        margin-top: 12px;
        padding: 10px;
        font-weight: bold;
    }

    QGroupBox::title {
        subcontrol-origin: margin;
        left: 12px;
        padding: 0 6px;
        color: #3F72AF;
        background-color: #F3F5F7;
    }

    /* =====================================================
       BUTTON
       ===================================================== */

    QPushButton {
        background-color: #FFFFFF;
        color: #263238;
        border: 1px solid #C9D0D6;
        border-radius: 6px;
        padding: 7px 14px;
        font-weight: 500;
    }

    QPushButton:hover {
        background-color: #EEF4FA;
        border-color: #8EABC7;
    }

    QPushButton:pressed {
        background-color: #E1EBF5;
    }

    /* =====================================================
       COMBO BOX
       ===================================================== */

    QComboBox {
        background-color: #FFFFFF;
        color: #263238;
        border: 1px solid #C9D0D6;
        border-radius: 6px;
        padding: 5px 8px;
    }

    QComboBox:hover {
        border-color: #8EABC7;
    }

    QComboBox QAbstractItemView {
        background-color: #FFFFFF;
        color: #263238;
        selection-background-color: #DCEAF7;
        selection-color: #263238;
    }

    /* =====================================================
       TEXT BOX
       ===================================================== */

    QPlainTextEdit,
    QTextEdit {
        background-color: #FAFBFC;
        color: #263238;
        border: 1px solid #D9DEE3;
        border-radius: 6px;
        selection-background-color: #D6E5F2;
        selection-color: #263238;
    }

    /* =====================================================
       SPLITTER
       ===================================================== */

    QSplitter::handle {
        background-color: #D9DEE3;
    }

    QSplitter::handle:hover {
        background-color: #B8C4CE;
    }
    """)
    kan_lut, config, device = load_model()
    window = MainWindow(kan_lut, config)
    window.show()
    sys.exit(app.exec())

if __name__ == "__main__":
    main()