cmsrel CMSSW_12_5_2_patch1
cd CMSSW_12_5_2_patch1/src
cmsenv
git cms-init
git cms-checkout-topic ssrothman:ECON_12_5_2_patch1
scram b -j32
