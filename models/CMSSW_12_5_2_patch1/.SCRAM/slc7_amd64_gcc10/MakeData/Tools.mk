ALL_TOOLS      += abseil-cpp
abseil-cpp_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/abseil-cpp/20210324.2-b40b6bbdd4590a7d5dbca28777fc1276/include
abseil-cpp_EX_LIB := absl_bad_any_cast_impl absl_bad_optional_access absl_bad_variant_access absl_base absl_city absl_civil_time absl_cord absl_debugging_internal absl_demangle_internal absl_examine_stack absl_exponential_biased absl_failure_signal_handler absl_flags_commandlineflag_internal absl_flags_commandlineflag absl_flags_config absl_flags_internal absl_flags_marshalling absl_flags_parse absl_flags_private_handle_accessor absl_flags_program_name absl_flags_reflection absl_flags absl_flags_usage_internal absl_flags_usage absl_graphcycles_internal absl_hash absl_hashtablez_sampler absl_int128 absl_leak_check_disable absl_leak_check absl_log_severity absl_malloc_internal absl_periodic_sampler absl_random_distributions absl_random_internal_distribution_test_util absl_random_internal_platform absl_random_internal_pool_urbg absl_random_internal_randen_hwaes_impl absl_random_internal_randen_hwaes absl_random_internal_randen_slow absl_random_internal_randen absl_random_internal_seed_material absl_random_seed_gen_exception absl_random_seed_sequences absl_raw_hash_set absl_raw_logging_internal absl_scoped_set_env absl_spinlock_wait absl_stacktrace absl_statusor absl_status absl_strerror absl_str_format_internal absl_strings_internal absl_strings absl_symbolize absl_synchronization absl_throw_delegate absl_time absl_time_zone absl_wyhash

ALL_TOOLS      += alpaka-cuda
alpaka-cuda_EX_USE := alpaka cuda
alpaka-cuda_EX_FLAGS_CUDA_FLAGS  := -DALPAKA_ACC_GPU_CUDA_ENABLED -UALPAKA_HOST_ONLY
alpaka-cuda_EX_FLAGS_CXXFLAGS  := -DALPAKA_ACC_GPU_CUDA_ENABLED -DALPAKA_HOST_ONLY
alpaka-cuda_EX_FLAGS_GENREFLEX_CPPFLAGS  := -DALPAKA_ACC_GPU_CUDA_ENABLED -DALPAKA_HOST_ONLY

ALL_TOOLS      += alpaka-serial
alpaka-serial_EX_USE := alpaka
alpaka-serial_EX_FLAGS_CXXFLAGS  := -DALPAKA_ACC_CPU_B_SEQ_T_SEQ_ENABLED
alpaka-serial_EX_FLAGS_GENREFLEX_CPPFLAGS  := -DALPAKA_ACC_CPU_B_SEQ_T_SEQ_ENABLED

ALL_TOOLS      += alpaka-tbb
alpaka-tbb_EX_USE := alpaka tbb
alpaka-tbb_EX_FLAGS_CXXFLAGS  := -DALPAKA_ACC_CPU_B_TBB_T_SEQ_ENABLED
alpaka-tbb_EX_FLAGS_GENREFLEX_CPPFLAGS  := -DALPAKA_ACC_CPU_B_TBB_T_SEQ_ENABLED

ALL_TOOLS      += alpaka
alpaka_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/alpaka/develop-20220902-e80d13b043e1608b43d2007d06ad7e2f/include
alpaka_EX_USE := boost
alpaka_EX_FLAGS_CUDA_FLAGS  := -DALPAKA_DEFAULT_HOST_MEMORY_ALIGNMENT=128
alpaka_EX_FLAGS_CXXFLAGS  := -DALPAKA_DEFAULT_HOST_MEMORY_ALIGNMENT=128
alpaka_EX_FLAGS_GENREFLEX_CPPFLAGS  := -DALPAKA_DEFAULT_HOST_MEMORY_ALIGNMENT=128

ALL_TOOLS      += alpgen

ALL_TOOLS      += blackhat
blackhat_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/blackhat/0.9.9-b18ee5bda10617cc8630387a72a37be4/include
blackhat_EX_LIB := Ampl_eval BG BH BHcore CutPart Cut_wCI Cuteval Integrals Interface OLA RatPart Rateval Spinors assembly ratext
blackhat_EX_USE := qd

ALL_TOOLS      += boost
boost_EX_LIB := boost_thread boost_date_time
boost_EX_USE := boost_header

ALL_TOOLS      += boost_chrono
boost_chrono_EX_LIB := boost_chrono
boost_chrono_EX_USE := boost_system boost

ALL_TOOLS      += boost_filesystem
boost_filesystem_EX_LIB := boost_filesystem
boost_filesystem_EX_USE := boost_system boost

ALL_TOOLS      += boost_header
boost_header_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/boost/1.78.0-12075919175e8d078539685f9234134a/include
boost_header_EX_USE := sockets root_cxxdefaults
boost_header_EX_FLAGS_CPPDEFINES  := -DBOOST_SPIRIT_THREADSAFE -DPHOENIX_THREADSAFE -DBOOST_MATH_DISABLE_STD_FPCLASSIFY -DBOOST_UUID_RANDOM_PROVIDER_FORCE_POSIX
boost_header_EX_FLAGS_CXXFLAGS  := -Wno-error=unused-variable
boost_header_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += boost_iostreams
boost_iostreams_EX_LIB := boost_iostreams
boost_iostreams_EX_USE := boost

ALL_TOOLS      += boost_mpi
boost_mpi_EX_LIB := boost_mpi
boost_mpi_EX_USE := boost boost_serialization

ALL_TOOLS      += boost_program_options
boost_program_options_EX_LIB := boost_program_options
boost_program_options_EX_USE := boost

ALL_TOOLS      += boost_python
boost_python_EX_LIB := boost_python39
boost_python_EX_USE := boost_header python3

ALL_TOOLS      += boost_regex
boost_regex_EX_LIB := boost_regex
boost_regex_EX_USE := boost

ALL_TOOLS      += boost_serialization
boost_serialization_EX_LIB := boost_serialization
boost_serialization_EX_USE := boost

ALL_TOOLS      += boost_system
boost_system_EX_LIB := boost_system
boost_system_EX_USE := boost

ALL_TOOLS      += boost_test
boost_test_EX_LIB := boost_unit_test_framework
boost_test_EX_USE := boost

ALL_TOOLS      += bz2lib
bz2lib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/bz2lib/1.0.6-86270889250d9cb8193d1963706a39cb/include
bz2lib_EX_LIB := bz2
bz2lib_EX_USE := root_cxxdefaults

ALL_TOOLS      += c-ares
c-ares_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/c-ares/1.15.0-265850121fd84019601aa78930b152e4/include
c-ares_EX_LIB := cares

ALL_TOOLS      += catch2
catch2_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/catch2/2.13.6-0206169dd9090cceffcf4482a5a2b078/include

ALL_TOOLS      += classlib
classlib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/classlib/3.1.3-7a805383ac3cf7b871d22a6c66bd8f6f/include
classlib_EX_LIB := classlib
classlib_EX_USE := pcre root_cxxdefaults
classlib_EX_FLAGS_CPPDEFINES  := -D__STDC_LIMIT_MACROS -D__STDC_FORMAT_MACROS

ALL_TOOLS      += clhep
clhep_EX_LIB := CLHEP
clhep_EX_USE := clhepheader

ALL_TOOLS      += clhepheader
clhepheader_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/clhep/2.4.5.1-5bba156cb451d19d7be7ff651e7c5f9f/include
clhepheader_EX_USE := root_cxxdefaults
clhepheader_EX_FLAGS_ROOTCLING_ARGS  := -moduleMapFile=$(CLHEP_BASE)/include/module.modulemap
clhepheader_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += cmssw
ALL_SCRAM_PROJECTS += cmssw
cmssw_EX_LIBDIR := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw/CMSSW_12_5_2/biglib/slc7_amd64_gcc10 /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw/CMSSW_12_5_2/lib/slc7_amd64_gcc10
cmssw_EX_USE := root_cxxdefaults
cmssw_ORDER := 96000

