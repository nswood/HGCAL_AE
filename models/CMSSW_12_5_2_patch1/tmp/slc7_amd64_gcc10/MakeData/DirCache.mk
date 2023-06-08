ALL_SUBSYSTEMS+=DQMOffline
subdirs_src_DQMOffline = src_DQMOffline_L1Trigger
subdirs_src += src_DQMOffline
ifeq ($(strip $(PyValidationHGCalValidation)),)
PyValidationHGCalValidation := self/src/Validation/HGCalValidation/python
src_Validation_HGCalValidation_python_parent := src/Validation/HGCalValidation
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Validation/HGCalValidation/python)
PyValidationHGCalValidation_files := $(patsubst src/Validation/HGCalValidation/python/%,%,$(wildcard $(foreach dir,src/Validation/HGCalValidation/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyValidationHGCalValidation_LOC_USE := self cmssw  
PyValidationHGCalValidation_PACKAGE := self/src/Validation/HGCalValidation/python
ALL_PRODS += PyValidationHGCalValidation
PyValidationHGCalValidation_INIT_FUNC        += $$(eval $$(call PythonProduct,PyValidationHGCalValidation,src/Validation/HGCalValidation/python,src_Validation_HGCalValidation_python))
else
$(eval $(call MultipleWarningMsg,PyValidationHGCalValidation,src/Validation/HGCalValidation/python))
endif
ALL_COMMONRULES += src_Validation_HGCalValidation_python
src_Validation_HGCalValidation_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Validation_HGCalValidation_python,src/Validation/HGCalValidation/python,PYTHON))
ifeq ($(strip $(PyL1TriggerL1THGCal)),)
PyL1TriggerL1THGCal := self/src/L1Trigger/L1THGCal/python
src_L1Trigger_L1THGCal_python_parent := src/L1Trigger/L1THGCal
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/L1THGCal/python)
PyL1TriggerL1THGCal_files := $(patsubst src/L1Trigger/L1THGCal/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1THGCal/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerL1THGCal_LOC_USE := self cmssw  
PyL1TriggerL1THGCal_PACKAGE := self/src/L1Trigger/L1THGCal/python
ALL_PRODS += PyL1TriggerL1THGCal
PyL1TriggerL1THGCal_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerL1THGCal,src/L1Trigger/L1THGCal/python,src_L1Trigger_L1THGCal_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerL1THGCal,src/L1Trigger/L1THGCal/python))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCal_python
src_L1Trigger_L1THGCal_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCal_python,src/L1Trigger/L1THGCal/python,PYTHON))
ALL_PACKAGES += L1Trigger/L1THGCalUtilities
subdirs_src_L1Trigger_L1THGCalUtilities := src_L1Trigger_L1THGCalUtilities_plugins src_L1Trigger_L1THGCalUtilities_python src_L1Trigger_L1THGCalUtilities_test src_L1Trigger_L1THGCalUtilities_src
ALL_PACKAGES += Fireworks/Calo
subdirs_src_Fireworks_Calo := src_Fireworks_Calo_plugins src_Fireworks_Calo_src
ALL_PACKAGES += L1Trigger/L1CaloTrigger
subdirs_src_L1Trigger_L1CaloTrigger := src_L1Trigger_L1CaloTrigger_plugins src_L1Trigger_L1CaloTrigger_python src_L1Trigger_L1CaloTrigger_test src_L1Trigger_L1CaloTrigger_src
ifeq ($(strip $(testValidationHGCalValidation)),)
testValidationHGCalValidation := self/src/Validation/HGCalValidation/test
testValidationHGCalValidation_files := $(patsubst src/Validation/HGCalValidation/test/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/Validation/HGCalValidation/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/Validation/HGCalValidation/test/$(file). Please fix src/Validation/HGCalValidation/test/BuildFile.))))
testValidationHGCalValidation_BuildFile    := $(WORKINGDIR)/cache/bf/src/Validation/HGCalValidation/test/BuildFile
testValidationHGCalValidation_LOC_USE := self cmssw  DataFormats/ForwardDetId FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger Geometry/HGCalCommonData Geometry/HGCalGeometry Geometry/Records SimDataFormats/CaloHit SimDataFormats/CaloTest SimG4CMS/Calo RecoLocalCalo/HGCalRecAlgos geant4core clhep hepmc 
testValidationHGCalValidation_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,testValidationHGCalValidation,testValidationHGCalValidation,$(SCRAMSTORENAME_LIB),src/Validation/HGCalValidation/test))
testValidationHGCalValidation_PACKAGE := self/src/Validation/HGCalValidation/test
ALL_PRODS += testValidationHGCalValidation
testValidationHGCalValidation_INIT_FUNC        += $$(eval $$(call Library,testValidationHGCalValidation,src/Validation/HGCalValidation/test,src_Validation_HGCalValidation_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
testValidationHGCalValidation_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,testValidationHGCalValidation,src/Validation/HGCalValidation/test))
endif
ALL_COMMONRULES += src_Validation_HGCalValidation_test
src_Validation_HGCalValidation_test_parent := Validation/HGCalValidation
src_Validation_HGCalValidation_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Validation_HGCalValidation_test,src/Validation/HGCalValidation/test,TEST))
ifeq ($(strip $(PyDQMOfflineL1Trigger)),)
PyDQMOfflineL1Trigger := self/src/DQMOffline/L1Trigger/python
src_DQMOffline_L1Trigger_python_parent := src/DQMOffline/L1Trigger
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/DQMOffline/L1Trigger/python)
PyDQMOfflineL1Trigger_files := $(patsubst src/DQMOffline/L1Trigger/python/%,%,$(wildcard $(foreach dir,src/DQMOffline/L1Trigger/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyDQMOfflineL1Trigger_LOC_USE := self cmssw  
PyDQMOfflineL1Trigger_PACKAGE := self/src/DQMOffline/L1Trigger/python
ALL_PRODS += PyDQMOfflineL1Trigger
PyDQMOfflineL1Trigger_INIT_FUNC        += $$(eval $$(call PythonProduct,PyDQMOfflineL1Trigger,src/DQMOffline/L1Trigger/python,src_DQMOffline_L1Trigger_python))
else
$(eval $(call MultipleWarningMsg,PyDQMOfflineL1Trigger,src/DQMOffline/L1Trigger/python))
endif
ALL_COMMONRULES += src_DQMOffline_L1Trigger_python
src_DQMOffline_L1Trigger_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DQMOffline_L1Trigger_python,src/DQMOffline/L1Trigger/python,PYTHON))
ALL_PACKAGES += L1Trigger/L1THGCal
subdirs_src_L1Trigger_L1THGCal := src_L1Trigger_L1THGCal_plugins src_L1Trigger_L1THGCal_python src_L1Trigger_L1THGCal_test src_L1Trigger_L1THGCal_src
ALL_SUBSYSTEMS+=DataFormats
subdirs_src_DataFormats = src_DataFormats_L1THGCal src_DataFormats_ForwardDetId
subdirs_src += src_DataFormats
ifeq ($(strip $(PyL1TriggerPhase2L1ParticleFlow)),)
PyL1TriggerPhase2L1ParticleFlow := self/src/L1Trigger/Phase2L1ParticleFlow/python
src_L1Trigger_Phase2L1ParticleFlow_python_parent := src/L1Trigger/Phase2L1ParticleFlow
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/Phase2L1ParticleFlow/python)
PyL1TriggerPhase2L1ParticleFlow_files := $(patsubst src/L1Trigger/Phase2L1ParticleFlow/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/Phase2L1ParticleFlow/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerPhase2L1ParticleFlow_LOC_USE := self cmssw  
PyL1TriggerPhase2L1ParticleFlow_PACKAGE := self/src/L1Trigger/Phase2L1ParticleFlow/python
ALL_PRODS += PyL1TriggerPhase2L1ParticleFlow
PyL1TriggerPhase2L1ParticleFlow_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerPhase2L1ParticleFlow,src/L1Trigger/Phase2L1ParticleFlow/python,src_L1Trigger_Phase2L1ParticleFlow_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerPhase2L1ParticleFlow,src/L1Trigger/Phase2L1ParticleFlow/python))
endif
ALL_COMMONRULES += src_L1Trigger_Phase2L1ParticleFlow_python
src_L1Trigger_Phase2L1ParticleFlow_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_Phase2L1ParticleFlow_python,src/L1Trigger/Phase2L1ParticleFlow/python,PYTHON))
ALL_PACKAGES += DataFormats/L1THGCal
subdirs_src_DataFormats_L1THGCal := src_DataFormats_L1THGCal_src
ALL_PACKAGES += DQMOffline/L1Trigger
subdirs_src_DQMOffline_L1Trigger := src_DQMOffline_L1Trigger_python src_DQMOffline_L1Trigger_test src_DQMOffline_L1Trigger_src
ifeq ($(strip $(PyL1TriggerL1THGCalUtilities)),)
PyL1TriggerL1THGCalUtilities := self/src/L1Trigger/L1THGCalUtilities/python
src_L1Trigger_L1THGCalUtilities_python_parent := src/L1Trigger/L1THGCalUtilities
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/L1THGCalUtilities/python)
PyL1TriggerL1THGCalUtilities_files := $(patsubst src/L1Trigger/L1THGCalUtilities/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1THGCalUtilities/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerL1THGCalUtilities_LOC_USE := self cmssw  
PyL1TriggerL1THGCalUtilities_PACKAGE := self/src/L1Trigger/L1THGCalUtilities/python
ALL_PRODS += PyL1TriggerL1THGCalUtilities
PyL1TriggerL1THGCalUtilities_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerL1THGCalUtilities,src/L1Trigger/L1THGCalUtilities/python,src_L1Trigger_L1THGCalUtilities_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerL1THGCalUtilities,src/L1Trigger/L1THGCalUtilities/python))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCalUtilities_python
src_L1Trigger_L1THGCalUtilities_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCalUtilities_python,src/L1Trigger/L1THGCalUtilities/python,PYTHON))
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
src_Validation_HGCalValidation_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/Validation/HGCalValidation/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_Validation_HGCalValidation_scripts,src/Validation/HGCalValidation/scripts,$(SCRAMSTORENAME_BIN),*))
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
ALL_SUBSYSTEMS+=L1Trigger
subdirs_src_L1Trigger = src_L1Trigger_L1THGCalUtilities src_L1Trigger_L1THGCal src_L1Trigger_L1CaloTrigger src_L1Trigger_Phase2L1ParticleFlow
subdirs_src += src_L1Trigger
ALL_PACKAGES += Validation/HGCalValidation
subdirs_src_Validation_HGCalValidation := src_Validation_HGCalValidation_scripts src_Validation_HGCalValidation_plugins src_Validation_HGCalValidation_python src_Validation_HGCalValidation_test src_Validation_HGCalValidation_src
ALL_SUBSYSTEMS+=Validation
subdirs_src_Validation = src_Validation_HGCalValidation
subdirs_src += src_Validation
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
ALL_PACKAGES += DataFormats/ForwardDetId
subdirs_src_DataFormats_ForwardDetId := src_DataFormats_ForwardDetId_test src_DataFormats_ForwardDetId_src
ifeq ($(strip $(PyL1TriggerL1CaloTrigger)),)
PyL1TriggerL1CaloTrigger := self/src/L1Trigger/L1CaloTrigger/python
src_L1Trigger_L1CaloTrigger_python_parent := src/L1Trigger/L1CaloTrigger
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/L1CaloTrigger/python)
PyL1TriggerL1CaloTrigger_files := $(patsubst src/L1Trigger/L1CaloTrigger/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1CaloTrigger/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerL1CaloTrigger_LOC_USE := self cmssw  
PyL1TriggerL1CaloTrigger_PACKAGE := self/src/L1Trigger/L1CaloTrigger/python
ALL_PRODS += PyL1TriggerL1CaloTrigger
PyL1TriggerL1CaloTrigger_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerL1CaloTrigger,src/L1Trigger/L1CaloTrigger/python,src_L1Trigger_L1CaloTrigger_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerL1CaloTrigger,src/L1Trigger/L1CaloTrigger/python))
endif
ALL_COMMONRULES += src_L1Trigger_L1CaloTrigger_python
src_L1Trigger_L1CaloTrigger_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1CaloTrigger_python,src/L1Trigger/L1CaloTrigger/python,PYTHON))
ALL_SUBSYSTEMS+=Fireworks
subdirs_src_Fireworks = src_Fireworks_Calo
subdirs_src += src_Fireworks
ALL_PACKAGES += L1Trigger/Phase2L1ParticleFlow
subdirs_src_L1Trigger_Phase2L1ParticleFlow := src_L1Trigger_Phase2L1ParticleFlow_plugins src_L1Trigger_Phase2L1ParticleFlow_python src_L1Trigger_Phase2L1ParticleFlow_test src_L1Trigger_Phase2L1ParticleFlow_src
