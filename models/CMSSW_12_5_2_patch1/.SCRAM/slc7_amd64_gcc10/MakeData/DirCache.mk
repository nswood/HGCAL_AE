ifeq ($(strip $(DataFormats/ForwardDetId)),)
ALL_COMMONRULES += src_DataFormats_ForwardDetId_src
src_DataFormats_ForwardDetId_src_parent := DataFormats/ForwardDetId
src_DataFormats_ForwardDetId_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_ForwardDetId_src,src/DataFormats/ForwardDetId/src,LIBRARY))
DataFormatsForwardDetId := self/DataFormats/ForwardDetId
DataFormats/ForwardDetId := DataFormatsForwardDetId
DataFormatsForwardDetId_files := $(patsubst src/DataFormats/ForwardDetId/src/%,%,$(wildcard $(foreach dir,src/DataFormats/ForwardDetId/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsForwardDetId_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/ForwardDetId/BuildFile
DataFormatsForwardDetId_LOC_USE := self cmssw  FWCore/Utilities DataFormats/DetId 
DataFormatsForwardDetId_LCGDICTS  := x 
DataFormatsForwardDetId_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsForwardDetId,src/DataFormats/ForwardDetId/src/classes.h,src/DataFormats/ForwardDetId/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) $(root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS)))
DataFormatsForwardDetId_EX_LIB   := DataFormatsForwardDetId
DataFormatsForwardDetId_EX_USE   := $(foreach d,$(DataFormatsForwardDetId_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsForwardDetId_PACKAGE := self/src/DataFormats/ForwardDetId/src
ALL_PRODS += DataFormatsForwardDetId
DataFormatsForwardDetId_CLASS := LIBRARY
DataFormats/ForwardDetId_forbigobj+=DataFormatsForwardDetId
DataFormatsForwardDetId_INIT_FUNC        += $$(eval $$(call Library,DataFormatsForwardDetId,src/DataFormats/ForwardDetId/src,src_DataFormats_ForwardDetId_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
ifeq ($(strip $(DataFormats/L1THGCal)),)
ALL_COMMONRULES += src_DataFormats_L1THGCal_src
src_DataFormats_L1THGCal_src_parent := DataFormats/L1THGCal
src_DataFormats_L1THGCal_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_L1THGCal_src,src/DataFormats/L1THGCal/src,LIBRARY))
DataFormatsL1THGCal := self/DataFormats/L1THGCal
DataFormats/L1THGCal := DataFormatsL1THGCal
DataFormatsL1THGCal_files := $(patsubst src/DataFormats/L1THGCal/src/%,%,$(wildcard $(foreach dir,src/DataFormats/L1THGCal/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsL1THGCal_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/L1THGCal/BuildFile
DataFormatsL1THGCal_LOC_USE := self cmssw  DataFormats/Common DataFormats/L1Trigger DataFormats/DetId DataFormats/ForwardDetId DataFormats/GeometryVector FWCore/Utilities FWCore/MessageLogger rootrflx boost 
DataFormatsL1THGCal_LCGDICTS  := x 
DataFormatsL1THGCal_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsL1THGCal,src/DataFormats/L1THGCal/src/classes.h,src/DataFormats/L1THGCal/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) $(root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS)))
DataFormatsL1THGCal_EX_LIB   := DataFormatsL1THGCal
DataFormatsL1THGCal_EX_USE   := $(foreach d,$(DataFormatsL1THGCal_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1THGCal_PACKAGE := self/src/DataFormats/L1THGCal/src
ALL_PRODS += DataFormatsL1THGCal
DataFormatsL1THGCal_CLASS := LIBRARY
DataFormats/L1THGCal_forbigobj+=DataFormatsL1THGCal
DataFormatsL1THGCal_INIT_FUNC        += $$(eval $$(call Library,DataFormatsL1THGCal,src/DataFormats/L1THGCal/src,src_DataFormats_L1THGCal_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
ifeq ($(strip $(L1Trigger/L1THGCal)),)
ALL_COMMONRULES += src_L1Trigger_L1THGCal_src
src_L1Trigger_L1THGCal_src_parent := L1Trigger/L1THGCal
src_L1Trigger_L1THGCal_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCal_src,src/L1Trigger/L1THGCal/src,LIBRARY))
L1TriggerL1THGCal := self/L1Trigger/L1THGCal
L1Trigger/L1THGCal := L1TriggerL1THGCal
L1TriggerL1THGCal_files := $(patsubst src/L1Trigger/L1THGCal/src/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1THGCal/src src/L1Trigger/L1THGCal/src/backend src/L1Trigger/L1THGCal/src/backend_emulator src/L1Trigger/L1THGCal/src/concentrator src/L1Trigger/L1THGCal/src/veryfrontend,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerL1THGCal_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/L1THGCal/BuildFile
L1TriggerL1THGCal_LOC_USE := self cmssw  DataFormats/L1Trigger FWCore/Framework Geometry/HGCalGeometry Geometry/CaloTopology Geometry/Records DataFormats/L1THGCal SimDataFormats/CaloTest PhysicsTools/TensorFlow HeterogeneousCore/SonicTriton CommonTools/Utils json 
L1TriggerL1THGCal_EX_LIB   := L1TriggerL1THGCal
L1TriggerL1THGCal_EX_USE   := $(foreach d,$(L1TriggerL1THGCal_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1THGCal_PACKAGE := self/src/L1Trigger/L1THGCal/src
ALL_PRODS += L1TriggerL1THGCal
L1TriggerL1THGCal_CLASS := LIBRARY
L1Trigger/L1THGCal_forbigobj+=L1TriggerL1THGCal
L1TriggerL1THGCal_INIT_FUNC        += $$(eval $$(call Library,L1TriggerL1THGCal,src/L1Trigger/L1THGCal/src,src_L1Trigger_L1THGCal_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
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
ifeq ($(strip $(L1Trigger/Phase2L1ParticleFlow)),)
ALL_COMMONRULES += src_L1Trigger_Phase2L1ParticleFlow_src
src_L1Trigger_Phase2L1ParticleFlow_src_parent := L1Trigger/Phase2L1ParticleFlow
src_L1Trigger_Phase2L1ParticleFlow_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_L1Trigger_Phase2L1ParticleFlow_src,src/L1Trigger/Phase2L1ParticleFlow/src,LIBRARY))
L1TriggerPhase2L1ParticleFlow := self/L1Trigger/Phase2L1ParticleFlow
L1Trigger/Phase2L1ParticleFlow := L1TriggerPhase2L1ParticleFlow
L1TriggerPhase2L1ParticleFlow_files := $(patsubst src/L1Trigger/Phase2L1ParticleFlow/src/%,%,$(wildcard $(foreach dir,src/L1Trigger/Phase2L1ParticleFlow/src src/L1Trigger/Phase2L1ParticleFlow/src/deregionizer src/L1Trigger/Phase2L1ParticleFlow/src/egamma src/L1Trigger/Phase2L1ParticleFlow/src/jetmet src/L1Trigger/Phase2L1ParticleFlow/src/l1-converters src/L1Trigger/Phase2L1ParticleFlow/src/pf src/L1Trigger/Phase2L1ParticleFlow/src/puppi src/L1Trigger/Phase2L1ParticleFlow/src/regionizer src/L1Trigger/Phase2L1ParticleFlow/src/taus,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
L1TriggerPhase2L1ParticleFlow_BuildFile    := $(WORKINGDIR)/cache/bf/src/L1Trigger/Phase2L1ParticleFlow/BuildFile
L1TriggerPhase2L1ParticleFlow_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/Utilities L1Trigger/L1THGCal DataFormats/L1TParticleFlow DataFormats/L1TCorrelator CommonTools/BaseParticlePropagator DataFormats/ParticleFlowReco CommonTools/Utils CommonTools/MVAUtils L1Trigger/DemonstratorTools PhysicsTools/TensorFlow tensorflow roottmva hls 
L1TriggerPhase2L1ParticleFlow_EX_LIB   := L1TriggerPhase2L1ParticleFlow
L1TriggerPhase2L1ParticleFlow_EX_USE   := $(foreach d,$(L1TriggerPhase2L1ParticleFlow_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerPhase2L1ParticleFlow_PACKAGE := self/src/L1Trigger/Phase2L1ParticleFlow/src
ALL_PRODS += L1TriggerPhase2L1ParticleFlow
L1TriggerPhase2L1ParticleFlow_CLASS := LIBRARY
L1Trigger/Phase2L1ParticleFlow_forbigobj+=L1TriggerPhase2L1ParticleFlow
L1TriggerPhase2L1ParticleFlow_INIT_FUNC        += $$(eval $$(call Library,L1TriggerPhase2L1ParticleFlow,src/L1Trigger/Phase2L1ParticleFlow/src,src_L1Trigger_Phase2L1ParticleFlow_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
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
ifeq ($(strip $(DQMOffline/L1Trigger)),)
ALL_COMMONRULES += src_DQMOffline_L1Trigger_src
src_DQMOffline_L1Trigger_src_parent := DQMOffline/L1Trigger
src_DQMOffline_L1Trigger_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DQMOffline_L1Trigger_src,src/DQMOffline/L1Trigger/src,LIBRARY))
DQMOfflineL1Trigger := self/DQMOffline/L1Trigger
DQMOffline/L1Trigger := DQMOfflineL1Trigger
DQMOfflineL1Trigger_files := $(patsubst src/DQMOffline/L1Trigger/src/%,%,$(wildcard $(foreach dir,src/DQMOffline/L1Trigger/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DQMOfflineL1Trigger_BuildFile    := $(WORKINGDIR)/cache/bf/src/DQMOffline/L1Trigger/BuildFile
DQMOfflineL1Trigger_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet DQMServices/Core DataFormats/L1Trigger DataFormats/L1GlobalTrigger DataFormats/MuonReco DataFormats/TauReco DataFormats/METReco DataFormats/JetReco CondFormats/DataRecord CondFormats/L1TObjects L1Trigger/GlobalTriggerAnalyzer L1Trigger/Phase2L1ParticleFlow TrackingTools/TransientTrack TrackingTools/TrajectoryState HLTrigger/HLTcore DQM/L1TMonitor MuonAnalysis/MuonAssociators SimDataFormats/TrackingAnalysis 
DQMOfflineL1Trigger_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DQMOfflineL1Trigger,DQMOfflineL1Trigger,$(SCRAMSTORENAME_LIB),src/DQMOffline/L1Trigger/src))
DQMOfflineL1Trigger_PACKAGE := self/src/DQMOffline/L1Trigger/src
ALL_PRODS += DQMOfflineL1Trigger
DQMOfflineL1Trigger_CLASS := LIBRARY
DQMOffline/L1Trigger_forbigobj+=DQMOfflineL1Trigger
DQMOfflineL1Trigger_INIT_FUNC        += $$(eval $$(call Library,DQMOfflineL1Trigger,src/DQMOffline/L1Trigger/src,src_DQMOffline_L1Trigger_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
endif
ifeq ($(strip $(Fireworks/Calo)),)
ALL_COMMONRULES += src_Fireworks_Calo_src
src_Fireworks_Calo_src_parent := Fireworks/Calo
src_Fireworks_Calo_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Fireworks_Calo_src,src/Fireworks/Calo/src,LIBRARY))
FireworksCalo := self/Fireworks/Calo
Fireworks/Calo := FireworksCalo
FireworksCalo_files := $(patsubst src/Fireworks/Calo/src/%,%,$(wildcard $(foreach dir,src/Fireworks/Calo/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
FireworksCalo_BuildFile    := $(WORKINGDIR)/cache/bf/src/Fireworks/Calo/BuildFile
FireworksCalo_LOC_USE := self cmssw  DataFormats/CaloRecHit DataFormats/CaloTowers DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/FWLite DataFormats/JetReco DataFormats/TauReco Fireworks/Core Fireworks/Tracks boost_system rootgpad rootphysics rooteve rootgeom 
FireworksCalo_EX_LIB   := FireworksCalo
FireworksCalo_EX_USE   := $(foreach d,$(FireworksCalo_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksCalo_PACKAGE := self/src/Fireworks/Calo/src
ALL_PRODS += FireworksCalo
FireworksCalo_CLASS := LIBRARY
Fireworks/Calo_forbigobj+=FireworksCalo
FireworksCalo_INIT_FUNC        += $$(eval $$(call Library,FireworksCalo,src/Fireworks/Calo/src,src_Fireworks_Calo_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
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
