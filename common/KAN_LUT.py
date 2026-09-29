import torch
import torch.nn.functional as F
import os, json, shutil
import numpy as np
from math import ceil, log2, log
from KAN_Quant import KANQuant

# from os_path import extract_input_layer_params

class KAN_LUT():
  def __init__(self, model_dir, checkpoint, config, input_layer, device):

    self.model_dir    = model_dir
    self.firmware_dir = os.path.join(self.model_dir, "firmware")
    self.checkpoint   = checkpoint
    self.config       = config
    self.input_layer  = input_layer
    self.device       = device
    self.is_cuda      = device == "cuda"

    self.KAN = KANQuant(config = self.config, input_layer = self.input_layer, device = self.device)
    self.KAN.load_state_dict(self.checkpoint['model_state_dict'])

    if ('val_accuracy' in self.checkpoint and 'remaining_fraction' in self.checkpoint):
      print(f"Quantization: {self.config['layers_width']}, Remaining edge: {self.checkpoint['remaining_fraction']:.4f}, Accuracy: {self.checkpoint['val_accuracy']:4f}")
    else:
      print(f"Quantization: {self.config['layers_width']}")

    self.KAN.eval()

    truth_table_path = os.path.join(self.model_dir, "truth_table.json")

    if os.path.exists(truth_table_path):
      with open(truth_table_path, "r") as f: self.truth_table = json.load(f)
    else:
      with torch.inference_mode():
        self.truth_table = self.generate_truth_table()
        with open(truth_table_path, "w") as f: json.dump(self.truth_table, f)
    
####################################################################################################

  def generate_truth_table(self):
    truth_table = {}

    for layer_index, layer in enumerate(self.KAN.layers):
      in_features  = layer.in_features
      out_features = layer.out_features

      if (layer_index == 0): layer_in_state_space = self.input_layer.get_state_space(self.is_cuda)
      else                 : layer_in_state_space = self.KAN.layers[layer_index - 1].output_quantizer.get_state_space(self.is_cuda)

      for out_index in range(out_features):
        for in_index in range(in_features):
          truth_table[f"{layer_index}_{out_index}_{in_index}"] = self.get_truth_table(layer_in_state_space, layer_index, out_index, in_index)

    return truth_table

  def get_truth_table(self, input_state_space, layer_index, out_index, in_index):

    layer = self.KAN.layers[layer_index].to(self.device)
    input_state_space = input_state_space.to(self.device)

    truth_table = {}
    truth_table['active'] = int(layer.spline_selector[out_index, in_index].item()) # có bị prune = 0 hay không = 1

    if (int(layer.spline_selector[out_index, in_index]) == 1):
      scale, _ = layer.output_quantizer.get_scale_factor_bits()
      # x = input_state_space.unsqueeze(0).repeat(self.in_features, 1).T.to(self.device) # (samples = 2^bits, in_features)
      base_out   = layer.base_activation_function(input_state_space).to(self.device) * layer.w_base[out_index, in_index]       # (sample)
      spline_out = F.linear(layer.b_spline_line(input_state_space, self.device), layer.scale_w_spline[out_index, in_index, :]) # (sample)
      # spline_out = F.linear(layer.b_spline(x)[: , in_index, :], layer.scale_w_spline[out_index, in_index, :]) # (sample)
      
      layer_bin_state_space = layer.output_quantizer.get_bin_state_space(self.is_cuda).to(self.device)
      min_state = int(layer_bin_state_space.min())
      max_state = int(layer_bin_state_space.max())

      out_lut = ((base_out + spline_out)/scale).round().to(torch.int).tolist()
      out_lut = np.clip(out_lut, min_state, max_state).tolist()
    else:
      out_lut = []

    truth_table['values_int'] = out_lut

    return truth_table

