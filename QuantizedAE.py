import torch
import torch.nn as nn

class QuantizedAE(nn.Module):
    def __init__(self, encoder, decoder):
        super(QuantizedAE,self).__init__()
        # QuantStub converts tensors from floating point to quantized.
        # This will only be used for inputs.
        self.encoder = encoder
        self.decoder = decoder
        self.quant = torch.quantization.QuantStub()
        # DeQuantStub converts tensors from quantized to floating point.
        # This will only be used for outputs.
        self.dequant = torch.quantization.DeQuantStub()

    def forward(self, x,c):
        # manually specify where tensors will be converted from floating
        # point to quantized in the quantized model
        x = self.quant(x)
        x_encoded = self.encoder(x,c)
        
        # manually specify where tensors will be converted from quantized
        # to floating point in the quantized model
        x_encoded = self.dequant(x_encoded)
        x_reconstructed = self.decoder(x_encoded,c)

        return x_reconstructed
