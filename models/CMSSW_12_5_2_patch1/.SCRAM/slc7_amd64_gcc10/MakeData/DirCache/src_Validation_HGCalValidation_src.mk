ifeq ($(strip $(Validation/HGCalValidation)),)
ALL_COMMONRULES += src_Validation_HGCalValidation_src
src_Validation_HGCalValidation_src_parent := Validation/HGCalValidation
src_Validation_HGCalValidation_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Validation_HGCalValidation_src,src/Validation/HGCalValidation/src,LIBRARY))
ValidationHGCalValidation := self/Validation/HGCalValidation
Validation/HGCalValidation := ValidationHGCalValidation
ValidationHGCalValidation_files := $(patsubst src/Validation/HGCalValidation/src/%,%,$(wildcard $(foreach dir,src/Validation/HGCalValidation/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
ValidationHGCalValidation_BuildFile    := $(WORKINGDIR)/cache/bf/src/Validation/HGCalValidation/BuildFile
ValidationHGCalValidation_LOC_USE := self cmssw  DataFormats/ForwardDetId DataFormats/HepMCCandidate DataFormats/ParticleFlowCandidate DQMServices/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger SimDataFormats/CaloAnalysis RecoLocalCalo/HGCalRecAlgos RecoLocalCalo/HGCalRecProducers geant4core clhep hepmc 
ValidationHGCalValidation_LCGDICTS  := x 
ValidationHGCalValidation_PRE_INIT_FUNC += $$(eval $$(call LCGDict,ValidationHGCalValidation,src/Validation/HGCalValidation/src/classes.h,src/Validation/HGCalValidation/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) $(root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS)))
ValidationHGCalValidation_EX_LIB   := ValidationHGCalValidation
ValidationHGCalValidation_EX_USE   := $(foreach d,$(ValidationHGCalValidation_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationHGCalValidation_PACKAGE := self/src/Validation/HGCalValidation/src
ALL_PRODS += ValidationHGCalValidation
ValidationHGCalValidation_CLASS := LIBRARY
Validation/HGCalValidation_forbigobj+=ValidationHGCalValidation
ValidationHGCalValidation_INIT_FUNC        += $$(eval $$(call Library,ValidationHGCalValidation,src/Validation/HGCalValidation/src,src_Validation_HGCalValidation_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
