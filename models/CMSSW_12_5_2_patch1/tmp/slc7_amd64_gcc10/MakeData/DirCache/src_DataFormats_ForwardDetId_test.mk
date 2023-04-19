ifeq ($(strip $(testHFNoseDetId)),)
testHFNoseDetId := self/src/DataFormats/ForwardDetId/test
testHFNoseDetId_files := $(patsubst src/DataFormats/ForwardDetId/test/%,%,$(foreach file,testHFNoseDetId.cc,$(eval xfile:=$(wildcard src/DataFormats/ForwardDetId/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/DataFormats/ForwardDetId/test/$(file). Please fix src/DataFormats/ForwardDetId/test/BuildFile.))))
testHFNoseDetId_TEST_RUNNER_CMD :=  testHFNoseDetId 
testHFNoseDetId_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/ForwardDetId/test/BuildFile
testHFNoseDetId_LOC_USE := self cmssw  DataFormats/ForwardDetId 
testHFNoseDetId_PACKAGE := self/src/DataFormats/ForwardDetId/test
ALL_PRODS += testHFNoseDetId
testHFNoseDetId_INIT_FUNC        += $$(eval $$(call Binary,testHFNoseDetId,src/DataFormats/ForwardDetId/test,src_DataFormats_ForwardDetId_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
testHFNoseDetId_CLASS := TEST
else
$(eval $(call MultipleWarningMsg,testHFNoseDetId,src/DataFormats/ForwardDetId/test))
endif
ifeq ($(strip $(testHGCDetId)),)
testHGCDetId := self/src/DataFormats/ForwardDetId/test
testHGCDetId_files := $(patsubst src/DataFormats/ForwardDetId/test/%,%,$(foreach file,testHGCDetId.cc,$(eval xfile:=$(wildcard src/DataFormats/ForwardDetId/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/DataFormats/ForwardDetId/test/$(file). Please fix src/DataFormats/ForwardDetId/test/BuildFile.))))
testHGCDetId_TEST_RUNNER_CMD :=  testHGCDetId 
testHGCDetId_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/ForwardDetId/test/BuildFile
testHGCDetId_LOC_USE := self cmssw  DataFormats/ForwardDetId 
testHGCDetId_PACKAGE := self/src/DataFormats/ForwardDetId/test
ALL_PRODS += testHGCDetId
testHGCDetId_INIT_FUNC        += $$(eval $$(call Binary,testHGCDetId,src/DataFormats/ForwardDetId/test,src_DataFormats_ForwardDetId_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
testHGCDetId_CLASS := TEST
else
$(eval $(call MultipleWarningMsg,testHGCDetId,src/DataFormats/ForwardDetId/test))
endif
ALL_COMMONRULES += src_DataFormats_ForwardDetId_test
src_DataFormats_ForwardDetId_test_parent := DataFormats/ForwardDetId
src_DataFormats_ForwardDetId_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DataFormats_ForwardDetId_test,src/DataFormats/ForwardDetId/test,TEST))
