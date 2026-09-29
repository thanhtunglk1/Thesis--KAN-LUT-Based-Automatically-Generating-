import torch
# import numpy as np
from torch import nn as nn
from brevitas.core.quant import QuantType, RescalingIntQuant, ClampedBinaryQuant

def get_int_state_space(
    bits        : int ,
    signed      : bool,
    narrow_range: bool,
    is_cuda     : bool = True
):

  if signed : start = int(-(2**(bits - 1)) + int(narrow_range))
  else      : start = int(0)

  end = start + (2**bits) - int(narrow_range)*int(signed)

  #end = start + (2**bits) - int(narrow_range)

  state_space = torch.arange(start, end)
  return state_space.to("cuda") if is_cuda else state_space


def get_float_state_space(
    bits        : int      ,
    scale_factor: float    ,
    signed      : bool     ,
    narrow_range: bool     ,
    quant_type  : QuantType,
    is_cuda     : bool = True
):

  if   quant_type == QuantType.INT:
    bin_state_space = get_int_state_space(bits, signed, narrow_range, is_cuda)
  elif quant_type == QuantType.BINARY:
    bin_state_space = torch.tensor([-1,1])

  bin_state_space = bin_state_space.to(device = scale_factor.device, dtype = scale_factor.dtype)

  return bin_state_space * scale_factor

####################################################################################################
class QuantBrevitasActivation(nn.Module):
  def __init__(
      self,
      brevitas_module,
      pre_transforms : list = [],
      post_transforms: list = [],
      cuda = True
  ):
    super(QuantBrevitasActivation, self).__init__()
    self.brevitas_module = brevitas_module
    self.pre_transforms  = nn.ModuleList(pre_transforms)
    self.post_transforms = nn.ModuleList(post_transforms)
    self.is_bin_output   = False
    self.cuda            = cuda

  ####################################################################################################
  def apply_pre_transforms(self, x):
    for i in range(len(self.pre_transforms)):
        x = self.pre_transforms[i](x)
    return x

  def apply_post_transforms(self, x):
    for i in range(len(self.post_transforms)):
        x = self.post_transforms[i](x)
    return x

  ####################################################################################################
  def bin_output(self): self.is_bin_output = True

  def float_output(self): self.is_bin_output = False

  ####################################################################################################
  def get_quant_type(self):
    brevitas_module_type = type(self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant)

    if   brevitas_module_type == RescalingIntQuant : return QuantType.INT
    elif brevitas_module_type == ClampedBinaryQuant: return QuantType.BINARY
    else: raise Exception("Unknown quantization type for tensor_quant: {}".format(brevitas_module_type))

  def get_scale_factor_bits(self):
    quant_proxy    = self.brevitas_module.act_quant
    current_status = quant_proxy.training # bool True/False
    quant_proxy.eval() # eval_mode -> scale_fix

    mod_device     = next(self.brevitas_module.parameters()).device
    zero_point     = torch.zeros(1, device=mod_device)

    # output, scale_factor, zero_point, bit_width, min_val, max_val
    _, scale_factor, _, bits, _, _ = quant_proxy(zero_point)
    quant_proxy.training = current_status
    return scale_factor, bits

  def get_state_space(self, is_cuda):
    quant_type            = self.get_quant_type()
    scale_factor, bits    = self.get_scale_factor_bits()

    if   (quant_type == QuantType.INT   ):
      tensor_quant = self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
      narrow_range = tensor_quant.int_quant.narrow_range
      signed       = tensor_quant.int_quant.signed
      state_space  = (get_int_state_space(bits, signed, narrow_range, is_cuda)).to(device = scale_factor.device, dtype = scale_factor.dtype)

    elif (quant_type == QuantType.BINARY):
      state_space = torch.tensor([-1,1]).to(device = scale_factor.device, dtype = scale_factor.dtype)

    else : raise Exception("Unknown quantization type: {}".format(quant_type))

    state_space = scale_factor * state_space
    return self.apply_post_transforms(state_space)

  def get_bin_state_space(self, is_cuda):
    quant_type = self.get_quant_type()
    _, bits    = self.get_scale_factor_bits()

    if   (quant_type == QuantType.INT   ):
      tensor_quant = self.brevitas_module.act_quant.fused_activation_quant_proxy.tensor_quant
      narrow_range = tensor_quant.int_quant.narrow_range
      signed       = tensor_quant.int_quant.signed
      state_space  = get_int_state_space(bits, signed, narrow_range, is_cuda)

    elif (quant_type == QuantType.BINARY):
      state_space = torch.tensor([0, 1])

    else : raise Exception("Unknown quantization type: {}".format(quant_type))

    return state_space

  ####################################################################################################
  def forward(self, x):
    x = self.apply_pre_transforms(x)
    x = self.brevitas_module(x)

    if self.is_bin_output:
      scale_factor, _ = self.get_scale_factor_bits()
      x = torch.round(x / scale_factor).type(torch.int64)

    else:
      x = self.apply_post_transforms(x)

    return x

#####################################################################################################   
class ScalarScaleBias(nn.Module):
  def __init__(
      self,
      scale      = True,
      scale_init = 1.0 ,
      bias       = True,
      bias_init  = 1.0
  ):
    super(ScalarScaleBias, self).__init__()

    if scale: self.weight = nn.Parameter(torch.Tensor(1))
    else    : self.register_parameter("weight", None)

    if bias: self.bias = nn.Parameter(torch.Tensor(1))
    else   : self.register_parameter("bias", None)

    self.weight_init = scale_init
    self.bias_init   = bias_init

    self.reset_parameters()

  def reset_parameters(self):
    if self.weight is not None: nn.init.constant_(self.weight, self.weight_init)
    if self.bias   is not None: nn.init.constant_(self.bias  , self.bias_init  )

  def forward(self, x):
    if self.weight is not None: x  = x * self.weight
    if self.bias   is not None: x  = x + self.bias
    return x

#####################################################################################################   

class ScalarBiasScale(ScalarScaleBias):

  def forward(self, x):
    if self.bias   is not None: x  = x + self.bias
    if self.weight is not None: x  = x * self.weight
    return x
  
#####################################################################################################   
    
