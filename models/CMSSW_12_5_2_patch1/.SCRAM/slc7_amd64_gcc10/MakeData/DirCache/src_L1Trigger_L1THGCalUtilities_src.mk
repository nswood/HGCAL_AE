ifeq ($(strip $(L1Trigger/L1THGCalUtilities)),)
ALL_COMMONRULES += src_L1Trigger_L1THGCalUtilities_src
src_L1Trigger_L1THGCalUtilities_src_parent := L1Trigger/L1THGCalUtilities
src_L1Trigger_L1THGCalUtilities_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCalUtilities_src,src/L1Trigger/L1THGCalUtilities/src,LIBRARY))
L1TriggerL1THGCalUtilities := self/L1Trigger/L1THGCalUtilities
L1Trigger/L1THGCalUtilities := L1TriggerL1THGCalUtilities
L1TriggerL1THGCalUtilities_files := $(patsubst src/L1Trigger/L1THGCalUtilities/src/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1THGCalUtilities/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerL1THGCalUtilities_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCalUtilities/BuildFile
L1TriggerL1THGCalUtilities_LOC_USE := self cmssw  FWCore/Framework DataFormats/Common DataFormats/L1THGCal FWCore/ParameterSet FWCore/PluginManager SimDataFormats/CaloAnalysis 
L1TriggerL1THGCalUtilities_LCGDICTS  := x 
L1TriggerL1THGCalUtilities_PRE_INIT_FUNC += $$(eval $$(call LCGDict,L1TriggerL1THGCalUtilities,src/L1Trigger/L1THGCalUtilities/src/classes.h,src/L1Trigger/L1THGCalUtilities/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) $(root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS)))
L1TriggerL1THGCalUtilities_EX_LIB   := L1TriggerL1THGCalUtilities
L1TriggerL1THGCalUtilities_EX_USE   := $(foreach d,$(L1TriggerL1THGCalUtilities_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1THGCalUtilities_PACKAGE := self/src/L1Trigger/L1THGCalUtilities/src
ALL_PRODS += L1TriggerL1THGCalUtilities
L1TriggerL1THGCalUtilities_CLASS := LIBRARY
L1Trigger/L1THGCalUtilities_forbigobj+=L1TriggerL1THGCalUtilities
L1TriggerL1THGCalUtilities_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalUtilities,src/L1Trigger/L1THGCalUtilities/src,src_L1Trigger_L1THGCalUtilities_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