####################################################################################################

  @torch.inference_mode()
  def quick_match_check(self, n: int = 10, atol: float = 5): 
    # Compare self.predict vs self.KAN on a n samples; returns max |error|.

    self.KAN.to(self.device).eval()

    x = torch.rand(n, self.config['layers'][0], device = self.device, dtype = torch.float32)
    y_float = self.KAN(x)
    y_lut   = self.KAN_LUT_predict(x)

    max_error = (y_float - y_lut).abs().max().item()
    if(max_error <= atol): text = "OK"
    else                 : text = "MISMATCH"

    # print(f"Float_out = {y_float}")
    # print(f"LUT_out = {y_lut}")
    print(f"Max error: {max_error:.3e} => {text}")

    max_index_float = torch.argmax(y_float, dim=1)
    max_index_lut   = torch.argmax(y_lut  , dim=1)

    if torch.equal(max_index_float, max_index_lut):
      print("[Classification Correct]")
    else:
      print("[Classification Incorrect]")
    return max_error


  @torch.inference_mode()
  def KAN_LUT_predict(self, x: torch.Tensor):
    assert x.dim() == 2 and x.size(1) == self.config['layers'][0]

    input_scale, in_bits = self.KAN.input_layer.get_scale_factor_bits()
    x = (self.KAN.input_layer(x) / input_scale).round().to(torch.int)

    x = (x + 2**(in_bits - 1)).to(torch.int)

    out_int = []
    for sample_index in range(x.shape[0]):
      out_int.append(self.KAN_LUT_inference(x[sample_index]))
    out_int = torch.stack(out_int, dim = 0)

    output_scale, _ = self.KAN.layers[-1].output_quantizer.get_scale_factor_bits()

    #print(f"Input scale: {input_scale:.4f} - Output scale: {output_scale:.4f}")
    return out_int.to(torch.float32) * output_scale


  def KAN_LUT_inference(self, sample):
    accumulator = None

    for layer_index, layer in enumerate(self.KAN.layers):
      in_features  = layer.in_features
      out_features = layer.out_features
      in_bitwidth  = layer.in_precision

      layer_bin_state_space = layer.output_quantizer.get_bin_state_space(self.is_cuda).to(self.device)

      min_state = int(layer_bin_state_space.min())
      max_state = int(layer_bin_state_space.max())

      acc = torch.zeros(out_features, dtype = torch.int64, device = self.device)

      for out_index in range(out_features):
        acc_out_node = 0

        for in_index in range(in_features):
          truth_table = self.truth_table[f"{layer_index}_{out_index}_{in_index}"]

          if(truth_table['active'] == 0): continue # prune
          if(layer_index == 0): lookup_index = sample[in_index]
          else                : lookup_index = int(accumulator[in_index]) + 2**(in_bitwidth - 1)

          acc_out_node += truth_table['values_int'][lookup_index]

        if(acc_out_node > max_state): acc_out_node = max_state
        if(acc_out_node < min_state): acc_out_node = min_state
        acc[out_index] = acc_out_node

      accumulator = acc

    return accumulator

####################################################################################################

  def generate_firmware(self, bram = True, adder_tree=True, n_adder=2, levels_per_stage=1):

    print("Converting KAN model to hardware")

    if os.path.exists(self.firmware_dir):
      confirm = input(f"The firmware directory {self.firmware_dir} already exists. Do you want to remove it? (y/n): ")
      if (confirm == "y"): shutil.rmtree(self.firmware_dir)
      else               : return

    os.makedirs(os.path.join(self.firmware_dir, "src"), exist_ok=True)
    #os.makedirs(os.path.join(self.firmware_dir, "mem"), exist_ok=True)

    core_delay   = self.write_kan_core(bram=bram, adder_tree=adder_tree, n_add=n_adder)
    argmax_delay = self.build_argmax_sv(levels_per_stage=levels_per_stage)
    total_delay  = core_delay + argmax_delay
    print(f"KAN Core IP lantecy: {total_delay + 1} cycles")

    #self.write_mem_file()
    self.write_pkg_file()

    with open(os.path.join(self.firmware_dir, "src", "kan_top.sv"), "r") as tf: TOP_SV = tf.read()
    TOP_SV = TOP_SV.replace("{{TOTAL_DELAY}}", str(int(total_delay)))
    with open(os.path.join(self.firmware_dir, "src", "kan_top.sv"), "w") as f: f.write(TOP_SV)

    with open(os.path.join(self.firmware_dir, "tb", "tb_kan.sv"), "r") as tf: TB_SV = tf.read()
    TB_SV = TB_SV.replace("{{DELAY_OUTPUT}}", str(int(total_delay + 1)))
    with open(os.path.join(self.firmware_dir, "tb", "tb_kan.sv"), "w") as f: f.write(TB_SV)

