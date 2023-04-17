ifeq ($(strip $(L1Trigger/L1CaloTrigger)),)
ALL_COMMONRULES += src_L1Trigger_L1CaloTrigger_src
src_L1Trigger_L1CaloTrigger_src_parent := L1Trigger/L1CaloTrigger
src_L1Trigger_L1CaloTrigger_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_L1Trigger_L1CaloTrigger_src,src/L1Trigger/L1CaloTrigger/src,LIBRARY))
L1TriggerL1CaloTrigger := self/L1Trigger/L1CaloTrigger
L1Trigger/L1CaloTrigger := L1TriggerL1CaloTrigger
L1TriggerL1CaloTrigger_files := $(patsubst src/L1Trigger/L1CaloTrigger/src/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1CaloTrigger/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerL1CaloTrigger_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1CaloTrigger/BuildFile
L1TriggerL1CaloTrigger_LOC_USE := self cmssw  FWCore/ParameterSet clhep 
L1TriggerL1CaloTrigger_EX_LIB   := L1TriggerL1CaloTrigger
L1TriggerL1CaloTrigger_EX_USE   := $(foreach d,$(L1TriggerL1CaloTrigger_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1CaloTrigger_PACKAGE := self/src/L1Trigger/L1CaloTrigger/src
ALL_PRODS += L1TriggerL1CaloTrigger
L1TriggerL1CaloTrigger_CLASS := LIBRARY
L1Trigger/L1CaloTrigger_forbigobj+=L1TriggerL1CaloTrigger
L1TriggerL1CaloTrigger_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1CaloTrigger,src/L1Trigger/L1CaloTrigger/src,src_L1Trigger_L1CaloTrigger_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
