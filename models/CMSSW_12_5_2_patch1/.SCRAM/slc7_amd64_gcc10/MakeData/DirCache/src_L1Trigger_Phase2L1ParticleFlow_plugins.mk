ifeq ($(strip $(L1TriggerPhase2L1ParticleFlowAuto)),)
L1TriggerPhase2L1ParticleFlowAuto := self/src/L1Trigger/Phase2L1ParticleFlow/plugins
PLUGINS:=yes
L1TriggerPhase2L1ParticleFlowAuto_files := $(patsubst src/L1Trigger/Phase2L1ParticleFlow/plugins/%,%,$(wildcard $(foreach dir,src/L1Trigger/Phase2L1ParticleFlow/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerPhase2L1ParticleFlowAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/Phase2L1ParticleFlow/plugins/BuildFile
L1TriggerPhase2L1ParticleFlowAuto_LOC_USE := self cmssw  CalibFormats/CaloTPG DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/JetReco FWCore/PluginManager L1Trigger/L1TCalorimeter L1Trigger/Phase2L1ParticleFlow MagneticField/Engine MagneticField/Records CommonTools/Utils CommonTools/UtilAlgos 
L1TriggerPhase2L1ParticleFlowAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerPhase2L1ParticleFlowAuto,L1TriggerPhase2L1ParticleFlowAuto,$(SCRAMSTORENAME_LIB),src/L1Trigger/Phase2L1ParticleFlow/plugins))
L1TriggerPhase2L1ParticleFlowAuto_PACKAGE := self/src/L1Trigger/Phase2L1ParticleFlow/plugins
ALL_PRODS += L1TriggerPhase2L1ParticleFlowAuto
L1Trigger/Phase2L1ParticleFlow_forbigobj+=L1TriggerPhase2L1ParticleFlowAuto
L1TriggerPhase2L1ParticleFlowAuto_INIT_FUNC        += $$(eval $$(call Library,L1TriggerPhase2L1ParticleFlowAuto,src/L1Trigger/Phase2L1ParticleFlow/plugins,src_L1Trigger_Phase2L1ParticleFlow_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerPhase2L1ParticleFlowAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerPhase2L1ParticleFlowAuto,src/L1Trigger/Phase2L1ParticleFlow/plugins))
endif
ALL_COMMONRULES += src_L1Trigger_Phase2L1ParticleFlow_plugins
src_L1Trigger_Phase2L1ParticleFlow_plugins_parent := L1Trigger/Phase2L1ParticleFlow
src_L1Trigger_Phase2L1ParticleFlow_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_Phase2L1ParticleFlow_plugins,src/L1Trigger/Phase2L1ParticleFlow/plugins,PLUGINS))