####################################################################################################

  def write_mem_file(self):
    def int_2_bin(value: int, bits: int = 32):
        # Giới hạn giá trị trong khoảng signed
        low = -(1 << (bits - 1))
        high = (1 << (bits - 1)) - 1
        value = min(max(value, low), high)

        # Chuyển sang two's complement
        mask = (1 << bits) - 1
        return f"{value & mask:0{bits}b}"
        #return f"{value & mask:0{(bits + 3)//4}X}"

    LUT = 0

    for layer_index, layer in enumerate(self.KAN.layers):
        in_features = layer.in_features
        out_features = layer.out_features

        for out_index in range(out_features):
            for in_index in range(in_features):
                truth_table = self.truth_table[f"{layer_index}_{out_index}_{in_index}"]
                if truth_table["active"] == 0: continue # Bỏ qua LUT không active
                mem_path = os.path.join(self.firmware_dir, "mem", f"lut_{layer_index}_{out_index}_{in_index}.mem")
                values = truth_table["values_int"]
                N = len(values)

                # Kiểm tra kích thước LUT có là 2^n
                if N & (N - 1): raise ValueError(f"LUT size is not power of 2: {N}")

                # Swap hai nửa LUT
                half = N // 2
                values_swapped = values[half:] + values[:half]

                # Ghi file dạng nhị phân
                with open(mem_path, "w") as f:
                    bin_values = [int_2_bin(v, bits=layer.out_precision) for v in values_swapped]
                    f.write("\n".join(bin_values))
                LUT += 1

    print(f"Created {LUT} LUT(BIN).mem files to {os.path.join(self.firmware_dir, 'mem')}")

  def write_pkg_file(self):
    def int_2_hex(value: int, bits: int = 32):
        # Giới hạn giá trị signed
        low   = -(1 << (bits - 1))
        high  =  (1 << (bits - 1)) - 1
        value = min(max(value, low), high)

        # Two's complement
        mask    = (1 << bits) - 1
        hex_bits = (bits + 3) // 4
        return f"{value & mask:0{hex_bits}X}"

    pkg_count = 0
    pkg_dir   = os.path.join(self.firmware_dir,"src")

    os.makedirs(pkg_dir, exist_ok=True)

    values_per_line = 10 # Ghi 10 giá trị / dòng

    for layer_index, layer in enumerate(self.KAN.layers):
        pkg_path = os.path.join(pkg_dir,f"layer_{layer_index}_lut_pkg.sv")
        lut_count = 0 
        with open(pkg_path, "w") as f:
            f.write(f"//--------------------------------------------------\n"
                    f"// Auto generated LUT package\n"
                    f"// Layer {layer_index}\n"
                    f"//--------------------------------------------------\n\n"
                    f"package layer_{layer_index}_lut_pkg;\n")
            #f.write(f"    parameter int OUT_PRECISION = {layer.out_precision};\n\n")
            
            for out_index in range(layer.out_features):
                for in_index in range(layer.in_features):
                    key = f"{layer_index}_{out_index}_{in_index}"
                    truth_table = self.truth_table[key]
  
                    if truth_table["active"] == 0: continue # Bỏ qua LUT không active

                    lut_count += 1
                    values = truth_table["values_int"]
                    N      = len(values)

                    if N & (N - 1): raise ValueError(f"LUT size is not power of 2: {N}") # LUT size phải là 2^n

                    # Swap hai nửa LUT
                    half = N // 2
                    values = values[half:] + values[:half]
                    lut_name = (f"LUT_{layer_index}_{out_index}_{in_index}")
                    f.write(f"    localparam logic [{layer.out_precision-1}:0] {lut_name} [0:{N-1}] = '{{\n")

                    for idx in range(0, N, values_per_line):
                        line_values = values[idx:idx + values_per_line]
                        f.write("        ")
                        for j, value in enumerate(line_values):
                            hex_value = int_2_hex(value,bits=layer.out_precision)
                            comma = ","

                            # phần tử cuối cùng của LUT
                            if idx + j == N - 1: comma = ""
                            f.write(f"{layer.out_precision}'h{hex_value}{comma} ")
                        f.write("\n")
                    f.write("    };\n\n")
            f.write("endpackage")
        pkg_count += 1
        print(f"Layer {layer_index}, created {lut_count:5d} lookup tables in layer_{layer_index}_lut_pkg.sv")

    imports = "\n".join(f"import layer_{layer_idx}_lut_pkg::*;" for layer_idx in range(len(self.KAN.layers)))
    with open(os.path.join(self.firmware_dir, "src", "kan_core.sv"), "r") as tf: KAN_SV = tf.read()
    KAN_SV = KAN_SV.replace("{{PKG}}" , imports)
    with open(os.path.join(self.firmware_dir, "src", "kan_core.sv"), "w") as f: f.write(KAN_SV)

    pkg_decls = "\n".join(f"../src/layer_{layer_idx}_lut_pkg.sv" for layer_idx in range(len(self.KAN.layers)))
    with open(os.path.join(self.firmware_dir, "sim", "flist.f"), "r") as tf: LIST = tf.read()
    LIST = LIST.replace("{{PKG}}" , pkg_decls          )
    with open(os.path.join(self.firmware_dir, "sim", "flist.f"), "w") as f: f.write(LIST)

    print(f"Created {pkg_count} SystemVerilog LUT packages in {pkg_dir}")