ALL_TOOLS      += cmsswdata
cmsswdata_EX_FLAGS_CMSSW_DATA_PACKAGE  := Alignment/OfflineValidation=V00-02-00 CalibCalorimetry/CaloMiscalibTools=V01-00-00-1e359f4684c0a547041e91929935cc93 CalibCalorimetry/EcalTrivialCondModules=V00-03-00-3f29f9abe916c17df782424aa5d9ff66 CalibPPS/ESProducers=V01-04-00 CalibTracker/SiPixelESProducers=V02-02-00-3de2ce3fab05a0de2677832dab93bdf2 CalibTracker/SiStripDCS=V01-00-00-b8b00122dd30f4091676ea8a2ae8c56c Calibration/Tools=V01-00-00-bfad76d305de48d14aab07d58793356b CondFormats/JetMETObjects=V01-00-03-e40577c7c91c32ef28425ccc9c644589 CondTools/SiPhase2Tracker=V00-02-00-ab301e7ad0adbf8a3da3fb500f2af5b6 CondTools/SiStrip=V00-02-00 Configuration/Generator=V01-02-00-7f3d032a8e0f4cf7d78077416dc97b96 DQM/DTMonitorClient=V00-01-00-2153085e2f482d6f6e816737dd217724 DQM/EcalMonitorClient=V00-02-00-a7bc8f1eb15ff0a2c7dc1f2995949221 DQM/Integration=V00-02-00 DQM/PhysicsHWW=V01-00-00-2067add152b6ea9a18a5cb499c2cdfbf DQM/SiStripMonitorClient=V01-01-00-a68be4901a51293afd7401ac6346b789 DataFormats/PatCandidates=V01-01-00 DetectorDescription/Schema=V02-03-00-62f8b14880884d5363cf1d2d0a81a05f EgammaAnalysis/ElectronTools=V00-03-01-a2640c4caee35bb3003e6d0834f0f3d9 EventFilter/L1TRawToDigi=V01-00-00-c4345e5fb1b5fb84bcfb53e157ff35ca FWCore/Modules=V00-01-00-aaf6577fe270241d04429c871d9e4d7d FastSimulation/MaterialEffects=V05-00-00-ad214d3d9cd5ced908def294b9dfc8a0 FastSimulation/TrackingRecHitProducer=V01-00-03-b697f80ea0fc352c8b14ecb487265167 Fireworks/Geometry=V07-06-00-ca9567eadde3131a870ba16e493539a7 GeneratorInterface/EvtGenInterface=V02-06-00-069d7849c03bbed5ff0407373ec1fc3c GeneratorInterface/ReggeGribovPartonMCInterface=V00-00-02-e7888b15211f059fb61623109ed94338 Geometry/DTGeometryBuilder=V00-01-00-ed043ac49c36eb4deff34dd55dca1599 Geometry/TestReference=V00-09-00 HLTrigger/JetMET=V01-00-00-381ae6852c05953d0cbebcc52348600c HeterogeneousCore/SonicTriton=V00-01-00-ee979ed083fcfe37034230a9311c4b49 IOPool/Input=V00-01-00-773a8e1cd42a8c8174b5a048d45b9cea L1Trigger/CSCTriggerPrimitives=V00-12-00 L1Trigger/DTTriggerPhase2=V00-02-00-62184c966c5c044640365c16a4481bbe L1Trigger/L1TCalorimeter=V01-01-00-7ffdcd353a83114bd94f3a22c9e1394e L1Trigger/L1TGlobal=V00-04-00 L1Trigger/L1THGCal=V01-07-00 L1Trigger/L1TMuon=V01-07-00 L1Trigger/Phase2L1ParticleFlow=V00-04-00 L1Trigger/RPCTrigger=V00-15-00-7b13d3699b0365d82889180c98c9ef3c L1Trigger/TrackFindingTMTT=V00-02-00-b5515ad56bed7f118fd329179e9bfafb L1Trigger/TrackFindingTracklet=V00-02-00-093ab3788277b45f1c7f7420994f1fbc L1Trigger/TrackTrigger=V00-02-00 L1TriggerConfig/L1TConfigProducers=V00-01-00 MagneticField/Engine=V00-01-00-bea404c71a1f888d85c661cfd8f7fee0 MagneticField/Interpolation=V01-02-00 PhysicsTools/NanoAOD=V01-02-00 PhysicsTools/PatUtils=V00-05-00-ebe86a22f8633984e12455bb608fd5b0 RecoBTag/CTagging=V01-00-03-ca4acf4df500f18609426ac22068d2b6 RecoBTag/Combined=V01-14-00 RecoBTag/SecondaryVertex=V02-00-04-897cb45b1d8fd963c6c31929f6127cb1 RecoBTag/SoftLepton=V01-00-01-e1928694d8f8e0becbd741c06a8133cd RecoCTPPS/TotemRPLocal=V00-02-00-060dc18aa4121ae8928fd114e5a142fd RecoEcal/EgammaClusterProducers=V00-02-00 RecoEgamma/EgammaPhotonProducers=V00-01-00 RecoEgamma/ElectronIdentification=V01-11-00 RecoEgamma/PhotonIdentification=V01-05-00 RecoHGCal/TICL=V00-02-01-709371c8fff1cc243cbba2e5b347d3a8 RecoHI/HiJetAlgos=V01-00-01-dce8f60f00812f8b2ace160a8ddef124 RecoJets/JetProducers=V05-14-00-8daf7d010a84781bd5baf0a07d8bb5a4 RecoLocalCalo/EcalDeadChannelRecoveryAlgos=V01-01-00-6bff958fa4dece97654c3446eabd9892 RecoMET/METPUSubtraction=V01-02-00 RecoMTD/TimingIDTools=V00-01-00-e5ebee178cb9ce04682f36a804a9c892 RecoMuon/MuonIdentification=V01-14-00 RecoMuon/TrackerSeedGenerator=V00-04-00 RecoParticleFlow/PFBlockProducer=V02-04-02-995507fa6064c8e3d542dde66993e3c3 RecoParticleFlow/PFProducer=V16-02-00 RecoParticleFlow/PFTracking=V13-01-00-943f0487fd3e8bfbbe9608edf738505e RecoTauTag/TrainingFiles=V00-06-00 RecoTracker/FinalTrackSelectors=V01-03-00-f8eaaf0be1bd90df3043cf4f15671416 RecoTracker/MkFit=V00-09-00 RecoTracker/TkSeedGenerator=V00-02-00-874bb3272e57cc70103bfa9bec7b8ad2 SLHCUpgradeSimulations/Geometry=V01-00-10-5033d381df2e4c8608861eab7d316683 SimG4CMS/Calo=V03-04-00-854966ed9a3b1ed4dce6a22882078b7d SimG4CMS/Forward=V02-04-00-81f3c4ebc79e0b76f9f1fd6ed78c882b SimG4CMS/HGCalTestBeam=V01-00-00-16aa2c5a2604e92792f3493e08971bfb SimPPS/PPSPixelDigiProducer=V00-00-02-eea81b7a64c9ec2925b5897de1601ba1 SimTracker/SiStripDigitizer=V01-01-00-c8f4eed54b179e592a790eb0375ce806 SimTransport/HectorProducer=V01-00-01-4e1d3dd27f34f2568b755aa20575c410 SimTransport/PPSProtonTransport=V00-02-00-7034819b440f94856e875b98de16f90a SimTransport/TotemRPProtonTransportParametrization=V00-01-00-f2b3e258821c98230e329504152eed2e Validation/Geometry=V00-07-00-837b904f2e11ce5c7648bc04db126ecd Validation/HGCalValidation=V00-05-00

ALL_TOOLS      += coral
ALL_SCRAM_PROJECTS += coral
coral_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/coral/CORAL_2_3_21-33dc9fef33ce0f2d7a0bc34e2361296a/include/LCG
coral_EX_USE := root_cxxdefaults
coral_ORDER := 98000

ALL_TOOLS      += correctionlib
correctionlib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/py3-correctionlib/2.1.0-9883568e909ab1a6bd56068fabb1b1a2/lib/python3.9/site-packages/correctionlib/include
correctionlib_EX_LIB := correctionlib

ALL_TOOLS      += cppunit
cppunit_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cppunit/1.15.x-c8077257a33f4d9e49c08bb58ba5c3b1/include
cppunit_EX_LIB := cppunit
cppunit_EX_USE := root_cxxdefaults sockets

ALL_TOOLS      += cpu_features
cpu_features_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cpu_features/0.7.0-2598396d5d9d09240a26d0d26b5d3f54/include
cpu_features_EX_LIB := cpu_features

ALL_TOOLS      += csctrackfinderemulation
csctrackfinderemulation_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/CSCTrackFinderEmulation/1.2-561fbc0b14638b939df227941df832af/include
csctrackfinderemulation_EX_LIB := CSCTrackFinderEmulation

ALL_TOOLS      += cuda-compatible-runtime
cuda-compatible-runtime_EX_USE := cuda cuda-stubs

ALL_TOOLS      += cuda-cublas
cuda-cublas_EX_LIB := cublas cublasLt
cuda-cublas_EX_USE := cuda

ALL_TOOLS      += cuda-cufft
cuda-cufft_EX_LIB := cufft cufftw
cuda-cufft_EX_USE := cuda

ALL_TOOLS      += cuda-curand
cuda-curand_EX_LIB := curand
cuda-curand_EX_USE := cuda

ALL_TOOLS      += cuda-cusolver
cuda-cusolver_EX_LIB := cusolver cusolverMg
cuda-cusolver_EX_USE := cuda

ALL_TOOLS      += cuda-cusparse
cuda-cusparse_EX_LIB := cusparse
cuda-cusparse_EX_USE := cuda

ALL_TOOLS      += cuda-gcc-support

ALL_TOOLS      += cuda-npp
cuda-npp_EX_LIB := nppial nppicc nppidei nppif nppig nppim nppist nppisu nppitc npps nppc
cuda-npp_EX_USE := cuda

ALL_TOOLS      += cuda-nvgraph
cuda-nvgraph_EX_LIB := nvgraph
cuda-nvgraph_EX_USE := cuda

ALL_TOOLS      += cuda-nvjpeg
cuda-nvjpeg_EX_LIB := nvjpeg
cuda-nvjpeg_EX_USE := cuda

ALL_TOOLS      += cuda-nvml
cuda-nvml_EX_LIB := nvidia-ml
cuda-nvml_EX_USE := cuda-stubs

ALL_TOOLS      += cuda-nvrtc
cuda-nvrtc_EX_LIB := nvrtc
cuda-nvrtc_EX_USE := cuda

ALL_TOOLS      += cuda-stubs
cuda-stubs_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cuda/11.5.2-c927b7e765e06433950d8a7eab9eddb4/include
cuda-stubs_EX_LIB := cuda
cuda-stubs_EX_LIBDIR := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cuda/11.5.2-c927b7e765e06433950d8a7eab9eddb4/lib64/stubs
cuda-stubs_EX_FLAGS_SKIP_TOOL_SYMLINKS  := 1

ALL_TOOLS      += cuda
ALL_LIB_TYPES += CUDA_LIB
cuda_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cuda/11.5.2-c927b7e765e06433950d8a7eab9eddb4/include
cuda_EX_LIB := cudart cudadevrt nvToolsExt
cuda_EX_CUDA_LIB := cudadevrt
cuda_EX_USE := cuda-stubs
cuda_EX_FLAGS_CUDA_FLAGS  := -std=c++17 -O3 --generate-line-info --source-in-ptx --display-error-number --expt-relaxed-constexpr --extended-lambda -gencode arch=compute_60,code=[sm_60,compute_60] -gencode arch=compute_70,code=[sm_70,compute_70] -gencode arch=compute_75,code=[sm_75,compute_75] -Wno-deprecated-gpu-targets -Xcudafe --diag_suppress=esa_on_defaulted_function_ignored --cudart shared
cuda_EX_FLAGS_CUDA_HOST_CXXFLAGS  := -std=c++17
cuda_EX_FLAGS_CUDA_HOST_REM_CXXFLAGS  := -std=% %potentially-evaluated-expression

ALL_TOOLS      += cudnn
cudnn_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cudnn/8.3.3.40-07cf0cde222bc99ee4a15c694134adee/include
cudnn_EX_LIB := cudnn
cudnn_EX_USE := cuda

ALL_TOOLS      += cupti
cupti_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cuda/11.5.2-c927b7e765e06433950d8a7eab9eddb4/include
cupti_EX_LIB := cupti

ALL_TOOLS      += curl
curl_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/curl/7.79.0-497e9b528f6eb6d9394cc8387a9475d6/include
curl_EX_LIB := curl
curl_EX_USE := root_cxxdefaults

ALL_TOOLS      += dablooms
dablooms_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/dablooms/0.9.1-eeb14a343bb1fca63f5b5f142f398551/include
dablooms_EX_LIB := dablooms

