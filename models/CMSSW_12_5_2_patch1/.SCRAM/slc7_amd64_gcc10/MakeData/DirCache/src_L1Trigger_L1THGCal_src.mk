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
