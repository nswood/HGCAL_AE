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