ALL_TOOLS      += das_client

ALL_TOOLS      += davix
davix_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/davix/0.8.1-ef1990aa6debd3de951f256764ba191e/include/davix
davix_EX_LIB := davix
davix_EX_USE := boost_system libxml2

ALL_TOOLS      += db6
db6_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/db6/6.2.32-0f34c5862bf3098cbedece4ce9240238/include
db6_EX_LIB := db

ALL_TOOLS      += dcap
dcap_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/dcap/2.47.12-a77c8542c3e7a4c5572e17be1288579a/include
dcap_EX_LIB := dcap
dcap_EX_USE := root_cxxdefaults

ALL_TOOLS      += dd4hep-core
dd4hep-core_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/dd4hep/v01-19x-9f8e66d3f2a7c9d76d7fed87c7424aa6/include
dd4hep-core_EX_LIB := DDCore DDParsers
dd4hep-core_EX_USE := root_cxxdefaults root boost xerces-c clhep
dd4hep-core_EX_FLAGS_CPPDEFINES  := -DDD4HEP_USE_GEANT4_UNITS=1
dd4hep-core_EX_FLAGS_LISTCOMPONENTS  := $(DD4HEP_CORE_BASE)/bin/listcomponents_dd4hep

ALL_TOOLS      += dd4hep-geant4
dd4hep-geant4_EX_LIB := DDG4-static
dd4hep-geant4_EX_USE := geant4core dd4hep-core

ALL_TOOLS      += dd4hep
dd4hep_EX_LIB := DDAlign DDCond
dd4hep_EX_USE := dd4hep-core

ALL_TOOLS      += dip-platform-dependent
dip-platform-dependent_EX_LIB := platform-dependent
dip-platform-dependent_EX_USE := dip_interface

ALL_TOOLS      += dip
dip_EX_LIB := dip
dip_EX_USE := dip-platform-dependent log4cplus

ALL_TOOLS      += dip_interface
dip_interface_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/dip/8693f00cc422b4a15858fcd84249acaeb07b6316-c04a51526b508c0bdbb359410a9a3e8f/include

ALL_TOOLS      += eigen
eigen_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/eigen/82dd3710dac619448f50331c1d6a35da673f764a-01f0fbbc69fe5c11dd0acfe3c748f30b/include/eigen3
eigen_EX_FLAGS_CPPDEFINES  := -DEIGEN_DONT_PARALLELIZE
eigen_EX_FLAGS_CUDA_FLAGS  := --diag-suppress 20014

ALL_TOOLS      += evtgen
evtgen_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/evtgen/2.0.0-3561b5dee9683c7edff531023693c553/include
evtgen_EX_LIB := EvtGen EvtGenExternal
evtgen_EX_USE := hepmc pythia8 tauolapp photospp

ALL_TOOLS      += expat
expat_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/expat/2.1.0-e2e74851cebffc0aa0988d120ae74fcd/include
expat_EX_LIB := expat
expat_EX_USE := root_cxxdefaults

ALL_TOOLS      += fastjet-contrib-archive
fastjet-contrib-archive_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fastjet-contrib/1.044-9d486aedba96a1628f006dea534b4738/include
fastjet-contrib-archive_EX_LIB := EnergyCorrelator GenericSubtractor JetCleanser JetFFMoments Nsubjettiness ScJet SubjetCounting VariableR

ALL_TOOLS      += fastjet-contrib
fastjet-contrib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fastjet-contrib/1.044-9d486aedba96a1628f006dea534b4738/include
fastjet-contrib_EX_LIB := fastjetcontribfragile

ALL_TOOLS      += fastjet
fastjet_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fastjet/3.4.0-52e3efb0f7d6dc14f7751010817f56a5/include
fastjet_EX_LIB := fastjetplugins fastjettools siscone siscone_spherical fastjet
fastjet_EX_USE := root_cxxdefaults

ALL_TOOLS      += fftjet
fftjet_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fftjet/1.5.0-13714b6e92b49137021e45927865deb4/include
fftjet_EX_LIB := fftjet
fftjet_EX_USE := root_cxxdefaults

ALL_TOOLS      += fftw3
fftw3_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fftw3/3.3.8-1e8a7f04706607079fcb2980a542baed/include
fftw3_EX_LIB := fftw3
fftw3_EX_USE := root_cxxdefaults

ALL_TOOLS      += flatbuffers
flatbuffers_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/flatbuffers/1.12.0-59a938efb15228bcd7242b8e4a7fa616/include
flatbuffers_EX_LIB := flatbuffers

ALL_TOOLS      += fmt
fmt_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fmt/8.0.1-b8a6534feba2e3dac314eff5040afd69/include
fmt_EX_LIB := fmt

ALL_TOOLS      += freetype
freetype_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/freetype/2.10.0-79bd022b5b599e6f3ec3b3b8bb0b7d1a/include
freetype_EX_LIB := freetype-cms
freetype_EX_USE := root_cxxdefaults

ALL_TOOLS      += frontier_client
frontier_client_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/frontier_client/2.9.1-9489e6c7ac02a80a06fbda307e9617b7/include
frontier_client_EX_LIB := frontier_client
frontier_client_EX_USE := root_cxxdefaults zlib expat

ALL_TOOLS      += gbl
gbl_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gbl/V02-04-01-ac0f4f4f037c6667166b9df5c54375b6/include
gbl_EX_LIB := GBL
gbl_EX_USE := eigen

ALL_TOOLS      += gcc-atomic
gcc-atomic_EX_LIB := atomic

ALL_TOOLS      += gcc-ccompiler
gcc-ccompiler_EX_FLAGS_CFLAGS  := -O2 -pthread
gcc-ccompiler_EX_FLAGS_CSHAREDOBJECTFLAGS  := -fPIC

ALL_TOOLS      += gcc-cxxcompiler
gcc-cxxcompiler_EX_FLAGS_CPPDEFINES  := -DGNU_GCC -D_GNU_SOURCE
gcc-cxxcompiler_EX_FLAGS_CXXFLAGS  := -O2 -pthread -pipe -Werror=main -Werror=pointer-arith -Werror=overlength-strings -Wno-vla -Werror=overflow -std=c++1z -ftree-vectorize -Werror=array-bounds -Werror=format-contains-nul -Werror=type-limits -fvisibility-inlines-hidden -fno-math-errno --param vect-max-version-for-alias-checks=50 -Xassembler --compress-debug-sections -msse3 -felide-constructors -fmessage-length=0 -Wall -Wno-non-template-friend -Wno-long-long -Wreturn-type -Wextra -Wpessimizing-move -Wclass-memaccess -Wno-cast-function-type -Wno-unused-but-set-parameter -Wno-ignored-qualifiers -Wno-deprecated-copy -Wno-unused-parameter -Wunused -Wparentheses -Wno-deprecated -Werror=return-type -Werror=missing-braces -Werror=unused-value -Werror=unused-label -Werror=address -Werror=format -Werror=sign-compare -Werror=write-strings -Werror=delete-non-virtual-dtor -Werror=strict-aliasing -Werror=narrowing -Werror=unused-but-set-variable -Werror=reorder -Werror=unused-variable -Werror=conversion-null -Werror=return-local-addr -Wnon-virtual-dtor -Werror=switch -fdiagnostics-show-option -Wno-unused-local-typedefs -Wno-attributes -Wno-psabi
gcc-cxxcompiler_EX_FLAGS_CXXSHAREDFLAGS  := -shared -Wl,-E
gcc-cxxcompiler_EX_FLAGS_CXXSHAREDOBJECTFLAGS  := -fPIC
gcc-cxxcompiler_EX_FLAGS_LDFLAGS  := -Wl,-E -Wl,--hash-style=gnu
gcc-cxxcompiler_EX_FLAGS_LD_UNIT  := -r -z muldefs

ALL_TOOLS      += gcc-f77compiler
gcc-f77compiler_EX_LIB := gfortran m
gcc-f77compiler_EX_FLAGS_FFLAGS  := -fno-second-underscore -Wunused -Wuninitialized -O2 -cpp -std=legacy
gcc-f77compiler_EX_FLAGS_FOPTIMISEDFLAGS  := -O2
gcc-f77compiler_EX_FLAGS_FSHAREDOBJECTFLAGS  := -fPIC

ALL_TOOLS      += gcc-plugin
gcc-plugin_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gcc/10.3.0-84898dea653199466402e67d73657f10/bin/../lib/gcc/x86_64-unknown-linux-gnu/10.3.0/plugin/include
gcc-plugin_EX_LIB := cc1plugin cp1plugin

ALL_TOOLS      += gdb

ALL_TOOLS      += gdbm
gdbm_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gdbm/1.10-d603980cbd3ec2df3505d5b82740ee09/include
gdbm_EX_LIB := gdbm
gdbm_EX_USE := root_cxxdefaults

ALL_TOOLS      += gdrcopy
gdrcopy_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gdrcopy/2.3-6d4d168355bd625b6ab61cc4abf02ffa/include
gdrcopy_EX_LIB := gdrapi

ALL_TOOLS      += geant4-parfullcms

ALL_TOOLS      += geant4
geant4_EX_USE := geant4core geant4vis

ALL_TOOLS      += geant4_interface
geant4_interface_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/geant4/10.7.2-de00a520f12d7612b9b1aabc9b70eef3/include/Geant4 /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/geant4/10.7.2-de00a520f12d7612b9b1aabc9b70eef3/include
geant4_interface_EX_USE := clhep vecgeom zlib expat xerces-c root_cxxdefaults
geant4_interface_EX_FLAGS_CPPDEFINES  := -DGNU_GCC -DG4V9
geant4_interface_EX_FLAGS_CXXFLAGS  := -ftls-model=global-dynamic -pthread -DG4GEOM_USE_USOLIDS

ALL_TOOLS      += geant4core
geant4core_EX_LIB := G4digits_hits G4error_propagation G4event G4geometry G4global G4graphics_reps G4intercoms G4interfaces G4materials G4parmodels G4particles G4persistency G4physicslists G4processes G4readout G4run G4tracking G4track G4analysis
geant4core_EX_USE := geant4_interface
geant4core_EX_FLAGS_CPPDEFINES  := -DGNU_GCC -DG4V9

ALL_TOOLS      += geant4data

ALL_TOOLS      += geant4static
geant4static_EX_LIB := geant4-static
geant4static_EX_USE := geant4_interface

ALL_TOOLS      += geant4vis
geant4vis_EX_LIB := G4FR G4modeling G4RayTracer G4Tree G4visHepRep G4vis_management G4visXXX G4VRML G4GMocren
geant4vis_EX_USE := geant4core

