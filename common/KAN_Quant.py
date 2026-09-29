import torch
import math
import torch.nn.functional as F
import torch.nn as nn

from typing import Optional

from brevitas.core.quant import QuantType
from brevitas.core.scaling import ParameterScaling
from brevitas.nn import QuantIdentity
from quant import QuantBrevitasActivation

class KANLinear(nn.Module):
  def __init__(
      self,
      in_feat,
      out_feat,
      in_precision,
      out_precision,
      grid_size=5,
      spline_order=3,
      scale_noise=0.1,
      scale_base=1.0,
      scale_spline=1.0,
      enable_scale_spline=True,
      base_activation= torch.nn.SiLU,
      grid_eps=0.02,
      grid_range=[-1,1],
      device=None
  ):
    super(KANLinear, self).__init__()
    self.in_features   = in_feat
    self.out_features  = out_feat
    self.grid_size     = grid_size
    self.spline_order  = spline_order
    self.in_precision  = in_precision
    self.out_precision = out_precision
    self.grid_range    = grid_range
    self.device        = device

    h = (grid_range[1] - grid_range[0]) / grid_size

    grid = torch.arange(-spline_order, grid_size + spline_order + 1) * h + grid_range[0] # (2 * spline_order + grid_size + 1)
    grid = grid.expand(in_feat, -1).contiguous() # (in_features, 2 * spline_order + grid_size + 1)
    self.register_buffer("grid", grid)

    self.w_base   = torch.nn.Parameter(torch.Tensor(out_feat, in_feat))

    w_spline_num  = grid_size + spline_order
    self.w_spline = torch.nn.Parameter(torch.Tensor(out_feat, in_feat, w_spline_num))

    # Spline selector for pruning
    self.register_buffer("spline_selector", torch.ones(out_feat, in_feat))

    if enable_scale_spline: self.spline_scale = torch.nn.Parameter(torch.Tensor(out_feat, in_feat))

    self.scale_noise  = scale_noise
    self.scale_base   = scale_base
    self.scale_spline = scale_spline
    self.grid_eps     = grid_eps
    self.enable_scale_spline      = enable_scale_spline
    self.base_activation_function = base_activation()

    self.init_parameters()

    Identity = QuantIdentity(bit_width           = self.out_precision,
                             quant_type          = QuantType.INT,
                             return_quant_tensor = False,
                             min_val             = self.grid_range[0],
                             max_val             = self.grid_range[1],
                             act_scaling_impl    = ParameterScaling(1.33),
                             signed              = True)

    self.output_quantizer = QuantBrevitasActivation(Identity, pre_transforms=[], post_transforms=[])

