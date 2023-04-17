ALL_TOOLS      += rocm
rocm_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/include /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/hip/include /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/hsa/include
rocm_EX_LIB := amdhip64
rocm_EX_FLAGS_ROCM_FLAGS  := -fno-gpu-rdc --amdgpu-target=gfx900 --target=$(COMPILER_HOST) --gcc-toolchain=$(COMPILER_PATH) -D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__
rocm_EX_FLAGS_ROCM_HOST_CXXFLAGS  := -D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__
rocm_EX_FLAGS_ROCM_HOST_REM_CXXFLAGS  := -Wno-non-template-friend -Werror=format-contains-nul -Werror=maybe-uninitialized -Werror=unused-but-set-variable -Werror=return-local-addr -fipa-pta -frounding-math -mrecip -fno-crossjumping -fno-aggressive-loop-optimizations -funroll-all-loops

