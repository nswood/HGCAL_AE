ifeq ($(strip $(ValidationHGCalValidationAuto)),)
ValidationHGCalValidationAuto := self/src/Validation/HGCalValidation/plugins
PLUGINS:=yes
ValidationHGCalValidationAuto_files := $(patsubst src/Validation/HGCalValidation/plugins/%,%,$(wildcard $(foreach dir,src/Validation/HGCalValidation/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ValidationHGCalValidationAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/Validation/HGCalValidation/plugins/BuildFile
ValidationHGCalValidationAuto_LOC_USE := self cmssw  DataFormats/ForwardDetId DataFormats/HcalDetId DataFormats/ParticleFlowCandidate DataFormats/Common DataFormats/L1THGCal DetectorDescription/Core DetectorDescription/DDCMS DQMServices/Core FWCore/Common FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities Geometry/HGCalCommonData Geometry/HGCalGeometry Geometry/Records L1Trigger/L1THGCal SimDataFormats/CaloHit SimDataFormats/CaloTest SimDataFormats/CaloAnalysis SimDataFormats/GeneratorProducts SimDataFormats/Track SimDataFormats/ValidationFormats SimG4Core/Notification SimG4Core/Watcher SimG4CMS/Calo RecoLocalCalo/HGCalRecAlgos Validation/HGCalValidation geant4core dd4hep clhep hepmc cuda 
ValidationHGCalValidationAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,ValidationHGCalValidationAuto,ValidationHGCalValidationAuto,$(SCRAMSTORENAME_LIB),src/Validation/HGCalValidation/plugins))
ValidationHGCalValidationAuto_PACKAGE := self/src/Validation/HGCalValidation/plugins
ALL_PRODS += ValidationHGCalValidationAuto
Validation/HGCalValidation_forbigobj+=ValidationHGCalValidationAuto
ValidationHGCalValidationAuto_INIT_FUNC        += $$(eval $$(call Library,ValidationHGCalValidationAuto,src/Validation/HGCalValidation/plugins,src_Validation_HGCalValidation_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
ValidationHGCalValidationAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,ValidationHGCalValidationAuto,src/Validation/HGCalValidation/plugins))
endif
ALL_COMMONRULES += src_Validation_HGCalValidation_plugins
src_Validation_HGCalValidation_plugins_parent := Validation/HGCalValidation
src_Validation_HGCalValidation_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Validation_HGCalValidation_plugins,src/Validation/HGCalValidation/plugins,PLUGINS))