####################################################################################################
  # Các biến khai báo, thanh ghi, lut/bram

  def write_kan_core(self, max_per_line = 16, bram = True, adder_tree=True, n_add=2):

    if(adder_tree and n_add < 2): raise ValueError("For adder_tree=True, n_add >= 2.")

    def emit(max_per_line, name, type = "logic", DATA_WIDTH = 1, ADDR_WIDTH = 1): # khai báo nhiều tín hiệu
      lines = []
      buf   = []

      a = f" [{ADDR_WIDTH - 1}:0]" if (ADDR_WIDTH > 1) else ""
      d = f" [{DATA_WIDTH - 1}:0]" if (DATA_WIDTH > 1) else ""
      
      for n in name:
        buf.append(n)
        if (len(buf) == max_per_line): 
          lines.append(f"    {type} {d} {', '.join(buf)}{a};")
          buf.clear()

      if buf: lines.append(f"    {type} {d} {', '.join(buf)}{a};")
      return "\n".join(lines)
    
    def logic_decls(name, type = "logic", DATA_WIDTH = 1, ADDR_WIDTH = 1): # khai báo một tín hiệu

      a = f" [{ADDR_WIDTH - 1}:0]" if (ADDR_WIDTH > 1) else ""
      d = f" [{DATA_WIDTH - 1}:0]" if (DATA_WIDTH > 1) else ""
      return (f"    {type}{d} {name}{a};")
    
    def emit_lut_ram(layer_index, out_index, in_index, data_width = 1, addr_width = 1, bram = True):
      # hex_link = f"../mem/lut_{layer_index}_{out_index}_{in_index}.mem"
      hex_link = f"LUT_{layer_index}_{out_index}_{in_index}"
      name    = f"rom_{layer_index}_{out_index}_{in_index}"
      
      if (layer_index == 0): addr = f"i_vector[{in_index}]"
      else                 : addr = f"out_{layer_index - 1}_{in_index}_reg"
      
      out_data = f"acts_{layer_index}_{out_index}_{in_index}"

      if (bram):
        return (
          f'  single_port_ram #(.DATA_WIDTH({data_width}), .ADDR_WIDTH({addr_width}), '
          f'.INIT({hex_link})) \n'
          f'    {name} (.i_clk(i_clk), .i_wren(1\'b0), .i_addr({addr}), '
          f'.i_st_data({data_width}\'b0), .o_ld_data({out_data}));\n'
        )
      
      else:
        return (
          f'  lut_rom #(.DATA_WIDTH({data_width}), .ADDR_WIDTH({addr_width}), '
          f'.INIT({hex_link})) \n'
          f'    {name} (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), '
          f'.i_addr({addr}), .o_ld_data({out_data}));\n'
        )
    
    def register(name, width, d, q):
      return (f'  registers #(.ARRAY_WIDTH({width})) {name} (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({d}), .q({q}));\n')
    
    def saturate(name, i_width, o_width, i_signal, o_signal):
      return (f'  saturate_clip #(.IN_WIDTH({i_width}), .OUT_WIDTH({o_width})) {name} (.i_data({i_signal}), .o_data({o_signal}));\n')

    ####################################################################################################
    num_layers = len(self.KAN.layers)

    sections = []

    for layer_index, layer in enumerate(self.KAN.layers):
      in_features  = layer.in_features
      out_features = layer.out_features
      addr_width   = layer.in_precision
      data_width   = layer.out_precision

      acts     = []
      #outs     = []
      outs_sat = []
      outs_reg = []

      for out_index in range(out_features):

        has_active_input = False

        for in_index in range(in_features):
          truth_table = self.truth_table[f"{layer_index}_{out_index}_{in_index}"]
          if (truth_table['active'] == 1): 
            acts.append(f"acts_{layer_index}_{out_index}_{in_index}")
            has_active_input = True

        if layer_index != num_layers - 1: # Not output layer
          #outs.append(f"out_{layer_index}_{out_index}")
          if has_active_input:
            outs_sat.append(f"out_{layer_index}_{out_index}_sat")
            outs_reg.append(f"out_{layer_index}_{out_index}_reg")
      
      signal_decls = [f"// Layer {layer_index}: {in_features} -> {out_features}"]

      if acts    : signal_decls.append(emit(max_per_line, acts    , "logic", data_width, 1))
      if outs_sat: signal_decls.append(emit(max_per_line, outs_sat, "logic", data_width, 1))
      if outs_reg: signal_decls.append(emit(max_per_line, outs_reg, "logic", data_width, 1))

      if not adder_tree: 
        for out_index in range(out_features):
          sum_term = [f"sum_{layer_index}_{out_index}"]
          signal_decls.append(emit(max_per_line, sum_term, "logic", data_width, 1))
      sections.append("\n".join(signal_decls))
    
    layer_block    = []
    # sum_terms_scan = []

    total_delay = 0
    bit_extend_per_layer = ceil(log(n_add, 2))

    for layer_index, layer in enumerate(self.KAN.layers):
      in_features, out_features  = layer.in_features, layer.out_features
      addr_width   = layer.in_precision
      data_width   = layer.out_precision

      max_inputs_layer    = 0
      all_sum_terms_layer = []

      # Find the max input and determind fixed layer depth
      for out_index in range(out_features):
        sum_terms_scan = []

        for in_index in range(in_features):
          truth_table = self.truth_table[f"{layer_index}_{out_index}_{in_index}"]
          if (truth_table['active'] == 1): sum_terms_scan.append(
            f"{{{{{bit_extend_per_layer}{{acts_{layer_index}_{out_index}_{in_index}[{data_width - 1}]}}}}, acts_{layer_index}_{out_index}_{in_index}}}")

        all_sum_terms_layer.append(sum_terms_scan)
        max_inputs_layer = max(max_inputs_layer, len(sum_terms_scan))

      if (max_inputs_layer > 1): layer_depth = ceil(log(max_inputs_layer, n_add))
      else                     : layer_depth = 1

      if layer_index != num_layers - 1: total_delay += layer_depth + 2
      else                            : total_delay += layer_depth + 1

      for out_index in range(out_features):
        block = [f'    // Layer {layer_index}, Node {out_index}']

        lut = []
        for in_index in range(in_features):
          truth_table = self.truth_table[f"{layer_index}_{out_index}_{in_index}"]
          if (truth_table['active'] == 0): continue 
          lut.append(emit_lut_ram(layer_index, out_index, in_index, data_width, addr_width, bram = bram))

        sum_terms = all_sum_terms_layer[out_index]

        adder_tree_signals = []
        adder_tree_logic   = []

        if (sum_terms and adder_tree): 
          current_stage_terms = all_sum_terms_layer[out_index]
          
          adder_tree_signals.append(logic_decls(f"sum_{layer_index}_{out_index}" , "logic",
                                               data_width + layer_depth * bit_extend_per_layer, 1))
          adder_tree_signals.append(logic_decls(f"sum_{layer_index}_{out_index}_reg" , "logic",
                                               data_width + layer_depth * bit_extend_per_layer, 1))

          for stage in range(1, layer_depth + 1):
            is_last_stage = (stage == layer_depth)
            adder_tree_logic.append(f"// Stage {stage}")

            if len(current_stage_terms) == 1:
              source = current_stage_terms[0]
              target = f"sum_{layer_index}_{out_index}_reg" if is_last_stage else f"s_{layer_index}_{out_index}_{stage}_pipe"
              if is_last_stage:
                target_extend = f"sum_{layer_index}_{out_index}_reg"
              else:
                msb = data_width + bit_extend_per_layer * stage - 1
                target_extend = f"{{{{{bit_extend_per_layer}{{s_{layer_index}_{out_index}_{stage}_pipe[{msb}]}}}},s_{layer_index}_{out_index}_{stage}_pipe}}"
            
              if not is_last_stage:
                adder_tree_signals.append(logic_decls(target, "logic", data_width + bit_extend_per_layer * stage, 1))

                #adder_tree_logic.append(f"  assign {target} = {source};")
                adder_tree_logic.append(register(f"reg_{layer_index}_{out_index}_{stage}", 
                                               data_width + bit_extend_per_layer * stage, source, target))
                
              else:
                adder_tree_logic.append(register(f"reg_{layer_index}_{out_index}_{stage}", 
                                               data_width + bit_extend_per_layer * stage, source, target))
              current_stage_terms = [target_extend]
              continue
            
            # Cal numbers of intermediate signals
            num_results_this_stage = ceil(len(current_stage_terms)/n_add)
            next_stage_terms = []

            # Declare intermediate signals for this stage
            stage_intermediate_signals = []
            stage_intermediate_reg     = []
            if not (is_last_stage and num_results_this_stage == 1):
              for sig in range(num_results_this_stage): 
                stage_intermediate_signals.append(f"s_{layer_index}_{out_index}_{stage}_{sig}")
                stage_intermediate_reg.append(f"s_{layer_index}_{out_index}_{stage}_{sig}_reg")

              adder_tree_signals.append(emit(max_per_line, stage_intermediate_signals, "logic",
                                             data_width + bit_extend_per_layer * stage, 1))
              adder_tree_signals.append(emit(max_per_line, stage_intermediate_reg, "logic",
                                             data_width + bit_extend_per_layer * stage, 1))
              
            for sig in range(num_results_this_stage): 
              if (is_last_stage and num_results_this_stage == 1):
                target = f"sum_{layer_index}_{out_index}"
                delay  = f"sum_{layer_index}_{out_index}_reg"
                delay_extend = f"sum_{layer_index}_{out_index}_reg"
              else: 
                target = f"s_{layer_index}_{out_index}_{stage}_{sig}"
                delay  = f"s_{layer_index}_{out_index}_{stage}_{sig}_reg"
                msb = data_width + bit_extend_per_layer * stage - 1
                delay_extend = f"{{{{{bit_extend_per_layer}{{s_{layer_index}_{out_index}_{stage}_{sig}_reg[{msb}]}}}}, s_{layer_index}_{out_index}_{stage}_{sig}_reg}}"

              start_index = sig * n_add
              end_index   = start_index + n_add
              
              sum_signal_this_stage = current_stage_terms[start_index:end_index]

              if len(sum_signal_this_stage) > 1:
                add_sum = " + ".join(sum_signal_this_stage) 
                adder_tree_logic.append(f"  assign {target} = {add_sum};")
              else:
                adder_tree_logic.append(f"  assign {target} = {sum_signal_this_stage[0]};")

              if (is_last_stage and num_results_this_stage == 1): 
                reg_name = f"r_{layer_index}_{out_index}"
              else:
                reg_name = f"r_{layer_index}_{out_index}_{stage}_{sig}"
              
              adder_tree_logic.append(register(reg_name, data_width + bit_extend_per_layer * stage, target, delay))
              
              next_stage_terms.append(delay_extend) 
            
            current_stage_terms = next_stage_terms

        block.append("\n".join(sorted(list(set(adder_tree_signals))))) # sắp xếp lại thứ tự các logic khai báo
        block.append("")  # dòng trống
        block.extend(lut)
        
        if sum_terms:
          if adder_tree:
            block.extend([f"{line}" for line in adder_tree_logic])
          else:
            add_sum = " + ".join(sum_terms) 
            block.append(f"assign sum_{layer_index}_{out_index} = {add_sum};")
            block.append(register(f"{layer_index}_{out_index}", data_width + bit_extend_per_layer * layer_depth, 
                                  f"sum_{layer_index}_{out_index}", f"sum_{layer_index}_{out_index}_reg"))

          target = f"sum_{layer_index}_{out_index}_reg"

          if layer_index == num_layers - 1:
            block.append(saturate(f"sat_{layer_index}_{out_index}",
                                  data_width + bit_extend_per_layer * layer_depth, data_width,
                                  target, f"o_vector[{out_index}]"))
          else:
            block.append(saturate(f"sat_{layer_index}_{out_index}",
                                  data_width + bit_extend_per_layer * layer_depth, data_width,
                                  target, f"out_{layer_index}_{out_index}_sat"))
        else:
          if layer_index == num_layers - 1:
            block.append(f"  assign o_vector[{out_index}] = '0;")
          #else:
          #  continue
          #  block.append(f"  assign out_{layer_index}_{out_index}_sat = '0;")

        layer_block.append("\n  ".join(block))

      if layer_index != num_layers - 1:
        register_block = []

        for out_index in range(out_features):
          has_active_input = False

          for in_index in range(in_features):
            truth_table = self.truth_table[f"{layer_index}_{out_index}_{in_index}"]
            if (truth_table['active'] == 1): has_active_input = True

          if has_active_input:
            register_block.append(register(f"node_{layer_index}_{out_index}", data_width,
                                           f"out_{layer_index}_{out_index}_sat", 
                                           f"out_{layer_index}_{out_index}_reg"))
        layer_block.append("\n  ".join(register_block))

    SIG_DECLS   = "\n\n".join(sections) if sections else "// No signals"
    LAYER_BLOCK = "\n\n".join(layer_block) if layer_block else "// No layers"

    in_features        = str(self.config['layers'][ 0])
    in_bitwidth        = str(self.config['layers_width'][ 0])
    final_out_features = str(self.config['layers'][-1])
    final_bitwidth     = str(self.config['layers_width'][-1])

    shutil.copytree(os.path.join(os.path.dirname(__file__), "templates", "src"), 
                    os.path.join(self.firmware_dir, "src"),
                    dirs_exist_ok=True)

  # Create Core package
    pkg_sv = (f"package kan_core_pkg;\n\n" 
              f"  parameter int IN_FEATURES  = {in_features};\n"
              f"  parameter int IN_WIDTH     = {in_bitwidth};\n"
              f"  parameter int OUT_FEATURES = {final_out_features};\n"
              f"  parameter int OUT_WIDTH    = {final_bitwidth};\n\n"
              f"endpackage")
    with open(os.path.join(self.firmware_dir, "src", "kan_core_pkg.sv"), "w") as f:
        f.write(pkg_sv)

    # Create KAN tree
    with open(os.path.join(self.firmware_dir, "src", "kan_core.sv"), "r") as tf: KAN_SV = tf.read()
    KAN_SV = KAN_SV.replace("{{SIGNAL_DECLS}}", SIG_DECLS            )
    KAN_SV = KAN_SV.replace("{{LAYER_BLOCKS}}", LAYER_BLOCK          )
    with open(os.path.join(self.firmware_dir, "src", "kan_core.sv"), "w") as f: f.write(KAN_SV)

    print(f"=> Generate SystemVerilog hardware for KAN core (Pipeline = {total_delay + 1})")

    shutil.copytree(os.path.join(os.path.dirname(__file__), "templates", "tb"), 
                    os.path.join(self.firmware_dir, "tb"),
                    dirs_exist_ok=True)
    
    shutil.copytree(os.path.join(os.path.dirname(__file__), "templates", "sim"), 
                    os.path.join(self.firmware_dir, "sim"),
                    dirs_exist_ok=True)

    return total_delay

