ifeq ($(strip $(FireworksCaloPlugins)),)
FireworksCaloPlugins := self/src/Fireworks/Calo/plugins
PLUGINS:=yes
FireworksCaloPlugins_files := $(patsubst src/Fireworks/Calo/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/Fireworks/Calo/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/Fireworks/Calo/plugins/$(file). Please fix src/Fireworks/Calo/plugins/BuildFile.))))
FireworksCaloPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/Fireworks/Calo/plugins/BuildFile
FireworksCaloPlugins_LOC_USE := self cmssw  DataFormats/CaloRecHit DataFormats/CaloTowers DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/HcalRecHit DataFormats/JetReco DataFormats/L1Trigger DataFormats/L1THGCal DataFormats/METReco DataFormats/TauReco DataFormats/TrackReco DataFormats/HGCalReco Fireworks/Calo Fireworks/Core rootinteractive rooteve rootrgl rootgeom 
FireworksCaloPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,FireworksCaloPlugins,FireworksCaloPlugins,$(SCRAMSTORENAME_LIB),src/Fireworks/Calo/plugins))
FireworksCaloPlugins_PACKAGE := self/src/Fireworks/Calo/plugins
ALL_PRODS += FireworksCaloPlugins
Fireworks/Calo_forbigobj+=FireworksCaloPlugins
FireworksCaloPlugins_INIT_FUNC        += $$(eval $$(call Library,FireworksCaloPlugins,src/Fireworks/Calo/plugins,src_Fireworks_Calo_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
FireworksCaloPlugins_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,FireworksCaloPlugins,src/Fireworks/Calo/plugins))
endif
ALL_COMMONRULES += src_Fireworks_Calo_plugins
src_Fireworks_Calo_plugins_parent := Fireworks/Calo
src_Fireworks_Calo_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Fireworks_Calo_plugins,src/Fireworks/Calo/plugins,PLUGINS))