ALL_TOOLS      += giflib
giflib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/giflib/5.2.0-7f76394971aaf24e07b4b8369893078f/include
giflib_EX_LIB := gif
giflib_EX_USE := root_cxxdefaults

ALL_TOOLS      += git

ALL_TOOLS      += glimpse

ALL_TOOLS      += gmake

ALL_TOOLS      += gmp
gmp_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gmp-static/6.2.1-e4c905aefc10fb91f8c097e144084d19/include
gmp_EX_LIB := gmp
gmp_EX_USE := mpfr

ALL_TOOLS      += gnuplot

ALL_TOOLS      += google-benchmark-main
google-benchmark-main_EX_LIB := benchmark_main
google-benchmark-main_EX_USE := google-benchmark

ALL_TOOLS      += google-benchmark
google-benchmark_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/google-benchmark/1.4.x-45abf26393c6b4412a16c152114bedc4/include
google-benchmark_EX_LIB := benchmark
google-benchmark_EX_USE := sockets

ALL_TOOLS      += gosam

ALL_TOOLS      += gosamcontrib
gosamcontrib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gosamcontrib/2.0-20150803-5884b0587d951b6d6e6d85fbb84346dd/include

ALL_TOOLS      += gperf
gperf_EX_LIB := profiler
gperf_EX_USE := libunwind

ALL_TOOLS      += grpc
grpc_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/grpc/1.35.0-e8d844b8ad89adfb9f0f63ee46ef05d0/include
grpc_EX_LIB := grpc grpc++ grpc++_reflection
grpc_EX_USE := protobuf openssl pcre abseil-cpp c-ares
grpc_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += gsl
gsl_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gsl/2.6-b614983d7a3915ce8c14658bc72be5cb/include
gsl_EX_LIB := gsl
gsl_EX_USE := openblas root_cxxdefaults

ALL_TOOLS      += hdf5
hdf5_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hdf5/1.10.6-6146aa75e764563c7faa99c8c90ef868/include
hdf5_EX_LIB := hdf5 hdf5_hl
hdf5_EX_USE := openmpi

ALL_TOOLS      += hector
hector_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hector/1.3.4_patch1-1d89cb618a30bcb10693cdc6fc7b9902/include
hector_EX_LIB := Hector
hector_EX_USE := root_cxxdefaults

ALL_TOOLS      += hepmc
hepmc_EX_LIB := HepMCfio HepMC
hepmc_EX_USE := hepmc_headers

ALL_TOOLS      += hepmc3
hepmc3_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hepmc3/3.2.5-c3cd50aeecf06b194814f1a75bf7872e/include
hepmc3_EX_LIB := HepMC3 HepMC3search

ALL_TOOLS      += hepmc_headers
hepmc_headers_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hepmc/2.06.10-46867a6dcc6e5712b7953fe57085fcbd/include
hepmc_headers_EX_USE := root_cxxdefaults

ALL_TOOLS      += heppdt
heppdt_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/heppdt/3.04.01-0b45be765a30d47e8194843c0cab9c07/include
heppdt_EX_LIB := HepPDT HepPID
heppdt_EX_USE := root_cxxdefaults

ALL_TOOLS      += herwig7
herwig7_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/herwig7/7.2.2-abc4b04a694f23d8d475dd8b8180ef90/include
herwig7_EX_LIB := HerwigAPI
herwig7_EX_USE := root_cxxdefaults lhapdf thepeg madgraph5amcatnlo openloops

ALL_TOOLS      += highfive
highfive_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/highfive/2.3.1-294848da05c5e8cf9bf35aa9500e23de/include
highfive_EX_USE := boost hdf5

ALL_TOOLS      += histfactory
histfactory_EX_LIB := HistFactory
histfactory_EX_USE := roofitcore roofit roostats rootcore roothistmatrix rootgpad rootxml rootfoam

ALL_TOOLS      += hls
hls_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hls/2019.08-80454731218d87c9edf8f512cb8429f9/include
hls_EX_USE := root_cxxdefaults
hls_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += hwloc
hwloc_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hwloc/2.8.0-5e2eafc486eaebe9e89380807b3fecb3/include/hwloc
hwloc_EX_LIB := hwloc

ALL_TOOLS      += hydjet
hydjet_EX_LIB := hydjet
hydjet_EX_USE := pyquen pythia6 lhapdf

ALL_TOOLS      += hydjet2
hydjet2_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hydjet2/2.4.3-922da2da5db6a8a2df2946837c92e5e6/include
hydjet2_EX_LIB := hydjet2
hydjet2_EX_USE := pyquen pythia6 lhapdf root
hydjet2_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += igprof

ALL_TOOLS      += intel-license

ALL_TOOLS      += ittnotify
ittnotify_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/ittnotify/16.06.18-9dacc777a1a80aa1b3e442956e72825f/include
ittnotify_EX_LIB := ittnotify

ALL_TOOLS      += iwyu-cxxcompiler
iwyu-cxxcompiler_EX_USE := llvm-cxxcompiler

ALL_TOOLS      += jemalloc
jemalloc_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/jemalloc/5.3.0-83f4e92d89b06e8d4aeb7f1806365e7c/include
jemalloc_EX_LIB := jemalloc
jemalloc_EX_USE := root_cxxdefaults

ALL_TOOLS      += json
json_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/json/3.10.2-a6d86565b09ec3d0e02bf7b52c31bbfc/include

ALL_TOOLS      += ktjet
ktjet_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/ktjet/1.06-b79a7631e4a781a4add6cdd817b558b5/include
ktjet_EX_LIB := KtEvent
ktjet_EX_USE := root_cxxdefaults
ktjet_EX_FLAGS_CPPDEFINES  := -DKTDOUBLEPRECISION

ALL_TOOLS      += lcov

ALL_TOOLS      += lhapdf
lhapdf_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/lhapdf/6.4.0-105c5ba1aa8fdfe89813ce7c7a167669/include
lhapdf_EX_LIB := LHAPDF
lhapdf_EX_USE := pythia6 root_cxxdefaults

ALL_TOOLS      += libffi
libffi_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libffi/3.4.2-482b99521caf507051a7a5dce0eb5926/include
libffi_EX_LIB := ffi

ALL_TOOLS      += libibumad
libibumad_EX_LIB := ibumad
libibumad_EX_USE := rdma-core

ALL_TOOLS      += libibverbs
libibverbs_EX_LIB := ibverbs
libibverbs_EX_USE := rdma-core

ALL_TOOLS      += libjpeg-turbo
libjpeg-turbo_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libjpeg-turbo/2.0.2-4d155b847bc1dab69bb0785eff5da833/include
libjpeg-turbo_EX_LIB := jpeg turbojpeg
libjpeg-turbo_EX_USE := root_cxxdefaults

ALL_TOOLS      += libpciaccess
libpciaccess_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libpciaccess/0.16-b067b0011e7283d86403eafb3159e181/include
libpciaccess_EX_LIB := libpciaccess

ALL_TOOLS      += libpng
libpng_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libpng/1.6.37-efbc28bcd11facd84b6eb25ead83f807/include
libpng_EX_LIB := png
libpng_EX_USE := root_cxxdefaults zlib

ALL_TOOLS      += librdmacm
librdmacm_EX_LIB := rdmacm
librdmacm_EX_USE := rdma-core libibverbs

ALL_TOOLS      += libtiff
libtiff_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libtiff/4.0.10-12a57e56b15d120b61b7c1f73e5f45b7/include
libtiff_EX_LIB := tiff
libtiff_EX_USE := root_cxxdefaults libjpeg-turbo zlib

ALL_TOOLS      += libungif
libungif_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libungif/4.1.4-9da9b254f5bd3bcb7b38d7b89774d232/include
libungif_EX_LIB := ungif
libungif_EX_USE := root_cxxdefaults zlib

ALL_TOOLS      += libunwind
libunwind_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libunwind/1.6.2-master-0de811dc1a1eae431f0b9c0fed5a85b9/include
libunwind_EX_LIB := unwind
libunwind_EX_USE := root_cxxdefaults

ALL_TOOLS      += libuuid
libuuid_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libuuid/2.34-fe91b21b8e54a48f2d45894d9da65f14/include
libuuid_EX_LIB := uuid
libuuid_EX_USE := root_cxxdefaults sockets

ALL_TOOLS      += libxml2
libxml2_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libxml2/2.9.10-32fb6ccc7a5c1482269c150e9287ec24/include/libxml2
libxml2_EX_LIB := xml2
libxml2_EX_USE := root_cxxdefaults

ALL_TOOLS      += libxslt
libxslt_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libxslt/1.1.28-b6c80d356c801ec87eba8f2085074449/include/libxslt
libxslt_EX_LIB := xslt

ALL_TOOLS      += libzmq
libzmq_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libzmq/4.3.4-7b3d0d19970262b531bd9a493bec2676/include
libzmq_EX_LIB := zmq

ALL_TOOLS      += llvm-analyzer-ccompiler
llvm-analyzer-ccompiler_EX_USE := llvm-ccompiler

ALL_TOOLS      += llvm-analyzer-cxxcompiler
llvm-analyzer-cxxcompiler_EX_USE := llvm-cxxcompiler

ALL_TOOLS      += llvm-ccompiler
llvm-ccompiler_EX_USE := gcc-ccompiler

ALL_TOOLS      += llvm-cxxcompiler
llvm-cxxcompiler_EX_USE := gcc-cxxcompiler
llvm-cxxcompiler_EX_FLAGS_CXXFLAGS  := -Wno-c99-extensions -Wno-c++11-narrowing -D__STRICT_ANSI__ -Wno-unused-private-field -Wno-unknown-pragmas -Wno-unused-command-line-argument -Wno-unknown-warning-option -ftemplate-depth=512 -Wno-error=potentially-evaluated-expression -Wno-tautological-type-limit-compare -fsized-deallocation
llvm-cxxcompiler_EX_FLAGS_REM_CXXFLAGS  := -Wno-non-template-friend -Werror=format-contains-nul -Werror=maybe-uninitialized -Werror=unused-but-set-variable -Werror=return-local-addr -fipa-pta -frounding-math -mrecip -fno-crossjumping -fno-aggressive-loop-optimizations -funroll-all-loops
llvm-cxxcompiler_EX_FLAGS_REM_LTO_FLAGS  := -fipa-icf -flto-odr-type-merging

ALL_TOOLS      += llvm-f77compiler
llvm-f77compiler_EX_USE := gcc-f77compiler