####################################################################################################
  def build_argmax_sv(self, levels_per_stage=1):
    out_features = self.KAN.layers[-1].out_features
    data_width   = self.KAN.layers[-1].out_precision
    index_width  = max(1, int(ceil(log2(out_features))))
    tree_depth   = int(ceil(log2(out_features)))

    # 1. BUILD FULL REDUCTION TREE (SYMBOLIC)
    levels_vals = []
    levels_idx  = []

    # level 0
    levels_vals.append([f"i_data[{i}]" for i in range(out_features)])
    levels_idx.append([f"{index_width}'d{i}" for i in range(out_features)])

    for lvl in range(tree_depth):
        prev_vals = levels_vals[-1]
        prev_idx  = levels_idx[-1]
        next_vals = []
        next_idx  = []

        for i in range(ceil(len(prev_vals)/2)):
            a_val = prev_vals[2*i]
            a_idx = prev_idx[2*i]

            # Odd node: propagate
            if 2*i+1 >= len(prev_vals):
                next_vals.append(a_val)
                next_idx.append(a_idx)
                continue

            b_val = prev_vals[2*i+1]
            b_idx = prev_idx[2*i+1]

            val   = f"tree_l{lvl}_{i}_val"
            idx   = f"tree_l{lvl}_{i}_idx"
            next_vals.append(val)
            next_idx.append(idx)

        levels_vals.append(next_vals)
        levels_idx.append(next_idx)

    # 2. PIPELINE GENERATION
    stage_count = ceil(tree_depth / levels_per_stage)
    signal_decls   = []
    compare_blocks = []
    level_reg_vals = {}
    level_reg_idx  = {}

    # input level
    level_reg_vals[0] = levels_vals[0]
    level_reg_idx[0]  = levels_idx[0]

    # 3. GENERATE PIPELINE STAGES
    for stage in range(stage_count):
        start_lvl = stage * levels_per_stage
        end_lvl   = min((stage + 1) * levels_per_stage, tree_depth)

        signal_decls.append(f"\n  // PIPELINE STAGE {stage}")
        signal_decls.append(f"  // levels {start_lvl} -> {end_lvl}")

        # Process levels inside stage
        for lvl in range(start_lvl, end_lvl):
            prev_vals = level_reg_vals[lvl]
            prev_idx  = level_reg_idx[lvl]
            next_vals = []
            next_idx  = []

            for i in range(ceil(len(prev_vals)/2)):
                a_val = prev_vals[2*i]
                a_idx = prev_idx[2*i]

                # ODD NODE
                if 2*i+1 >= len(prev_vals):
                    val = (f"pass_s{stage}_l{lvl}_{i}_val")
                    idx = (f"pass_s{stage}_l{lvl}_{i}_idx")
                    signal_decls += [
                        f"  logic [{data_width-1}:0] {val};",
                        f"  logic [{index_width-1}:0] {idx};"
                    ]

                    compare_blocks.append(
                      f"  // Stage {stage}, Level {lvl}, Pass node {i}\n"
                      f"  assign {val} = {a_val};\n"
                      f"  assign {idx} = {a_idx};\n"
                    )

                    next_vals.append(val)
                    next_idx.append(idx)
                    continue

                # NORMAL COMPARATOR NODE
                b_val = prev_vals[2*i+1]
                b_idx = prev_idx[2*i+1]

                sel = (f"cmp_s{stage}_l{lvl}_{i}_sel")
                val = (f"cmp_s{stage}_l{lvl}_{i}_val")
                idx = (f"cmp_s{stage}_l{lvl}_{i}_idx")
                signal_decls += [
                    f"  logic {sel};",
                    f"  logic [{data_width-1}:0] {val};",
                    f"  logic [{index_width-1}:0] {idx};"
                ]

                compare_blocks.append(
                  f"  // Stage {stage}, Level {lvl}, Comparator {i}\n"
                  f"  gte_comp_sign #(.BEHAVIOR(1), .WIDTH({data_width})) comp_{stage}_{lvl}_{i} (.i_a({a_val}), .i_b({b_val}), .o_gte({sel}));\n"
                  f"  assign {val} = {sel} ? {a_val} : {b_val};\n"
                  f"  assign {idx} = {sel} ? {a_idx} : {b_idx};"
                )
                
                next_vals.append(val)
                next_idx.append(idx)

            level_reg_vals[lvl+1] = next_vals
            level_reg_idx[lvl+1]  = next_idx

        # PIPELINE REGISTER AT END OF STAGE

        reg_vals = []
        reg_idx  = []
        for i, v in enumerate(level_reg_vals[end_lvl]):
            rv = f"r_s{stage}_v{i}"
            ri = f"r_s{stage}_i{i}"
            reg_vals.append(rv)
            reg_idx.append(ri)

            signal_decls += [
              f"  logic signed [{data_width-1}:0] {rv};",
              f"  logic [{index_width-1}:0] {ri};"
            ]

            compare_blocks.append(
              f"  registers #(.ARRAY_WIDTH({data_width})) {rv}_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({v}), .q({rv}));\n\n"
              f"  registers #(.ARRAY_WIDTH({index_width})) {ri}_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({level_reg_idx[end_lvl][i]}), .q({ri}));"
            )
            
        # overwrite level with registered outputs
        level_reg_vals[end_lvl] = reg_vals
        level_reg_idx[end_lvl]  = reg_idx

    # 4. OUTPUT
    final_val = level_reg_vals[tree_depth][0]
    final_idx = level_reg_idx[tree_depth][0]

    compare_blocks.append(
      f"  // FINAL OUTPUT\n"
      f"  assign o_max_value = {final_val};\n"
      f"  assign o_max_index = {final_idx};\n"
    )

    # 5. MODULE
    sv = (f"module kan_argmax (\n"
          f"  input logic i_clk,\n"
          f"  input logic i_rst_n,\n"
          f"  input logic i_en,\n"
          f"  input logic signed [{out_features-1}:0][{data_width-1}:0] i_data,\n"
          f"  output logic [{index_width-1}:0] o_max_index,\n"
          f"  output logic signed [{data_width-1}:0] o_max_value\n"
          f");\n\n"
          f"{chr(10).join(signal_decls)}\n"
          f"{chr(10).join(compare_blocks)}\n\n"
          f"endmodule\n")

    path = os.path.join(self.firmware_dir, "src", "kan_argmax.sv")
    with open(path, "w") as f: f.write(sv)

    print(f"=> Generated flexible argmax (N={out_features}, pipeline={stage_count})")

    return stage_count
    
