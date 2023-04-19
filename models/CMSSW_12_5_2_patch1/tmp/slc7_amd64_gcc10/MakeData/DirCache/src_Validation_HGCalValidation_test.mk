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
