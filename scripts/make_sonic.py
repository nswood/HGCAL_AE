#!/usr/bin/env python3
import torch
import Naive_DAE
import torch.jit
import torch.nn as nn

import argparse
import os 
import os.path


parser = argparse.ArgumentParser(description="Write Naive_DAE into Triton config for use in cmssw")
parser.add_argument("name", type=str)
parser.add_argument("outdir", type=str)

args = parser.parse_args()

class ModuleListModule(nn.Module):
    '''Module with forward() function from ModuleList'''
    def __init__(self, modules):
        super().__init__()
        self.modulelist = modules

    def forward(self, x):
        for module in self.modulelist:
            x = module(x)
        return x

model = torch.load(args.name+'.pt')

encoder = ModuleListModule(model.encoders)
decoder = ModuleListModule(model.decoders)

encoder = torch.jit.script(encoder)
decoder = torch.jit.script(decoder)

print(encoder)
print(decoder)

os.makedirs(args.outdir, exist_ok=True)
os.makedirs(os.path.join(args.outdir, args.name+"_encode", "1"))
os.makedirs(os.path.join(args.outdir, args.name+"_decode", "1"))
os.makedirs(os.path.join(args.outdir, args.name+"_ensemble", "1"))

torch.jit.save(encoder, os.path.join(args.outdir, args.name+"_encode", "1", "model.pt"))
torch.jit.save(decoder, os.path.join(args.outdir, args.name+"_decode", "1", "model.pt"))

encode_str = '''
name: "%s"
platform: "pytorch_libtorch"
max_batch_size: 100000000
input [
{
  name: "CALQ__0"
  data_type: TYPE_FP32
  dims: [48]
}]
output [
{
  name: "ECON__0"
  data_type: TYPE_FP32
  dims: [16]
}]
'''%(args.name+"_encode")
print(encode_str)

decode_str = '''
name: "%s"
platform: "pytorch_libtorch"
max_batch_size: 10000000
input [
{
  name: "ECON__0"
  data_type: TYPE_FP32
  dims: [16]
}]
output [
{
  name: "rCALQ__0"
  data_type: TYPE_FP32
  dims: [48]
}]
'''%(args.name+"_decode")
print(decode_str)

ensemble_str = '''
name: "%s"
platform: "ensemble"
max_batch_size: 1000000
input [
{
  name: "CALQ__0"
  data_type: TYPE_FP32
  dims: [48]
}]
output [
{
  name: "ECON__0"
  data_type: TYPE_FP32
  dims: [16]
},
{
  name: "rCALQ__1"
  data_type: TYPE_FP32
  dims: [48]
}]
ensemble_scheduling{
  step [
  {
    model_name: "%s"
    model_version: -1
    input_map {
      key: "CALQ__0"
      value: "CALQ__0"
    }
    output_map {
      key: "ECON__0"
      value: "ECON__0"
    }
  },
  {
    model_name: "%s"
    model_version: -1
    input_map {
      key: "ECON__0"
      value: "ECON__0"
    }
    output_map {
      key: "rCALQ__0"
      value: "rCALQ__1"
    }
  }
]}
'''%(args.name+"_ensemble", args.name+"_encode", args.name+"_decode")
print(ensemble_str)


with open(os.path.join(args.outdir, args.name+"_encode", "config.pbtxt"), 'w') as f:
    f.write(encode_str)
with open(os.path.join(args.outdir, args.name+"_decode", "config.pbtxt"), 'w') as f:
    f.write(decode_str)
with open(os.path.join(args.outdir, args.name+"_ensemble", "config.pbtxt"), 'w') as f:
    f.write(ensemble_str)