####################################################################################################
  @torch.inference_mode()
  def random_test_vector(self, n_vectors=10, hex_gen = False):

    sim_dir = os.path.join(self.model_dir, "firmware", "tb")
    os.makedirs(sim_dir, exist_ok=True)

    in_features = self.KAN.layers[0].in_features 
    x = torch.randn(n_vectors, in_features, device=self.device, dtype=torch.float32)

    self.write_test_vector(x, sim_dir, sim_dir, hex_gen)

    with open(os.path.join(self.firmware_dir, "tb", "tb_kan.sv"), "r") as tf: TB_SV = tf.read()
    TB_SV = TB_SV.replace("{{TEXT}}", str(int(n_vectors)))
    with open(os.path.join(self.firmware_dir, "tb", "tb_kan.sv"), "w") as f: f.write(TB_SV)

    print(f"Generate {n_vectors} random testcase")

  def write_test_vector(self, x: torch.Tensor, in_dir: str, out_dir: str, hex_gen: bool = False):

    input_scale, in_bits = self.KAN.input_layer.get_scale_factor_bits()

    # in_features = self.KAN.layers[0].in_features  
    # x = torch.randn(n_vectors, in_features, device=self.device, dtype=torch.float32)

    x = (self.KAN.input_layer(x) / input_scale).round().to(torch.int)

    x_q = (x + 2**(in_bits - 1)).to(torch.int)

    out_int = []
    for sample_index in range(x.shape[0]):
      out_int.append(self.KAN_LUT_inference(x_q[sample_index]))
    out_int = torch.stack(out_int, dim = 0)

    pred_idx = torch.argmax(out_int, dim=1)

    # int type
    with open(os.path.join(in_dir, "vectors_in.txt"), "w") as in_file:
      for row in x.tolist(): 
        in_file.write(" ".join(str(v) for v in row) + "\n")

    with open(os.path.join(out_dir, "vectors_out.txt"), "w") as out_file:
      for row in out_int.tolist(): 
        out_file.write(" ".join(str(v) for v in row) + "\n")

    with open(os.path.join(out_dir, "pred_idx.txt"), "w") as idx_file:
        for idx in pred_idx.tolist():
            idx_file.write(str(idx) + "\n")

    # HEX type
    if hex_gen:
      with open(os.path.join(in_dir, "vectors_in_hex.txt"), "w") as in_file:
            for row in x.tolist():
                in_file.write(" ".join(f"{v & 0xFF:02X}" for v in row) + "\n")

      with open(os.path.join(out_dir, "vectors_out_hex.txt"), "w") as out_file:
                for row in out_int.tolist(): 
                  out_file.write(" ".join(f"{v & 0xFF:02X}" for v in row)+ "\n")

      with open(os.path.join(out_dir, "pred_idx_hex.txt"), "w") as idx_file:
        for idx in pred_idx.tolist():
            idx_file.write(f"{idx:02X}\n")

    return pred_idx

  @torch.inference_mode()
  def test_from_dataset(self, x : torch.Tensor, y : torch.Tensor, hex_gen: bool = False):
    sim_dir = os.path.join(self.model_dir, "firmware", "tb")
    os.makedirs(sim_dir, exist_ok=True)

    x = x.to(self.device)
    y = y.to(self.device)

    batch = x.shape[0]

    pred_idx = self.write_test_vector(x, sim_dir, sim_dir, hex_gen)

    # convert label format
    if y.ndim == 2: y_idx = torch.argmax(y, dim=1)
    else          : y_idx = y

    y_idx = y_idx.to(torch.int)

    # accuracy
    # acc = (pred_idx.cpu() == y_idx.cpu()).float().mean()

    # print(f"Test accuracy: {acc.item()*100:.2f}%")

    with open(os.path.join(self.firmware_dir, "tb", "tb_kan.sv"), "r") as tf: TB_SV = tf.read()
    TB_SV = TB_SV.replace("{{TEXT}}", str(int(batch)))
    with open(os.path.join(self.firmware_dir, "tb", "tb_kan.sv"), "w") as f: f.write(TB_SV)

    print(f"Generate {batch} testcase from dataset")
####################################################################################################