####################################################################################################
  def b_spline(self, x: torch.Tensor):
    assert x.dim() == 2 and x.size(1) == self.in_features # (batch_size, in_features)
    grid: torch.Tensor = self.grid # (in_features, 2*spline_order + grid_size + 1)
    x = x.unsqueeze(-1) # (batch_size, in_features, 1)

    bases = (x >= grid[:, :-1]) & (x < grid[:, 1:]) # (batch_size, in_features, 2*spline_order + grid_size)
    bases = bases.to(x.dtype)

    for p in range (1, self.spline_order + 1):
      down = (x - grid[:,:-(p+1)]) * bases[:,:, :-1] / (grid[:, p :-1] - grid[:, :-(p+1)])
      up   = (grid[:, (p+1):] - x) * bases[:,:,1:  ] / (grid[:,(p+1):] - grid[:,1:-p    ])
      bases = down + up
    # (batch_size, in_features, grid_size + spline_order)
    return bases.contiguous()

  def b_spline_line(self, x: torch.Tensor, device):
    assert x.dim() == 1 # (input_state_space_shape)
    x = x.unsqueeze(-1).to(device) # (input_state_space_shape, 1)
    grid: torch.Tensor = self.grid[0].to(device) # (2*spline_order + grid_size + 1)

    bases = (x >= grid[:-1]) & (x < grid[1:]) # (input_state_space_shape, 2*spline_order + grid_size)
    bases = bases.to(x.dtype)

    for p in range (1, self.spline_order + 1):
      down  = (x - grid[:-(p+1)]) * bases[:,  :-1] / (grid[p:-1]   - grid[ :-(p+1)])
      up    = (grid[(p+1):]  - x) * bases[:, 1:  ] / (grid[(p+1):] - grid[1:-p    ])
      bases = down + up
    return bases.contiguous() # (input_state_space_shape, spline_order + grid_size)

  def curve2coeff(self, x: torch.Tensor, y: torch.Tensor):
    assert x.dim() == 2 and x.size(1) == self.in_features # (batch, in_features)
    assert y.size() == (x.size(0), self.in_features, self.out_features) # (batch, in_features, out_features)

    A = self.b_spline(x).permute(1, 0, 2) # (in_features, batch_size, grid_size + spline_order)
    B = y.permute(1, 0, 2) # (in_features, batch_size, out_features)

    solution = torch.linalg.lstsq(A, B).solution # (in_features, grid_size + spline_order, out_features)
    coeff = solution.permute(2, 0, 1)            # (out_features, in_features, grid_size + spline_order)
    assert coeff.size() == (self.out_features, self.in_features, self.grid_size + self.spline_order)

    return coeff.contiguous()

  def init_parameters(self):
    torch.nn.init.kaiming_uniform_(self.w_base, a = math.sqrt(5) * self.scale_base)
    if(self.enable_scale_spline):
      torch.nn.init.kaiming_uniform_(self.spline_scale, a = math.sqrt(5) * self.scale_spline)

    with torch.no_grad():
      noise = torch.rand(self.grid_size + 1, self.in_features, self.out_features) - 0.5
      noise = noise * self.scale_noise / self.grid_size

      if(self.enable_scale_spline): scale = self.scale_spline
      else: scale = 1
      self.w_spline.data.copy_(scale * self.curve2coeff(self.grid.T[self.spline_order:-self.spline_order], noise))

####################################################################################################
  @property
  def scale_w_spline(self):
    # (out_features, in_features, grid_size + spline_order) * (out_features, infeatures, 1) - boardcast
    return self.w_spline * (self.spline_scale.unsqueeze(-1) if(self.enable_scale_spline) else 1) # (out_features, in_features, grid_size + spline_order)

  # def forward(self, x: torch.tensor): # w_base x SiLU(x) + scale_spline * spline(x)
  #   assert x.size(-1) == self.in_features

  #   in_shape = x.shape # (n, batch_size, in_features)
  #   x = x.reshape(-1, self.in_features) # (n * batch_size, in_features)

  #   # base = sum_j=1_in_features(W_b_i,j,k * SiLU(x_i,j))
  #   # SiLU(x) @ w_base.T : (n * batch_size, in_features) @ (in_features, out_features) = (n * batch_size, out_features)
  #   base_y = F.linear(self.base_activation_function(x),self.w_base) # (n * batch_size, out_features)

  #   # b_spline(x)   : (batch_size  , in_features, grid_size + spline_order) -> (n * batch_size, in_features * (spline_order + grid_size))
  #   # scale_w_spline: (out_features, in_features, grid_size + spline_order) -> (out_features  , in_features * (spline_order + grid_size))
  #   # b_spline(x) @ scale_w_spline.T : (n * batch_size, out_feature)
  #   spline_y = F.linear(self.b_spline(x).view(x.size(0), -1), self.scale_w_spline.view(self.out_features, -1))

  #   y = base_y + spline_y # (n * batch_size, out_feature)
  #   y = y.reshape(*in_shape[:-1] , self.out_features) # (n, batch_size, out_feature)

  #   return y

  def forward(self, x: torch.Tensor):
    assert x.size(-1) == self.in_features

    in_shape = x.shape # (n, batch_size, in_features)
    x = x.reshape(-1, self.in_features) # (n * batch_size, in_features)

    # (n * batch_size, in_features)  -> (n * batch_size, in_features,            1)
    # (in_features   , out_features) -> (1             , in_features, out_features)
    base_out = self.base_activation_function(x).unsqueeze(2) * self.w_base.T.unsqueeze(0) # (n * batch_size, in_features, out_features)

    # (n * batch_size, in_features, grid_size + spline_order) -> (n * batch_size, in_features,            1, grid_size + spline_order)
    # (  out_features, in_features, grid_size + spline_order) -> (             1, in_features, out_features, grid_size + spline_order)
    spline_out = torch.sum(self.b_spline(x).unsqueeze(2) * self.scale_w_spline.transpose(0,1).unsqueeze(0),dim=-1) # (n * batch_size, in_features, out_features)

    y = (base_out + spline_out).transpose(-1,-2) # (n * batch_size, out_features, in_features)

    # (out_features, in_features) -> (1, out_features, in_features)
    # (n * batch_size, out_features, in_features)
    y_prune = self.spline_selector.unsqueeze(0) * y # (n * batch_size, out_features, in_features)

    # Quantize the LUT Output
    y_prune_quant = self.output_quantizer(y_prune)

    # Sum over input features
    #out = torch.sum(y_prune, dim=-1) # (n * batch_size, out_features)
    out = torch.sum(y_prune_quant, dim=-1)

    # Quantize/Clamp the sum of the LUT outputs
    out_quant = self.output_quantizer(out)

    #out = out.reshape(*in_shape[:-1] , self.out_features) # (n, batch_size, out_feature)
    out = out_quant.reshape(*in_shape[:-1] , self.out_features)

    return out

