import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F
import CAE_decoders
import CAE_encoders

class View(nn.Module):
    def __init__(self, dim,  shape):
        super(View, self).__init__()
        self.dim = dim
        self.shape = shape

    def forward(self, input):
        new_shape = list(input.shape)[:self.dim] + list(self.shape) + list(input.shape)[self.dim+1:]
        return input.view(*new_shape)





def prepInput(normData):
    arrange =  np.array([28,29,30,31,0,4,8,12,
                     24,25,26,27,1,5,9,13,
                         20,21,22,23,2,6,10,14,
                         16,17,18,19,3,7,11,15,
                         47,43,39,35,35,34,33,32,
                         46,42,38,34,39,38,37,36,
                         45,41,37,33,43,42,41,40,
                         44,40,36,32,47,46,45,44])

    arrMask= np.array([1,1,1,1,1,1,1,1,
                       1,1,1,1,1,1,1,1,
                       1,1,1,1,1,1,1,1,
                       1,1,1,1,1,1,1,1,
                       1,1,1,1,0,0,0,0,
                       1,1,1,1,0,0,0,0,
                       1,1,1,1,0,0,0,0,
                       1,1,1,1,0,0,0,0,])

    calQMask=np.array([1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,
                        1,1,1,1,0,0,0,0,
                        1,1,1,1,0,0,0,0,
                        1,1,1,1,0,0,0,0,])
    shape = (1,8,8)
    inputdata = normData[:,arrange]

    inputdata[:,arrMask==0]=0  #zeros out repeated entries

    shaped_data = inputdata.reshape(len(inputdata),shape[0],shape[1],shape[2])
    
    return shaped_data

class CAE_conv_arch_CMSSW(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cpu'):
        super(CAE_conv_CMSSW_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_encoder_CMSSW(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_decoder_CMSSW(latent_dims)
        

    def forward(self, x):
        
        x_encoded = self.encoder(x)
        x_reconstructed = self.decoder(x_encoded)
        return x_reconstructed

    def encode(self, x):

        return self.encoder(x)
    
    def decode(self, x):
        
        return self.decoder(x)
    
    
class CAE_conv_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_encoder_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)
    
    
class CAE_conv_large_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_encoder_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)
    
class CAE_conv_large_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_encoder_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)
 

class CAE_conv_large_arch_CMSSW(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cpu'):
        super(CAE_conv_large_arch_CMSSW,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_encoder_arch_CMSSW(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch_CMSSW(latent_dims)
        

    def forward(self, x):
        
        x_encoded = self.encoder(x)
        x_reconstructed = self.decoder(x_encoded)
        return x_reconstructed

    def encode(self, x):

        return self.encoder(x)
    
    def decode(self, x):
        
        return self.decoder(x)
    
class CAE_conv_large_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_encoder_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)
   
class CAE_conv_large_large_arch_CMSSW(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_large_cond1_arch_CMSSW,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_large_encoder_arch_CMSSW(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch_CMSSW(latent_dims)

    def forward(self, x):
        x_encoded = self.encoder(x)
        x_reconstructed = self.decoder(x_encoded)
        return x_reconstructed

    def encode(self, x):

        return self.encoder(x)
    
    def decode(self, x):
       
        return self.decoder(x)

class CAE_conv_large_large_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_large_cond1_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_large_encoder_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)
class CAE_conv_large_large_cond1_arch_CMSSW(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_large_cond1_arch_CMSSW,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_large_encoder_cond1_arch_CMSSW(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch_CMSSW(latent_dims)

    def forward(self, x):
        x_encoded = self.encoder(x)
        x_reconstructed = self.decoder(x_encoded)
        return x_reconstructed

    def encode(self, x):

        return self.encoder(x)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)    
class CAE_conv_large_large_cond1_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_large_cond1_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_large_encoder_cond1_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)
    
class CAE_conv_large_large_cond2_arch_CMSSW(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_large_cond2_arch_CMSSW,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_large_encoder_cond2_arch_CMSSW(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch_CMSSW(latent_dims)

    def forward(self, x):
        x_encoded = self.encoder(x)
        x_reconstructed = self.decoder(x_encoded)
        return x_reconstructed

    def encode(self, x):

        return self.encoder(x)
    
    def decode(self, x):
       
        return self.decoder(x)

class CAE_conv_large_large_cond2_arch(nn.Module):

    def __init__(self,latent_dims = 16, with_loc=False,device = 'cuda'):
        super(CAE_conv_large_large_cond2_arch,self).__init__()
        self.encoder = CAE_encoders.CAE_conv_large_encoder_cond2_arch(latent_dims)
        self.decoder = CAE_decoders.CAE_conv_large_decoder_arch(latent_dims)

    def forward(self, x,c):
        x_encoded = self.encoder(x,c)
        x_reconstructed = self.decoder(x_encoded,c)
        return x_reconstructed

    def encode(self, x,c):

        return self.encoder(x,c)
    
    def decode(self, x,c):
       
        return self.decoder(x,c)