ALL_TOOLS      += llvm
llvm_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/llvm/12.0.1-dd4c586a5bebc335346bb0e879f6f0aa/include
llvm_EX_LIB := clang
llvm_EX_FLAGS_CXXFLAGS  := -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -fPIC -Wno-enum-compare -Wno-strict-aliasing -fno-rtti
llvm_EX_FLAGS_LDFLAGS  := -Wl,-undefined -Wl,suppress

ALL_TOOLS      += log4cplus
log4cplus_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/log4cplus/2.0.7-84fec462da09f12420c8aeb320b0260f/include
log4cplus_EX_LIB := log4cplusS

ALL_TOOLS      += lwtnn
lwtnn_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/lwtnn/2.13-0aa0beceb8b5ad713f08f669c678c75e/include
lwtnn_EX_LIB := lwtnn
lwtnn_EX_USE := root_cxxdefaults eigen boost_system

ALL_TOOLS      += lz4
lz4_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/lz4/1.9.2-373b1f6c80ba13e93f436c77aa63c026/include
lz4_EX_LIB := lz4
lz4_EX_USE := root_cxxdefaults

ALL_TOOLS      += madgraph5amcatnlo
madgraph5amcatnlo_EX_USE := root_cxxdefaults gosamcontrib

ALL_TOOLS      += mctester
mctester_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/mctester/1.25.1-70f6263f1586a524a8e9f42e96a8c4eb/include
mctester_EX_LIB := HEPEvent HepMCEvent MCTester
mctester_EX_USE := root_cxxdefaults root hepmc

ALL_TOOLS      += md5
md5_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/md5/1.0.0-0440f43b57c5656322f7cd7a65f85771/include
md5_EX_LIB := cms-md5

ALL_TOOLS      += meschach
meschach_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/meschach/1.2.pCMS1-90927c923838ae1e3dfbdc370d02877d/include
meschach_EX_LIB := meschach
meschach_EX_USE := root_cxxdefaults

ALL_TOOLS      += millepede
millepede_EX_USE := sockets pcre zlib

ALL_TOOLS      += mpfr
mpfr_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/mpfr-static/4.1.0-bcd1c7f4e9eb71a42fa64fc59379c0b5/include
mpfr_EX_LIB := mpfr

ALL_TOOLS      += mxnet-predict
mxnet-predict_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/mxnet-predict/1.6.0-a0e2c980f9e4e5bf97bb3c0cbdce3b7c/include
mxnet-predict_EX_LIB := mxnet
mxnet-predict_EX_USE := openblas
mxnet-predict_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += numactl
numactl_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/numactl/2.0.14-e8527c5132cef1ed03b7b2068c952729/include
numactl_EX_LIB := numa

ALL_TOOLS      += numpy-c-api
numpy-c-api_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/py3-numpy/1.22.4-fed14fba556da687b0d60c63c90ca3bc/c-api/core/include
numpy-c-api_EX_LIB := npymath
numpy-c-api_EX_USE := root_cxxdefaults

ALL_TOOLS      += nvperf
nvperf_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cuda/11.5.2-c927b7e765e06433950d8a7eab9eddb4/include
nvperf_EX_LIB := nvperf_host nvperf_target

ALL_TOOLS      += ofast-flag
ofast-flag_EX_FLAGS_CXXFLAGS  := -Ofast
ofast-flag_EX_FLAGS_NO_RECURSIVE_EXPORT  := 1

ALL_TOOLS      += onnxruntime
onnxruntime_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/onnxruntime/1.10.0-1b13113c7f40c5a1c74def407c33c42b/include
onnxruntime_EX_LIB := onnxruntime
onnxruntime_EX_USE := protobuf cuda cudnn

ALL_TOOLS      += openblas
openblas_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/OpenBLAS/0.3.15-04b535a741a2f5a1f273ae128823f6ef/include
openblas_EX_LIB := openblas

ALL_TOOLS      += opencv
opencv_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/opencv/4.5.5-6df492b6406f0de9f458ea99f7d5e036/include
opencv_EX_LIB := opencv_core
opencv_EX_USE := libpng libjpeg-turbo zlib eigen openblas

ALL_TOOLS      += opengl
opengl_EX_LIB := GL GLU
opengl_EX_USE := x11

ALL_TOOLS      += openldap
openldap_EX_USE := db6

ALL_TOOLS      += openloops

ALL_TOOLS      += openmpi
openmpi_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/openmpi/4.1.4-e67340b691a11fc42ac00b7c443cffa8/include
openmpi_EX_LIB := mpi mpi_cxx

ALL_TOOLS      += openssl
openssl_EX_LIB := ssl crypto

ALL_TOOLS      += oracle
oracle_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/oracle/19.11.0.0.0dbru-e61bbe7b231454fe259beaad3a028428/include
oracle_EX_LIB := clntsh
oracle_EX_USE := root_cxxdefaults sockets

ALL_TOOLS      += oracleocci
oracleocci_EX_LIB := occi
oracleocci_EX_USE := oracle

ALL_TOOLS      += pacparser
pacparser_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pacparser/1.4.0-7c82678fba70b88d74cdbf2802a5001b/include
pacparser_EX_LIB := pacparser
pacparser_EX_USE := root_cxxdefaults

ALL_TOOLS      += pcre
pcre_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pcre/8.43-28d54724578a9006cf0dca75629374e3/include
pcre_EX_LIB := pcre
pcre_EX_USE := root_cxxdefaults zlib bz2lib

ALL_TOOLS      += pcre2
pcre2_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pcre2/10.36-4c006b557b4075554eb6f6436b3189fb/include
pcre2_EX_LIB := pcre2
pcre2_EX_USE := root_cxxdefaults zlib bz2lib

ALL_TOOLS      += photospp
photospp_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/photospp/3.64-cd5d492edbdf55a21c9507524bf54511/include
photospp_EX_LIB := Photospp PhotosppHepMC PhotosppHEPEVT
photospp_EX_USE := hepmc

ALL_TOOLS      += professor2
professor2_EX_USE := py3-numpy root yoda eigen

ALL_TOOLS      += protobuf
protobuf_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/protobuf/3.15.1-7e10d5eb9143430224a15d6b61e33af1/include
protobuf_EX_LIB := protobuf
protobuf_EX_USE := root_cxxdefaults

ALL_TOOLS      += py3-absl-py

ALL_TOOLS      += py3-anyio

ALL_TOOLS      += py3-appdirs

ALL_TOOLS      += py3-argon2-cffi

ALL_TOOLS      += py3-argparse

ALL_TOOLS      += py3-asn1crypto

ALL_TOOLS      += py3-astor

ALL_TOOLS      += py3-astroid

ALL_TOOLS      += py3-astunparse

ALL_TOOLS      += py3-atomicwrites

ALL_TOOLS      += py3-attrs

ALL_TOOLS      += py3-autopep8

ALL_TOOLS      += py3-avro

ALL_TOOLS      += py3-awkward

ALL_TOOLS      += py3-backcall

ALL_TOOLS      += py3-backports-entry-points-selectable

ALL_TOOLS      += py3-beautifulsoup4

ALL_TOOLS      += py3-beniget

ALL_TOOLS      += py3-bleach

ALL_TOOLS      += py3-boost-histogram

ALL_TOOLS      += py3-bottleneck

ALL_TOOLS      += py3-cachecontrol

ALL_TOOLS      += py3-cachetools

ALL_TOOLS      += py3-cachy

ALL_TOOLS      += py3-certifi

ALL_TOOLS      += py3-cffi

ALL_TOOLS      += py3-chardet

ALL_TOOLS      += py3-charset-normalizer

ALL_TOOLS      += py3-cleo

ALL_TOOLS      += py3-click

ALL_TOOLS      += py3-clikit

ALL_TOOLS      += py3-cmsml

ALL_TOOLS      += py3-colorama

ALL_TOOLS      += py3-commonmark

ALL_TOOLS      += py3-contextlib2

ALL_TOOLS      += py3-correctionlib

ALL_TOOLS      += py3-coverage

ALL_TOOLS      += py3-crashtest

ALL_TOOLS      += py3-cryptography

ALL_TOOLS      += py3-cx-oracle

ALL_TOOLS      += py3-cycler

ALL_TOOLS      += py3-cython

ALL_TOOLS      += py3-debugpy

ALL_TOOLS      += py3-decorator

ALL_TOOLS      += py3-defusedxml

ALL_TOOLS      += py3-deprecated

ALL_TOOLS      += py3-deprecation

ALL_TOOLS      += py3-dill

ALL_TOOLS      += py3-distlib

ALL_TOOLS      += py3-docopt

ALL_TOOLS      += py3-docutils

ALL_TOOLS      += py3-downhill

ALL_TOOLS      += py3-dxr

ALL_TOOLS      += py3-entrypoints

ALL_TOOLS      += py3-filelock

ALL_TOOLS      += py3-fire

ALL_TOOLS      += py3-flake8

ALL_TOOLS      += py3-flatbuffers

ALL_TOOLS      += py3-flawfinder

ALL_TOOLS      += py3-flit-core

ALL_TOOLS      += py3-flit

ALL_TOOLS      += py3-fonttools

ALL_TOOLS      += py3-funcsigs

ALL_TOOLS      += py3-future

ALL_TOOLS      += py3-gast

ALL_TOOLS      += py3-gitdb

ALL_TOOLS      += py3-gitpython

ALL_TOOLS      += py3-google-auth-oauthlib

ALL_TOOLS      += py3-google-auth

ALL_TOOLS      += py3-google-pasta

ALL_TOOLS      += py3-grpcio-tools

ALL_TOOLS      += py3-grpcio

ALL_TOOLS      += py3-h5py

ALL_TOOLS      += py3-hep_ml

ALL_TOOLS      += py3-hepdata-lib

ALL_TOOLS      += py3-hist

ALL_TOOLS      += py3-histbook

ALL_TOOLS      += py3-histogrammar

ALL_TOOLS      += py3-histoprint

ALL_TOOLS      += py3-html5lib

ALL_TOOLS      += py3-idna

ALL_TOOLS      += py3-importlib-metadata

ALL_TOOLS      += py3-importlib-resources

ALL_TOOLS      += py3-iniconfig

ALL_TOOLS      += py3-ipaddress

ALL_TOOLS      += py3-ipykernel

ALL_TOOLS      += py3-ipython

ALL_TOOLS      += py3-ipython_genutils

ALL_TOOLS      += py3-ipywidgets

ALL_TOOLS      += py3-isort

ALL_TOOLS      += py3-jedi

