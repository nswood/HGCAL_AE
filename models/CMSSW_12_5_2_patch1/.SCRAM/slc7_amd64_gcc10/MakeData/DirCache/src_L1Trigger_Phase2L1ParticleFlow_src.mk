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
