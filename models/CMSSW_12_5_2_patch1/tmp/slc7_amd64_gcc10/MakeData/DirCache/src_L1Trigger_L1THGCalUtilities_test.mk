ifeq ($(strip $(L1TriggerL1THGCalUtilitiesTest_ntuples)),)
L1TriggerL1THGCalUtilitiesTest_ntuples := self/src/L1Trigger/L1THGCalUtilities/test
L1TriggerL1THGCalUtilitiesTest_ntuples_files := $(patsubst src/L1Trigger/L1THGCalUtilities/test/%,%,$(foreach file,ntuples/*.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCalUtilities/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCalUtilities/test/$(file). Please fix src/L1Trigger/L1THGCalUtilities/test/BuildFile.))))
L1TriggerL1THGCalUtilitiesTest_ntuples_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCalUtilities/test/BuildFile
L1TriggerL1THGCalUtilitiesTest_ntuples_LOC_USE := self cmssw  L1Trigger/L1THGCal L1Trigger/L1THGCalUtilities CommonTools/UtilAlgos SimDataFormats/CaloTest DataFormats/JetReco SimDataFormats/PileupSummaryInfo SimDataFormats/GeneratorProducts TrackPropagation/RungeKutta FastSimulation/Event MagneticField/Engine MagneticField/Records heppdt 
L1TriggerL1THGCalUtilitiesTest_ntuples_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1THGCalUtilitiesTest_ntuples,L1TriggerL1THGCalUtilitiesTest_ntuples,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCalUtilities/test))
L1TriggerL1THGCalUtilitiesTest_ntuples_PACKAGE := self/src/L1Trigger/L1THGCalUtilities/test
ALL_PRODS += L1TriggerL1THGCalUtilitiesTest_ntuples
L1TriggerL1THGCalUtilitiesTest_ntuples_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalUtilitiesTest_ntuples,src/L1Trigger/L1THGCalUtilities/test,src_L1Trigger_L1THGCalUtilities_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1THGCalUtilitiesTest_ntuples_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1THGCalUtilitiesTest_ntuples,src/L1Trigger/L1THGCalUtilities/test))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCalUtilities_test
src_L1Trigger_L1THGCalUtilities_test_parent := L1Trigger/L1THGCalUtilities
src_L1Trigger_L1THGCalUtilities_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCalUtilities_test,src/L1Trigger/L1THGCalUtilities/test,TEST))
