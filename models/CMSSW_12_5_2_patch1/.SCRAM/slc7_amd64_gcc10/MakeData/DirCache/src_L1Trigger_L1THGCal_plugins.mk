ifeq ($(strip $(L1TriggerL1THGCalPlugins)),)
L1TriggerL1THGCalPlugins := self/src/L1Trigger/L1THGCal/plugins
PLUGINS:=yes
L1TriggerL1THGCalPlugins_files := $(patsubst src/L1Trigger/L1THGCal/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCal/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCal/plugins/$(file). Please fix src/L1Trigger/L1THGCal/plugins/BuildFile.))))
L1TriggerL1THGCalPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCal/plugins/BuildFile
L1TriggerL1THGCalPlugins_LOC_USE := self cmssw  L1Trigger/L1THGCal Geometry/Records 
L1TriggerL1THGCalPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1THGCalPlugins,L1TriggerL1THGCalPlugins,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCal/plugins))
L1TriggerL1THGCalPlugins_PACKAGE := self/src/L1Trigger/L1THGCal/plugins
ALL_PRODS += L1TriggerL1THGCalPlugins
L1Trigger/L1THGCal_forbigobj+=L1TriggerL1THGCalPlugins
L1TriggerL1THGCalPlugins_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalPlugins,src/L1Trigger/L1THGCal/plugins,src_L1Trigger_L1THGCal_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1THGCalPlugins_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1THGCalPlugins,src/L1Trigger/L1THGCal/plugins))
endif
ifeq ($(strip $(L1TriggerL1THGCalPlugins_fe_be)),)
L1TriggerL1THGCalPlugins_fe_be := self/src/L1Trigger/L1THGCal/plugins
PLUGINS:=yes
L1TriggerL1THGCalPlugins_fe_be_files := $(patsubst src/L1Trigger/L1THGCal/plugins/%,%,$(foreach file,veryfrontend/*.cc concentrator/*.cc backend/*.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCal/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCal/plugins/$(file). Please fix src/L1Trigger/L1THGCal/plugins/BuildFile.))))
L1TriggerL1THGCalPlugins_fe_be_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCal/plugins/BuildFile
L1TriggerL1THGCalPlugins_fe_be_LOC_USE := self cmssw  CommonTools/MVAUtils Geometry/Records rootcore L1Trigger/L1THGCal DataFormats/L1THGCal 
L1TriggerL1THGCalPlugins_fe_be_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1THGCalPlugins_fe_be,L1TriggerL1THGCalPlugins_fe_be,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCal/plugins))
L1TriggerL1THGCalPlugins_fe_be_PACKAGE := self/src/L1Trigger/L1THGCal/plugins
ALL_PRODS += L1TriggerL1THGCalPlugins_fe_be
L1Trigger/L1THGCal_forbigobj+=L1TriggerL1THGCalPlugins_fe_be
L1TriggerL1THGCalPlugins_fe_be_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalPlugins_fe_be,src/L1Trigger/L1THGCal/plugins,src_L1Trigger_L1THGCal_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1THGCalPlugins_fe_be_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1THGCalPlugins_fe_be,src/L1Trigger/L1THGCal/plugins))
endif
ifeq ($(strip $(L1TriggerL1THGCalPlugins_geometries)),)
L1TriggerL1THGCalPlugins_geometries := self/src/L1Trigger/L1THGCal/plugins
PLUGINS:=yes
L1TriggerL1THGCalPlugins_geometries_files := $(patsubst src/L1Trigger/L1THGCal/plugins/%,%,$(foreach file,geometries/*.cc,$(eval xfile:=$(wildcard src/L1Trigger/L1THGCal/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/L1Trigger/L1THGCal/plugins/$(file). Please fix src/L1Trigger/L1THGCal/plugins/BuildFile.))))
L1TriggerL1THGCalPlugins_geometries_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCal/plugins/BuildFile
L1TriggerL1THGCalPlugins_geometries_LOC_USE := self cmssw  L1Trigger/L1THGCal tbb 
L1TriggerL1THGCalPlugins_geometries_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,L1TriggerL1THGCalPlugins_geometries,L1TriggerL1THGCalPlugins_geometries,$(SCRAMSTORENAME_LIB),src/L1Trigger/L1THGCal/plugins))
L1TriggerL1THGCalPlugins_geometries_PACKAGE := self/src/L1Trigger/L1THGCal/plugins
ALL_PRODS += L1TriggerL1THGCalPlugins_geometries
L1Trigger/L1THGCal_forbigobj+=L1TriggerL1THGCalPlugins_geometries
L1TriggerL1THGCalPlugins_geometries_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCalPlugins_geometries,src/L1Trigger/L1THGCal/plugins,src_L1Trigger_L1THGCal_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
L1TriggerL1THGCalPlugins_geometries_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,L1TriggerL1THGCalPlugins_geometries,src/L1Trigger/L1THGCal/plugins))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCal_plugins
src_L1Trigger_L1THGCal_plugins_parent := L1Trigger/L1THGCal
src_L1Trigger_L1THGCal_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCal_plugins,src/L1Trigger/L1THGCal/plugins,PLUGINS))
