ifeq ($(strip $(L1TriggerL1CaloTriggerAuto)),)
L1TriggerL1CaloTriggerAuto := self/src/L1Trigger/L1CaloTrigger/plugins
PLUGINS:=yes
L1TriggerL1CaloTriggerAuto_files := $(patsubst src/L1Trigger/L1CaloTrigger/plugins/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1CaloTrigger/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerL1CaloTriggerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1CaloTrigger/plugins/BuildFile
L1TriggerL1CaloTriggerAuto_LOC_USE := self cmssw  FWCore/Framework Geometry/CaloGeometry Geometry/HcalTowerAlgo Geometry/EcalAlgo DataFormats/L1TCalorimeterPhase2 DataFormats/L1Trigger DataFormats/HcalDetId DataFormats/EcalDigi DataFormats/HcalDigi DataFormats/JetReco CalibFormats/CaloTPG L1Trigger/L1CaloTrigger DataFormats/L1THGCal L1Trigger/L1TCalorimeter FWCore/ParameterSet root boost 
L1TriggerL1CaloTriggerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1CaloTriggerAuto,L1TriggerL1CaloTriggerAuto,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1CaloTrigger/plugins))
L1TriggerL1CaloTriggerAuto_PACKAGE := self/src/L1Trigger/L1CaloTrigger/plugins
ALL_PRODS += L1TriggerL1CaloTriggerAuto
L1Trigger/L1CaloTrigger_forbigobj+=L1TriggerL1CaloTriggerAuto
L1TriggerL1CaloTriggerAuto_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1CaloTriggerAuto,src/L1Trigger/L1CaloTrigger/plugins,src_L1Trigger_L1CaloTrigger_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1CaloTriggerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1CaloTriggerAuto,src/L1Trigger/L1CaloTrigger/plugins))
endif
ALL_COMMONRULES += src_L1Trigger_L1CaloTrigger_plugins
src_L1Trigger_L1CaloTrigger_plugins_parent := L1Trigger/L1CaloTrigger
src_L1Trigger_L1CaloTrigger_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1CaloTrigger_plugins,src/L1Trigger/L1CaloTrigger/plugins,PLUGINS))
