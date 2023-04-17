ifeq ($(strip $(testL1TriggerL1THGCal)),)
testL1TriggerL1THGCal := self/src/L1Trigger/L1THGCal/test
testL1TriggerL1THGCal_files := $(patsubst src/L1Trigger/L1THGCal/test/%,%,$(foreach file,HGCalTriggerGeomTesterV9Imp2.cc HGCalTriggerGeomTesterV9Imp3.cc HGCalBackendStage1ParameterExtractor.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCal/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCal/test/$(file). Please fix src/L1Trigger/L1THGCal/test/BuildFile.))))
testL1TriggerL1THGCal_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCal/test/BuildFile
testL1TriggerL1THGCal_LOC_USE := self cmssw  Geometry/HGCalGeometry L1Trigger/L1THGCal Geometry/Records CommonTools/UtilAlgos 
testL1TriggerL1THGCal_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,testL1TriggerL1THGCal,testL1TriggerL1THGCal,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCal/test))
testL1TriggerL1THGCal_PACKAGE := self/src/L1Trigger/L1THGCal/test
ALL_PRODS += testL1TriggerL1THGCal
testL1TriggerL1THGCal_INIT_FUNC        += $$(eval $$(call Library,testL1TriggerL1THGCal,src/L1Trigger/L1THGCal/test,src_L1Trigger_L1THGCal_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
testL1TriggerL1THGCal_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,testL1TriggerL1THGCal,src/L1Trigger/L1THGCal/test))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCal_test
src_L1Trigger_L1THGCal_test_parent := L1Trigger/L1THGCal
src_L1Trigger_L1THGCal_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCal_test,src/L1Trigger/L1THGCal/test,TEST))
