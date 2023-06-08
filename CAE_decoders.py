import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F

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


    
class CAE_conv_decoder_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims, device = 'cpu'):
        super(CAE_conv_decoder_arch_CMSSW,self).__init__()
        self.device = device
#         self.unflatten = nn.Unflatten(dim=1, unflattened_size=(8,4,4)).to(self.device)
        
        self.decoders = nn.Sequential(nn.Linear(17,128),
                                     nn.ReLU()).to(self.device)
        self.final_decoder = nn.Sequential(nn.Linear(72,48)).to(self.device)
        self.decoder_conv = nn.ConvTranspose2d(8, 1, 2,stride = 2).to(self.device)
        self.i = 0
        self.undo = [4,12,20,28,
                     5,13,21,29,6,14,
                     22,30,7,15,23,31,
                     24,25,26,27,16,17,
                     18,19,8,9,10,11,0,
                     1,2,3,59,51,43,35,
                     58,50,42,34,57,49,
                     41,33,56,48,40,32]


        
    def forward(self, x):
        
        
        
        for dec in self.decoders:
            x = dec(x)
        
        
        
        x = View(1,(8,4,4)).to(self.device)(x)
        
        x =F.relu(self.decoder_conv(x))
        x = torch.flatten(x,start_dim=1)
        
        return x[:,self.undo]

class CAE_conv_decoder_arch(nn.Module):
    def __init__(self,latent_dims, device = 'cpu'):
       

        super(CAE_conv_decoder_arch, self).__init__()
        self.device = device
        self.unflatten = nn.Unflatten(dim=1, unflattened_size=(8,4,4)).to(self.device)
        
        self.decoders = nn.Sequential(nn.Linear(17,128).to(self.device),
                                     nn.ReLU().to(self.device))
        self.final_decoder = nn.Sequential(nn.Linear(72,48)).to(self.device)
        self.decoder_conv = nn.ConvTranspose2d(8, 1, 2,stride = 2).to(self.device)
        
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i        
        
    def forward(self,x,c):
        x = torch.hstack((x,c.to(self.device))).to(self.device)
        
        for dec in self.decoders:
            x = dec(x)
        
        x = self.unflatten(x)
        
        x =F.relu(self.decoder_conv(x))
        
        return x
    
    
class CAE_conv_large_decoder_arch(nn.Module):
    def __init__(self,latent_dims, device = 'cpu'):
       

        super(CAE_conv_large_decoder_arch, self).__init__()
        self.device = device
        self.unflatten = nn.Unflatten(dim=1, unflattened_size=(8,4,4)).to(self.device)
        
        self.decoders = nn.Sequential(nn.Linear(17,250).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(250,150).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(150,128).to(self.device),
                                     nn.ReLU().to(self.device))
        self.final_decoder = nn.Sequential(nn.Linear(72,48)).to(self.device)
        self.decoder_conv = nn.ConvTranspose2d(8, 1, 2,stride = 2).to(self.device)
        
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i        
        
    def forward(self,x,c):
        x = torch.hstack((x,c.to(self.device))).to(self.device)
        
        for dec in self.decoders:
            x = dec(x)
        
        x = self.unflatten(x)
        
        x =F.relu(self.decoder_conv(x))
        
        return x    
  
    
class CAE_conv_large_decoder_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims, device = 'cpu'):
        super(CAE_conv_large_decoder_arch_CMSSW,self).__init__()
        self.device = device
#         self.unflatten = nn.Unflatten(dim=1, unflattened_size=(8,4,4)).to(self.device)
        
        self.decoders = nn.Sequential(nn.Linear(17,250).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(250,150).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(150,128).to(self.device),
                                     nn.ReLU().to(self.device))
        self.final_decoder = nn.Sequential(nn.Linear(72,48)).to(self.device)
        self.decoder_conv = nn.ConvTranspose2d(8, 1, 2,stride = 2).to(self.device)
        self.i = 0
        self.undo = [4,12,20,28,
                     5,13,21,29,6,14,
                     22,30,7,15,23,31,
                     24,25,26,27,16,17,
                     18,19,8,9,10,11,0,
                     1,2,3,59,51,43,35,
                     58,50,42,34,57,49,
                     41,33,56,48,40,32]


        
    def forward(self, x):
        
        
        
        for dec in self.decoders:
            x = dec(x)
        
        
        
        x = View(1,(8,4,4)).to(self.device)(x)
        
        x =F.relu(self.decoder_conv(x))
        x = torch.flatten(x,start_dim=1)
        
        return x[:,self.undo]
