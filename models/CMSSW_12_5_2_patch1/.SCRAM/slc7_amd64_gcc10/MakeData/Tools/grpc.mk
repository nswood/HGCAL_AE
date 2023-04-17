ALL_TOOLS      += grpc
grpc_EX_INCLUDE := /cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/grpc/1.35.0-e8d844b8ad89adfb9f0f63ee46ef05d0/include
grpc_EX_LIB := grpc grpc++ grpc++_reflection
grpc_EX_USE := protobuf openssl pcre abseil-cpp c-ares
grpc_EX_FLAGS_SYSTEM_INCLUDE  := 1

