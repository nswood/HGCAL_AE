ifeq ($(strip $(L1TriggerL1THGCalUtilitiesPlugins_calotruth)),)
L1TriggerL1THGCalUtilitiesPlugins_calotruth := self/src/L1Trigger/L1THGCalUtilities/plugins
PLUGINS:=yes
L1TriggerL1THGCalUtilitiesPlugins_calotruth_files := $(patsubst src/L1Trigger/L1THGCalUtilities/plugins/%,%,$(foreach file,CaloTruthCellsProducer.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCalUtilities/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCalUtilities/plugins/$(file). Please fix src/L1Trigger/L1THGCalUtilities/plugins/BuildFile.))))
L1TriggerL1THGCalUtilitiesPlugins_calotruth_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCalUtilities/plugins/BuildFile
L1TriggerL1THGCalUtilitiesPlugins_calotruth_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet Geometry/Records SimDataFormats/CaloAnalysis DataFormats/L1THGCal L1Trigger/L1THGCal 
L1TriggerL1THGCalUtilitiesPlugins_calotruth_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1THGCalUtilitiesPlugins_calotruth,L1TriggerL1THGCalUtilitiesPlugins_calotruth,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCalUtilities/plugins))
L1TriggerL1THGCalUtilitiesPlugins_calotruth_PACKAGE := self/src/L1Trigger/L1THGCalUtilities/plugins
ALL_PRODS += L1TriggerL1THGCalUtilitiesPlugins_calotruth
L1Trigger/L1THGCalUtilities_forbigobj+=L1TriggerL1THGCalUtilitiesPlugins_calotruth
L1TriggerL1THGCalUtilitiesPlugins_calotruth_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalUtilitiesPlugins_calotruth,src/L1Trigger/L1THGCalUtilities/plugins,src_L1Trigger_L1THGCalUtilities_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1THGCalUtilitiesPlugins_calotruth_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1THGCalUtilitiesPlugins_calotruth,src/L1Trigger/L1THGCalUtilities/plugins))
endif
ifeq ($(strip $(L1TriggerL1THGCalUtilitiesPlugins_selectors)),)
L1TriggerL1THGCalUtilitiesPlugins_selectors := self/src/L1Trigger/L1THGCalUtilities/plugins
PLUGINS:=yes
L1TriggerL1THGCalUtilitiesPlugins_selectors_files := $(patsubst src/L1Trigger/L1THGCalUtilities/plugins/%,%,$(foreach file,selectors/*.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCalUtilities/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCalUtilities/plugins/$(file). Please fix src/L1Trigger/L1THGCalUtilities/plugins/BuildFile.))))
L1TriggerL1THGCalUtilitiesPlugins_selectors_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCalUtilities/plugins/BuildFile
L1TriggerL1THGCalUtilitiesPlugins_selectors_LOC_USE := self cmssw  L1Trigger/L1THGCal CommonTools/Utils CommonTools/MVAUtils roottmva 
L1TriggerL1THGCalUtilitiesPlugins_selectors_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1THGCalUtilitiesPlugins_selectors,L1TriggerL1THGCalUtilitiesPlugins_selectors,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCalUtilities/plugins))
L1TriggerL1THGCalUtilitiesPlugins_selectors_PACKAGE := self/src/L1Trigger/L1THGCalUtilities/plugins
ALL_PRODS += L1TriggerL1THGCalUtilitiesPlugins_selectors
L1Trigger/L1THGCalUtilities_forbigobj+=L1TriggerL1THGCalUtilitiesPlugins_selectors
L1TriggerL1THGCalUtilitiesPlugins_selectors_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalUtilitiesPlugins_selectors,src/L1Trigger/L1THGCalUtilities/plugins,src_L1Trigger_L1THGCalUtilities_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1THGCalUtilitiesPlugins_selectors_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1THGCalUtilitiesPlugins_selectors,src/L1Trigger/L1THGCalUtilities/plugins))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCalUtilities_plugins
src_L1Trigger_L1THGCalUtilities_plugins_parent := L1Trigger/L1THGCalUtilities
src_L1Trigger_L1THGCalUtilities_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCalUtilities_plugins,src/L1Trigger/L1THGCalUtilities/plugins,PLUGINS))