ALL_TOOLS      += py3-jeepney

ALL_TOOLS      += py3-jinja2

ALL_TOOLS      += py3-joblib

ALL_TOOLS      += py3-jsonpickle

ALL_TOOLS      += py3-jsonschema

ALL_TOOLS      += py3-jupyter-client

ALL_TOOLS      += py3-jupyter-console

ALL_TOOLS      += py3-jupyter-core

ALL_TOOLS      += py3-jupyter-packaging

ALL_TOOLS      += py3-jupyterlab-pygments

ALL_TOOLS      += py3-jupyterlab-widgets

ALL_TOOLS      += py3-keras-applications

ALL_TOOLS      += py3-keras-preprocessing

ALL_TOOLS      += py3-keras

ALL_TOOLS      += py3-keras2onnx

ALL_TOOLS      += py3-keyring

ALL_TOOLS      += py3-kiwisolver

ALL_TOOLS      += py3-law

ALL_TOOLS      += py3-lazy-object-proxy

ALL_TOOLS      += py3-lizard

ALL_TOOLS      += py3-llvmlite

ALL_TOOLS      += py3-lockfile

ALL_TOOLS      += py3-luigi

ALL_TOOLS      += py3-lxml

ALL_TOOLS      += py3-lz4

ALL_TOOLS      += py3-mako

ALL_TOOLS      += py3-markdown

ALL_TOOLS      += py3-markupsafe

ALL_TOOLS      += py3-matplotlib-inline

ALL_TOOLS      += py3-matplotlib

ALL_TOOLS      += py3-mccabe

ALL_TOOLS      += py3-mistune

ALL_TOOLS      += py3-mock

ALL_TOOLS      += py3-more-itertools

ALL_TOOLS      += py3-mplhep-data

ALL_TOOLS      += py3-mplhep

ALL_TOOLS      += py3-mpmath

ALL_TOOLS      += py3-msgpack

ALL_TOOLS      += py3-nbclient

ALL_TOOLS      += py3-nbconvert

ALL_TOOLS      += py3-nbformat

ALL_TOOLS      += py3-nest-asyncio

ALL_TOOLS      += py3-networkx

ALL_TOOLS      += py3-notebook

ALL_TOOLS      += py3-numba

ALL_TOOLS      += py3-numexpr

ALL_TOOLS      += py3-numpy

ALL_TOOLS      += py3-oauthlib

ALL_TOOLS      += py3-onnx

ALL_TOOLS      += py3-onnxconverter-common

ALL_TOOLS      += py3-onnxmltools

ALL_TOOLS      += py3-opt-einsum

ALL_TOOLS      += py3-packaging

ALL_TOOLS      += py3-pandas

ALL_TOOLS      += py3-pandocfilters

ALL_TOOLS      += py3-parsimonious

ALL_TOOLS      += py3-parso

ALL_TOOLS      += py3-pastel

ALL_TOOLS      += py3-pathlib2

ALL_TOOLS      += py3-pbr

ALL_TOOLS      += py3-pexpect

ALL_TOOLS      += py3-pickleshare

ALL_TOOLS      += py3-pillow

ALL_TOOLS      += py3-pip

ALL_TOOLS      += py3-pkgconfig

ALL_TOOLS      += py3-pkginfo

ALL_TOOLS      += py3-plac

ALL_TOOLS      += py3-platformdirs

ALL_TOOLS      += py3-pluggy

ALL_TOOLS      += py3-ply

ALL_TOOLS      += py3-poetry-core

ALL_TOOLS      += py3-poetry

ALL_TOOLS      += py3-prettytable

ALL_TOOLS      += py3-prometheus-client

ALL_TOOLS      += py3-prompt_toolkit

ALL_TOOLS      += py3-protobuf

ALL_TOOLS      += py3-prwlock

ALL_TOOLS      += py3-psutil

ALL_TOOLS      += py3-ptyprocess

ALL_TOOLS      += py3-py

ALL_TOOLS      += py3-pyasn1-modules

ALL_TOOLS      += py3-pyasn1

ALL_TOOLS      += py3-pybind11
py3-pybind11_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/py3-pybind11/2.7.1-59ab2349ababbdc8fa342a6ed28ceab5/lib/python3.9/site-packages/pybind11/include

ALL_TOOLS      += py3-pycodestyle

ALL_TOOLS      += py3-pycparser

ALL_TOOLS      += py3-pycuda

ALL_TOOLS      += py3-pycurl

ALL_TOOLS      += py3-pydantic

ALL_TOOLS      += py3-pydot

ALL_TOOLS      += py3-pyflakes

ALL_TOOLS      += py3-pygithub

ALL_TOOLS      += py3-pygments

ALL_TOOLS      += py3-pyjwt

ALL_TOOLS      += py3-pylev

ALL_TOOLS      += py3-pylint

ALL_TOOLS      += py3-pynacl

ALL_TOOLS      += py3-pyparsing

ALL_TOOLS      += py3-pyrsistent

ALL_TOOLS      += py3-pysocks

ALL_TOOLS      += py3-pysqlite3

ALL_TOOLS      += py3-pytest-cov

ALL_TOOLS      += py3-pytest-runner

ALL_TOOLS      += py3-pytest

ALL_TOOLS      += py3-python-daemon

ALL_TOOLS      += py3-python-dateutil

ALL_TOOLS      += py3-python-ldap

ALL_TOOLS      += py3-python-rapidjson

ALL_TOOLS      += py3-pythran

ALL_TOOLS      += py3-pytoml

ALL_TOOLS      += py3-pytools

ALL_TOOLS      += py3-pytz

ALL_TOOLS      += py3-pyyaml

ALL_TOOLS      += py3-pyzmq

ALL_TOOLS      += py3-repoze-lru

ALL_TOOLS      += py3-requests-oauthlib

ALL_TOOLS      += py3-requests-toolbelt

ALL_TOOLS      += py3-requests

ALL_TOOLS      += py3-rich

ALL_TOOLS      += py3-rsa

ALL_TOOLS      += py3-scandir

ALL_TOOLS      += py3-schema

ALL_TOOLS      += py3-scikit-learn

ALL_TOOLS      += py3-scinum

ALL_TOOLS      += py3-scipy

ALL_TOOLS      += py3-seaborn

ALL_TOOLS      += py3-secretstorage

ALL_TOOLS      += py3-semantic-version

ALL_TOOLS      += py3-send2trash

ALL_TOOLS      += py3-setuptools-rust

ALL_TOOLS      += py3-setuptools-scm

ALL_TOOLS      += py3-setuptools

ALL_TOOLS      += py3-shellingham

ALL_TOOLS      += py3-simplegeneric

ALL_TOOLS      += py3-singledispatch

ALL_TOOLS      += py3-six

ALL_TOOLS      += py3-skl2onnx

ALL_TOOLS      += py3-smmap

ALL_TOOLS      += py3-sniffio

ALL_TOOLS      += py3-soupsieve

ALL_TOOLS      += py3-sqlalchemy

ALL_TOOLS      += py3-stevedore

ALL_TOOLS      += py3-subprocess32

ALL_TOOLS      += py3-sympy

ALL_TOOLS      += py3-tables

ALL_TOOLS      += py3-tenacity

ALL_TOOLS      += py3-tensorboard-data-server

ALL_TOOLS      += py3-tensorboard-plugin-wit

ALL_TOOLS      += py3-tensorboard

ALL_TOOLS      += py3-tensorflow-estimator

ALL_TOOLS      += py3-tensorflow

ALL_TOOLS      += py3-termcolor

ALL_TOOLS      += py3-terminado

ALL_TOOLS      += py3-testpath

ALL_TOOLS      += py3-theano

ALL_TOOLS      += py3-threadpoolctl

ALL_TOOLS      += py3-toml

ALL_TOOLS      += py3-tomli

ALL_TOOLS      += py3-tomlkit

ALL_TOOLS      += py3-tornado

ALL_TOOLS      += py3-tqdm

ALL_TOOLS      += py3-traitlets

ALL_TOOLS      += py3-typed-ast

ALL_TOOLS      += py3-typing-extensions

ALL_TOOLS      += py3-uhi

ALL_TOOLS      += py3-uncertainties

ALL_TOOLS      += py3-uproot

ALL_TOOLS      += py3-urllib3

ALL_TOOLS      += py3-vector

ALL_TOOLS      += py3-virtualenv-clone

ALL_TOOLS      += py3-virtualenv

ALL_TOOLS      += py3-virtualenvwrapper

ALL_TOOLS      += py3-wcwidth

ALL_TOOLS      += py3-webencodings

ALL_TOOLS      += py3-werkzeug

ALL_TOOLS      += py3-wheel

ALL_TOOLS      += py3-widgetsnbextension

ALL_TOOLS      += py3-wrapt

ALL_TOOLS      += py3-xgboost

ALL_TOOLS      += py3-zipp

ALL_TOOLS      += pyclang

ALL_TOOLS      += pydata
pydata_EX_FLAGS_LDFLAGS  := $(PYDATA_BASE)/lib/pydata.o
pydata_EX_FLAGS_NO_RECURSIVE_EXPORT  := 1

ALL_TOOLS      += pyquen
pyquen_EX_LIB := pyquen
pyquen_EX_USE := pythia6 lhapdf

ALL_TOOLS      += pythia6
pythia6_EX_LIB := pythia6 pythia6_dummy pythia6_pdfdummy
pythia6_EX_USE := pythia6_headers f77compiler

ALL_TOOLS      += pythia6_headers
pythia6_headers_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pythia6/426-604d92e9b51dd03325fbd342698d85b2/include
pythia6_headers_EX_USE := root_cxxdefaults

ALL_TOOLS      += pythia8
pythia8_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pythia8/306-13f42b55571109ff485b3fe82c2638b8/include
pythia8_EX_LIB := pythia8
pythia8_EX_USE := root_cxxdefaults cxxcompiler hepmc3 hepmc lhapdf
pythia8_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += python-paths

ALL_TOOLS      += python3
python3_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/python3/3.9.6-67e5cf5b4952101922f1d4c8474baa39/include/python3.9
python3_EX_LIB := python3.9
python3_EX_USE := sockets

ALL_TOOLS      += python_tools

ALL_TOOLS      += qd
qd_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/qd/2.3.13-8f6f1bb4da96a4cf4b4bf7f79cfac225/include
qd_EX_LIB := qdmod qd

ALL_TOOLS      += qd_f_main
qd_f_main_EX_LIB := qd_f_main
qd_f_main_EX_USE := qd