####################################################################################################
  @torch.no_grad()
  def prune_below_threshold(
      self,
      input_state_space: torch.tensor, # (samples)
      threshold: float=0.01,
      next_layer_sparsity_matrix: Optional[torch.tensor] = None, # (out_features_next, out_features)
      prev_layer_sparsity_matrix: Optional[torch.tensor] = None, # (out_features_next, out_features)
  ):

    x = input_state_space.unsqueeze(0).repeat(self.in_features, 1).T.to(self.device) # (samples, in_features)

    spline_base = self.b_spline(x) # (samples, in_features, grid_size + spline_order)

    norms = torch.zeros(self.out_features, self.in_features, device=self.w_base.device)

    for out_index in range(self.out_features):
      for in_index in range(self.in_features):
        base_edge = self.w_base[out_index, in_index] * self.base_activation_function(x[:, in_index]) # (samples)

        spline_edge = F.linear(
                    spline_base[:, in_index, :],                # (samples, grid_size + spline_order)
                    self.scale_w_spline[out_index, in_index, :] # (1, grid_size + spline_order).T
                )                                               # (samples)

        edge = spline_edge + base_edge
        # spline_edge_norm = torch.norm(edge) # sqrt(sum(spline_edge**2)) # euclidean normalize calculate
        spline_edge_norm = edge.square().mean().sqrt() # RMS calculate
        norms[out_index, in_index] = self.spline_selector[out_index, in_index] * spline_edge_norm 

    self.spline_selector *= (norms > threshold).float() # cắt tỉa tại lớp đang xét

    # forward pruning
    if prev_layer_sparsity_matrix is not None: # Các hàm ở lớp trước đó bị tỉa dẫn đến không còn tồn tại nút ở lớp trước, thì xóa các hàm được nối từ nút đó ở lớp đang xét
      dead_nodes   = (prev_layer_sparsity_matrix == 0).all(dim=1)
      self.spline_selector[:, dead_nodes] = 0

    # backward pruning
    if next_layer_sparsity_matrix is not None: # Nút không nối đến các hàm ở lớp kế tiếp (vì các hàm bị tỉa nên không tồn tại), thì xóa các hàm nối đến nút ở lớp đang xét
      zero_columns = (next_layer_sparsity_matrix == 0).all(dim=0)
      self.spline_selector[zero_columns, :] = 0

    

