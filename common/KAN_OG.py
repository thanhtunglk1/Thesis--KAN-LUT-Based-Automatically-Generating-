import torch
from torch import nn as nn
import math

class KANLinear(nn.Module):
  def __init__(
      self,
      in_feat,
      out_feat,
      grid_size=5,
      spline_order=3,
      scale_noise=0.1,
      scale_base=1.0,
      scale_spline=1.0,
      enable_scale_spline=True,
      base_activation= nn.SiLU,
      grid_eps=0.02,
      grid_range=[-1,1]
  ):
    super(KANLinear, self).__init__()
    self.in_features  = in_feat
    self.out_features = out_feat
    self.grid_size    = grid_size
    self.spline_order = spline_order

    h = (grid_range[1] - grid_range[0]) / grid_size

    grid = torch.arange(-spline_order, grid_size + spline_order + 1) * h + grid_range[0] # (2 * spline_order + grid_size + 1)
    grid = grid.expand(in_feat, -1).contiguous() #(in_features, 2 * spline_order + grid_size + 1)

    self.register_buffer("grid", grid)
    self.w_base   = torch.nn.Parameter(torch.Tensor(out_feat, in_feat))
    w_spline_num  = grid_size + spline_order
    self.w_spline = torch.nn.Parameter(torch.Tensor(out_feat, in_feat, w_spline_num))

    if enable_scale_spline: self.spline_scale = torch.nn.Parameter(torch.Tensor(out_feat, in_feat))

    self.scale_noise  = scale_noise
    self.scale_base   = scale_base
    self.scale_spline = scale_spline
    self.grid_eps     = grid_eps
    self.enable_scale_spline      = enable_scale_spline
    self.base_activation_function = base_activation()

    self.init_parameters()

####################################################################################################
  def b_spline(self, x: torch.Tensor):
    assert x.dim() == 2 and x.size(1) == self.in_features # (batch_size, in_features)
    grid: torch.Tensor = self.grid # (in_features, 2*spline_order + grid_size + 1)
    x = x.unsqueeze(-1) # (batch_size, in_features, 1)

    bases = (x >= grid[:, :-1]) & (x < grid[:, 1:]) # (in_features, 2*spline_order + grid_size)
    bases = bases.to(x.dtype)

    for p in range (1, self.spline_order + 1):
      down = (x - grid[:,:-(p+1)]) * bases[:,:, :-1] / (grid[:, p :-1] - grid[:, :-(p+1)])
      up   = (grid[:, (p+1):] - x) * bases[:,:,1:  ] / (grid[:,(p+1):] - grid[:,1:-p    ])
      bases = down + up
    # (batch_size, in_features, grid_size + spline_order)
    return bases.contiguous()

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
    # y_prune = self.spline_selector.unsqueeze(0) * y # (n * batch_size, out_features, in_features)

    #Quantize the LUT Output
    # y_prune_quant = self.output_quantizer(y_prune)

    # Sum over input features
    out = torch.sum(y, dim=-1) # (n * batch_size, out_features)
    # out = torch.sum(y_prune_quant, dim=-1)
    # Quantize/Clamp the sum of the LUT outputs
    # out_quant = self.output_quantizer(out)

    out = out.reshape(*in_shape[:-1] , self.out_features) # (n, batch_size, out_feature)
    # out = out_quant.reshape(*in_shape[:-1] , self.out_features)

    return out

####################################################################################################

class KAN(nn.Module):
  def __init__(
      self,
      hidden_layers,
      grid_size=5,
      spline_order=3,
      scale_noise=0.1,
      scale_base=1.0,
      scale_spline=1.0,
      enable_scale_spline=True,
      base_activation= torch.nn.SiLU,
      grid_eps=0.02,
      grid_range=[-1,1]
  ):
    super(KAN, self).__init__()
    self.grid_size = grid_size
    self.spline_order = spline_order

    self.layers = torch.nn.ModuleList()
    for in_features, out_features in zip(hidden_layers[:-1], hidden_layers[1:]):
      self.layers.append(
          KANLinear(
              in_features,
              out_features,
              grid_size=grid_size,
              spline_order=spline_order,
              scale_noise=scale_noise,
              scale_base=scale_base,
              scale_spline=scale_spline,
              enable_scale_spline=enable_scale_spline,
              base_activation=base_activation,
              grid_eps=grid_eps,
              grid_range=grid_range
          )
      )

  def forward(self, x: torch.Tensor, update_grid=False):
    for layer in self.layers:
      if update_grid: layer.update_grid(x)
      x = layer(x)
    return x