ALL_TOOLS      += rdma-core
rdma-core_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rdma-core/39.1-9ec71a454e4029a35fd314285e6e3103/include

ALL_TOOLS      += rivet
rivet_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rivet/3.1.6-9dcebff19409ad8d5ff6552b62bd912e/include
rivet_EX_LIB := Rivet
rivet_EX_USE := hepmc fastjet fastjet-contrib gsl yoda

ALL_TOOLS      += rocm-rocrand
rocm-rocrand_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/include/hiprand /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/include/rocrand
rocm-rocrand_EX_LIB := hiprand rocrand
rocm-rocrand_EX_USE := rocm

ALL_TOOLS      += rocm
rocm_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/include /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/hip/include /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/rocm/5.0.2-95c215630c939706b0552e3eee38861c/hsa/include
rocm_EX_LIB := amdhip64
rocm_EX_FLAGS_ROCM_FLAGS  := -fno-gpu-rdc --amdgpu-target=gfx900 --target=$(COMPILER_HOST) --gcc-toolchain=$(COMPILER_PATH) -D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__
rocm_EX_FLAGS_ROCM_HOST_CXXFLAGS  := -D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__
rocm_EX_FLAGS_ROCM_HOST_REM_CXXFLAGS  := -Wno-non-template-friend -Werror=format-contains-nul -Werror=maybe-uninitialized -Werror=unused-but-set-variable -Werror=return-local-addr -fipa-pta -frounding-math -mrecip -fno-crossjumping -fno-aggressive-loop-optimizations -funroll-all-loops

ALL_TOOLS      += roofit
roofit_EX_LIB := RooFit
roofit_EX_USE := roofitcore rootcore rootmath roothistmatrix

ALL_TOOLS      += roofitcore
roofitcore_EX_LIB := RooFitCore
roofitcore_EX_USE := rootcore roothistmatrix rootgpad rootminuit root_cxxdefaults

ALL_TOOLS      += roostats
roostats_EX_LIB := RooStats
roostats_EX_USE := roofitcore roofit rootcore roothistmatrix rootgpad

ALL_TOOLS      += root
root_EX_USE := rootphysics
root_EX_FLAGS_CXXMODULES  := 0
root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS  := --fail_on_warnings

ALL_TOOLS      += root_cxxdefaults

ALL_TOOLS      += root_interface
root_interface_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/lcg/root/6.24.07-a31cbfc28a0c92b3c007615905b5b9b2/include
root_interface_EX_USE := root_cxxdefaults
root_interface_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += rootcling
rootcling_EX_LIB := Core
rootcling_EX_USE := root_interface sockets pcre zlib xz
TOOLS_OVERRIDABLE_FLAGS  +=ROOTCLING_ARGS

ALL_TOOLS      += rootcore
rootcore_EX_LIB := Tree Net
rootcore_EX_USE := rootmathcore rootthread

ALL_TOOLS      += rootdataframe
rootdataframe_EX_LIB := ROOTDataFrame
rootdataframe_EX_USE := rootcore rootgraphics roothistmatrix rootrio rootvecops

ALL_TOOLS      += rooteg
rooteg_EX_LIB := EG
rooteg_EX_USE := rootgraphics

ALL_TOOLS      += rooteve
rooteve_EX_LIB := Eve
rooteve_EX_USE := rootgeompainter rootrgl rootged

ALL_TOOLS      += rootfoam
rootfoam_EX_LIB := Foam
rootfoam_EX_USE := roothistmatrix

ALL_TOOLS      += rootged
rootged_EX_LIB := Ged
rootged_EX_USE := rootgui

ALL_TOOLS      += rootgeom
rootgeom_EX_LIB := Geom
rootgeom_EX_USE := rootrio rootmathcore

ALL_TOOLS      += rootgeompainter
rootgeompainter_EX_LIB := GeomPainter
rootgeompainter_EX_USE := rootgeom rootgraphics

ALL_TOOLS      += rootglew
rootglew_EX_LIB := GLEW

ALL_TOOLS      += rootgpad
rootgpad_EX_LIB := Gpad Graf
rootgpad_EX_USE := roothistmatrix

ALL_TOOLS      += rootgraphics
rootgraphics_EX_LIB := TreePlayer Graf3d Postscript
rootgraphics_EX_USE := rootgpad

ALL_TOOLS      += rootgui
rootgui_EX_LIB := Gui
rootgui_EX_USE := rootgpad

ALL_TOOLS      += rootguihtml
rootguihtml_EX_LIB := GuiHtml
rootguihtml_EX_USE := rootgui rootinteractive

ALL_TOOLS      += roothistmatrix
roothistmatrix_EX_LIB := Hist Matrix
roothistmatrix_EX_USE := rootcore

ALL_TOOLS      += roothistpainter
roothistpainter_EX_LIB := HistPainter
roothistpainter_EX_USE := roothistmatrix rootgpad rootimt

ALL_TOOLS      += roothtml
roothtml_EX_LIB := Html
roothtml_EX_USE := rootgpad

ALL_TOOLS      += rootimt
rootimt_EX_LIB := Imt
rootimt_EX_USE := rootthread tbb

ALL_TOOLS      += rootinteractive
rootinteractive_EX_LIB := Gui
rootinteractive_EX_USE := libjpeg-turbo libpng rootgpad rootrint

ALL_TOOLS      += rootmath
rootmath_EX_LIB := GenVector MathMore
rootmath_EX_USE := rootcore gsl

ALL_TOOLS      += rootmathcore
rootmathcore_EX_LIB := MathCore
rootmathcore_EX_USE := rootcling

ALL_TOOLS      += rootminuit
rootminuit_EX_LIB := Minuit
rootminuit_EX_USE := rootgpad

ALL_TOOLS      += rootminuit2
rootminuit2_EX_LIB := Minuit2
rootminuit2_EX_USE := rootgpad

ALL_TOOLS      += rootmlp
rootmlp_EX_LIB := MLP
rootmlp_EX_USE := rootgraphics

ALL_TOOLS      += rootntuple
rootntuple_EX_LIB := ROOTNTuple
rootntuple_EX_USE := rootvecops rootthread

ALL_TOOLS      += rootphysics
rootphysics_EX_LIB := Physics
rootphysics_EX_USE := roothistmatrix

ALL_TOOLS      += rootpy
rootpy_EX_USE := rootgraphics

ALL_TOOLS      += rootpymva
rootpymva_EX_LIB := PyMVA
rootpymva_EX_USE := roottmva numpy-c-api

ALL_TOOLS      += rootrflx
rootrflx_EX_USE := root_interface rootcling
rootrflx_EX_FLAGS_GENREFLEX_CPPFLAGS  := -DCMS_DICT_IMPL -D_REENTRANT -DGNUSOURCE -D__STRICT_ANSI__
rootrflx_EX_FLAGS_GENREFLEX_GCCXMLOPT  := -m64
TOOLS_OVERRIDABLE_FLAGS  +=GENREFLEX_CPPFLAGS

ALL_TOOLS      += rootrgl
rootrgl_EX_LIB := RGL
rootrgl_EX_USE := rootglew rootgui rootinteractive rootgraphics

ALL_TOOLS      += rootrint
rootrint_EX_LIB := Rint
rootrint_EX_USE := rootcling

ALL_TOOLS      += rootrio
rootrio_EX_LIB := RIO
rootrio_EX_USE := rootcling

ALL_TOOLS      += rootsmatrix
rootsmatrix_EX_LIB := Smatrix
rootsmatrix_EX_USE := rootcling

ALL_TOOLS      += rootspectrum
rootspectrum_EX_LIB := Spectrum
rootspectrum_EX_USE := roothistmatrix

ALL_TOOLS      += rootthread
rootthread_EX_LIB := Thread
rootthread_EX_USE := rootrio

ALL_TOOLS      += roottmva
roottmva_EX_LIB := TMVA
roottmva_EX_USE := rootmlp rootminuit

ALL_TOOLS      += rootvecops
rootvecops_EX_LIB := ROOTVecOps
rootvecops_EX_USE := rootcore

ALL_TOOLS      += rootx11
rootx11_EX_LIB := GX11
rootx11_EX_USE := rootcling

ALL_TOOLS      += rootxml
rootxml_EX_LIB := XMLParser
rootxml_EX_USE := rootcore libxml2

ALL_TOOLS      += rootxmlio
rootxmlio_EX_LIB := XMLIO
rootxmlio_EX_USE := rootrio

ALL_TOOLS      += scitokens-cpp
scitokens-cpp_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/scitokens-cpp/0.7.0-652b557d24b1c5b9c5497cec97566cfe/include
scitokens-cpp_EX_LIB := SciTokens
scitokens-cpp_EX_USE := sqlite libuuid curl

ALL_TOOLS      += self
self_EX_INCLUDE := /work/submit/nswood/HGCAL/models/CMSSW_12_5_2_patch1/src /work/submit/nswood/HGCAL/models/CMSSW_12_5_2_patch1/include/slc7_amd64_gcc10/src /work/submit/nswood/HGCAL/models/CMSSW_12_5_2_patch1/include/LCG /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw-patch/CMSSW_12_5_2_patch1/src
self_EX_LIBDIR := /work/submit/nswood/HGCAL/models/CMSSW_12_5_2_patch1/biglib/slc7_amd64_gcc10 /work/submit/nswood/HGCAL/models/CMSSW_12_5_2_patch1/lib/slc7_amd64_gcc10 /work/submit/nswood/HGCAL/models/CMSSW_12_5_2_patch1/external/slc7_amd64_gcc10/lib /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw-patch/CMSSW_12_5_2_patch1/biglib/slc7_amd64_gcc10 /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw-patch/CMSSW_12_5_2_patch1/lib/slc7_amd64_gcc10 /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw-patch/CMSSW_12_5_2_patch1/external/slc7_amd64_gcc10/lib
self_EX_LIBDIR += \$(cmssw_EX_LIBDIR)
self_EX_FLAGS_ALPAKA_BACKENDS  := cuda serial
self_EX_FLAGS_CHECK_PRIVATE_HEADERS  := 1
self_EX_FLAGS_CODE_CHECK_ALPAKA_BACKEND  := serial
self_EX_FLAGS_DEFAULT_COMPILER  := gcc
self_EX_FLAGS_EXTERNAL_SYMLINK  := PATH LIBDIR CMSSW_SEARCH_PATH
self_EX_FLAGS_LLVM_ANALYZER  := llvm-analyzer
self_EX_FLAGS_NO_EXTERNAL_RUNTIME  := LD_LIBRARY_PATH PATH CMSSW_SEARCH_PATH
TOOLS_OVERRIDABLE_FLAGS  +=CPPDEFINES CXXFLAGS FFLAGS CFLAGS CPPFLAGS LDFLAGS CUDA_FLAGS CUDA_LDFLAGS LTO_FLAGS
self_EX_FLAGS_SCRAM_TARGETS  := haswell sandybridge nehalem
self_EX_FLAGS_SKIP_TOOLS_SYMLINK  := cxxcompiler ccompiler f77compiler gcc-cxxcompiler gcc-ccompiler gcc-f77compiler llvm-cxxcompiler llvm-ccompiler llvm-f77compiler llvm-analyzer-cxxcompiler llvm-analyzer-ccompiler icc-cxxcompiler icc-ccompiler icc-f77compiler x11 dpm
self_EX_FLAGS_SYMLINK_DEPTH_CMSSW_SEARCH_PATH  := 2
self_ORDER := 20000
IS_PATCH:=yes