####################################################################################################
class KANQuant(nn.Module):
  def __init__(
      self,
      config,
      input_layer,
      device="cpu"
  ):
    super(KANQuant, self).__init__()
    self.input_layer      = input_layer
    self.layer           = config['layers']
    self.layers_bitwidth  = config['layers_width']
    self.is_cuda          = device == "cuda"
    self.device           = device

    self.layers = torch.nn.ModuleList()
    for in_features, out_features, in_precision, out_precision in zip(self.layer[:-1], self.layer[1:], self.layers_bitwidth[:-1], self.layers_bitwidth[1:]):
      self.layers.append(
          KANLinear(
              in_feat=in_features,
              out_feat=out_features,
              in_precision=in_precision,
              out_precision=out_precision,
              grid_size=config['grid_size'],
              spline_order=config['spline_order'],
              scale_noise=0.1,
              scale_base=1.0,
              scale_spline=1.0,
              enable_scale_spline=True,
              base_activation=eval(config['base_activation']),
              grid_eps=config['grid_eps'],
              grid_range=config['grid_range'],
              device=device
          )
      )

  def forward(self, x: torch.Tensor, update_grid=False):
    x = self.input_layer(x)
    for layer in self.layers: x = layer(x)
    return x

  def prune_below_threshold(
      self,
      threshold     : float = 0.01,
      epoch         : int   =    0,
      target_epoch  : int   =   20,
      warmup_epochs : int   =   10,
      show_layer    : bool  = True
  ):

    if epoch < warmup_epochs: return 1
    
    total_nodes     = 0
    total_remaining = 0

    # ---- Asymptotic schedule parameters (adjust if desired) ----
    # prune(epoch) = T * (1 - exp(-ln20 * (max(epoch - warmup_epoch) / (epoch - warmup_epoch))))
    # prune(epoch) > spline -> prune
    # prune(epoch) < spline -> hold
    t = max(epoch - warmup_epochs, 0) # Xác định bắt đầu pruning sau khi vượt ngưỡng warmup epochs

    # Solve 1 - exp(-k * (target_epoch - warmup_epochs)) = 0.95
    # ->  k = ln(20) / (target - warmup)
    k     = math.log(20) / max(target_epoch - warmup_epochs, 1)
    scale = 1.0 - math.exp(-k * t)
    layer_threshold = min (threshold * scale, threshold)
    print(f"Threshold {layer_threshold} / {threshold}")

    with torch.no_grad():
      for i, layer in enumerate(self.layers):
        input_state_space = None

        if(i == 0): input_state_space = self.input_layer.get_state_space(self.is_cuda).to(self.device) # lớp đầu tiên thì lấy miền lượng tử của lớp đầu vào
        else      : input_state_space = self.layers[i - 1].output_quantizer.get_state_space(self.is_cuda).to(self.device) # lấy miền đầu ra lượng tử lớp trước làm đầu ra lớp hiện tại


        # lấy spline_selector của layer kế tiếp để cắt tỉa ngược cho layer hiện tại, ngoại trừ layer cuối cùng
        if(i < len(self.layers) - 1): next_layer_sparsity_matrix = self.layers[i + 1].spline_selector
        else                        : next_layer_sparsity_matrix = None
        # lấy spline_selector của layer trước đó để cắt tỉa ngược cho layer hiện tại, ngoại trừ layer đầu tiên
        if(i > 0)                   : prev_layer_sparsity_matrix = self.layers[i - 1].spline_selector
        else                        : prev_layer_sparsity_matrix = None

        layer.prune_below_threshold(input_state_space, layer_threshold, next_layer_sparsity_matrix, prev_layer_sparsity_matrix)

        layer_nodes     = layer.spline_selector.numel() # layer.in_features * layer.out_features
        layer_remaining = layer.spline_selector.sum()
        if(show_layer):
          layer_remaining_fraction = layer_remaining / layer_nodes
          print(f"Layer {i} remaining fraction: {layer_remaining} / {layer_nodes} = {layer_remaining_fraction}")

        total_nodes      += layer_nodes # layer.in_features * layer.out_features
        total_remaining  += layer_remaining
      remaining_fraction  = total_remaining/total_nodes

      print(f"Total_remaining/Total_nodes = {total_remaining}/{total_nodes}")

      return remaining_fraction