ALL_TOOLS      += sherpa
sherpa_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/sherpa/2.2.12-3f653388937e14a41d7320ae26c92dc4/include/SHERPA-MC
sherpa_EX_LIB := SherpaMain ToolsMath ToolsOrg
sherpa_EX_USE := root_cxxdefaults hepmc lhapdf qd blackhat fastjet sqlite openmpi openloops

ALL_TOOLS      += sigcpp
sigcpp_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/sigcpp/3.2.0-03a2cb8734109cfe0079af5f112cd182/include/sigc++-3.0
sigcpp_EX_LIB := sigc-3.0
sigcpp_EX_USE := root_cxxdefaults

ALL_TOOLS      += sloccount

ALL_TOOLS      += sockets
sockets_EX_LIB := crypt dl rt

ALL_TOOLS      += sqlite
sqlite_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/sqlite/3.36.0-cdaed8943a1c7d35c738a99ec764027b/include
sqlite_EX_LIB := sqlite3
sqlite_EX_USE := root_cxxdefaults

ALL_TOOLS      += starlight
starlight_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/starlight/r193-9ea7cad8f726988f0b3d71894f9923c3/include
starlight_EX_LIB := Starlib
starlight_EX_USE := root_cxxdefaults clhep

ALL_TOOLS      += stdcxx-fs
stdcxx-fs_EX_LIB := stdc++fs

ALL_TOOLS      += tauolapp
tauolapp_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tauolapp/1.1.8-f1c19a3456a7b59d47fb91c1cd3df31d/include
tauolapp_EX_LIB := TauolaCxxInterface TauolaFortran TauolaTauSpinner TauolaHepMC TauolaHEPEVT
tauolapp_EX_USE := root_cxxdefaults hepmc f77compiler pythia8 lhapdf

ALL_TOOLS      += tbb
tbb_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tbb/v2021.5.0-3cd580209e999b2fb4f8344347204353/include
tbb_EX_LIB := tbb
tbb_EX_USE := root_cxxdefaults
tbb_EX_FLAGS_CPPDEFINES  := -DTBB_USE_GLIBCXX_VERSION=100300 -DTBB_SUPPRESS_DEPRECATED_MESSAGES -DTBB_PREVIEW_RESUMABLE_TASKS=1 -DTBB_PREVIEW_TASK_GROUP_EXTENSIONS=1
tbb_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += tbbbind
tbbbind_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tbb/v2021.5.0-3cd580209e999b2fb4f8344347204353/include
tbbbind_EX_LIB := tbbbind_2_0
tbbbind_EX_USE := tbb
tbbbind_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += tcmalloc
tcmalloc_EX_LIB := tcmalloc

ALL_TOOLS      += tcmalloc_minimal
tcmalloc_minimal_EX_LIB := tcmalloc_minimal

ALL_TOOLS      += tensorflow-c
tensorflow-c_EX_LIB := tensorflow
tensorflow-c_EX_USE := tensorflow-framework eigen libpng sqlite

ALL_TOOLS      += tensorflow-cc
tensorflow-cc_EX_LIB := tensorflow_cc
tensorflow-cc_EX_USE := tensorflow-framework eigen libpng sqlite

ALL_TOOLS      += tensorflow-executable_run_options
tensorflow-executable_run_options_EX_LIB := executable_run_options
tensorflow-executable_run_options_EX_USE := tensorflow

ALL_TOOLS      += tensorflow-framework
tensorflow-framework_EX_LIB := tensorflow_framework
tensorflow-framework_EX_USE := tensorflow giflib zlib libjpeg-turbo protobuf

ALL_TOOLS      += tensorflow-runtime
tensorflow-runtime_EX_LIB := cpu_function_runtime
tensorflow-runtime_EX_USE := tensorflow

ALL_TOOLS      += tensorflow-tf2xla
tensorflow-tf2xla_EX_LIB := tf2xla
tensorflow-tf2xla_EX_USE := tensorflow

ALL_TOOLS      += tensorflow-xla_compiled_cpu_function
tensorflow-xla_compiled_cpu_function_EX_LIB := xla_compiled_cpu_function
tensorflow-xla_compiled_cpu_function_EX_USE := tensorflow

ALL_TOOLS      += tensorflow
tensorflow_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tensorflow/2.6.4-633cab38f0bb2cfaace6f4bcb610b26b/include
tensorflow_EX_FLAGS_SYSTEM_INCLUDE  := 1

ALL_TOOLS      += thepeg
thepeg_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/thepeg/2.2.2-96ed7878ac7b9ce7ea9617e32ba6947e/include
thepeg_EX_LIB := ThePEG LesHouches
thepeg_EX_USE := root_cxxdefaults lhapdf gsl

ALL_TOOLS      += tinyxml2
tinyxml2_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tinyxml2/6.2.0-b4ef6e4242045ed0c243ef457f5b32a5/include
tinyxml2_EX_LIB := tinyxml2

ALL_TOOLS      += tkonlinesw
tkonlinesw_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tkonlinesw/4.2.0-1_gcc7-cb90a72c6089c13ae64b1019d74b21b2/include
tkonlinesw_EX_LIB := ICUtils Fed9UUtils
tkonlinesw_EX_USE := root_cxxdefaults xerces-c
tkonlinesw_EX_FLAGS_CXXFLAGS  := -DCMS_TK_64BITS

ALL_TOOLS      += tkonlineswdb
tkonlineswdb_EX_LIB := DeviceDescriptions Fed9UDeviceFactory
tkonlineswdb_EX_USE := tkonlinesw oracle oracleocci

ALL_TOOLS      += triton-inference-client
triton-inference-client_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/triton-inference-client/2.11.0-55a93049d64c766c5f0f0712a2b408be/include
triton-inference-client_EX_LIB := grpcclient
triton-inference-client_EX_USE := protobuf grpc cuda

ALL_TOOLS      += ucx
ucx_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/ucx/1.12.1-6a374b41de78893f0d530807fba63d63/include
ucx_EX_LIB := ucp uct ucs ucm

ALL_TOOLS      += utm
utm_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/utm/utm_0.10.0-39fbbfac230a0016a21b9466a0c5b9a9/include
utm_EX_LIB := tmeventsetup tmtable tmxsd tmgrammar tmutil
utm_EX_USE := root_cxxdefaults

ALL_TOOLS      += valgrind
valgrind_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/valgrind/3.17.0-12ba960b086b024cce391ad228855798/include
valgrind_EX_USE := root_cxxdefaults

ALL_TOOLS      += vdt
vdt_EX_LIB := vdt
vdt_EX_USE := vdt_headers

ALL_TOOLS      += vdt_headers
vdt_headers_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/vdt/0.4.3-4cf643375686641d118ddf967ccfd199/include
vdt_headers_EX_USE := root_cxxdefaults

ALL_TOOLS      += vecgeom
vecgeom_EX_LIB := vecgeom
vecgeom_EX_USE := vecgeom_interface

ALL_TOOLS      += vecgeom_interface
vecgeom_interface_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/vecgeom/v1.1.17-7ce0f1b5045075193fd912aa24f47572/include /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/vecgeom/v1.1.17-7ce0f1b5045075193fd912aa24f47572/include/VecGeom
vecgeom_interface_EX_USE := root_cxxdefaults

ALL_TOOLS      += x11
x11_EX_USE := sockets

ALL_TOOLS      += xerces-c
xerces-c_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xerces-c/3.1.3-5b1e4ab8f5a2057565f3be0ae6a10b37/include
xerces-c_EX_LIB := xerces-c
xerces-c_EX_USE := root_cxxdefaults

ALL_TOOLS      += xgboost
xgboost_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xgboost/1.3.3-6b1fe94a5d757a4af82f4de80cd9027f/include
xgboost_EX_LIB := xgboost

ALL_TOOLS      += xpmem
xpmem_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xpmem/v2.6.3-20220308-f936f28cf318c3a0f2d34d60b504b901/include
xpmem_EX_LIB := xpmem

ALL_TOOLS      += xrdcl-record

ALL_TOOLS      += xrootd
xrootd_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xrootd/5.4.2-01e2f30cb29f5ae6cc44ce693b2a4809/include/xrootd /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xrootd/5.4.2-01e2f30cb29f5ae6cc44ce693b2a4809/include/xrootd/private
xrootd_EX_LIB := XrdUtils XrdCl
xrootd_EX_USE := root_cxxdefaults scitokens-cpp

ALL_TOOLS      += xtensor
xtensor_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xtensor/0.24.1-2942bdd5d692a2e63611a06339d1f049/include
xtensor_EX_USE := xtl

ALL_TOOLS      += xtl
xtl_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xtl/0.7.4-90d9b376619f060461c030d5c6723b8b/include

ALL_TOOLS      += xz
xz_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xz/5.2.5-d6fed2038c4e8d6e04531d1adba59f37/include
xz_EX_LIB := lzma
xz_EX_USE := root_cxxdefaults

ALL_TOOLS      += yoda
yoda_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/yoda/1.9.6-dd24b58f7800076b18ccf4d4e5e1b378/include
yoda_EX_LIB := YODA
yoda_EX_USE := root_cxxdefaults

ALL_TOOLS      += zlib
zlib_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/zlib/1.2.11-71514f01d2850dfd0bcd391557259a58/include
zlib_EX_LIB := z
zlib_EX_USE := root_cxxdefaults

ALL_TOOLS      += zstd
zstd_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/zstd/1.4.5-532bbea4f73669d8f80e2005b3a6e942/include
zstd_EX_LIB := zstd
zstd_EX_USE := root_cxxdefaults

