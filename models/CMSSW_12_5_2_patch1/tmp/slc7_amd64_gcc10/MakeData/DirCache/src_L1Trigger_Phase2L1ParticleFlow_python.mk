ifeq ($(strip $(PyL1TriggerPhase2L1ParticleFlow)),)
PyL1TriggerPhase2L1ParticleFlow := self/src/L1Trigger/Phase2L1ParticleFlow/python
src_L1Trigger_Phase2L1ParticleFlow_python_parent := src/L1Trigger/Phase2L1ParticleFlow
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/Phase2L1ParticleFlow/python)
PyL1TriggerPhase2L1ParticleFlow_files := $(patsubst src/L1Trigger/Phase2L1ParticleFlow/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/Phase2L1ParticleFlow/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerPhase2L1ParticleFlow_LOC_USE := self cmssw  
PyL1TriggerPhase2L1ParticleFlow_PACKAGE := self/src/L1Trigger/Phase2L1ParticleFlow/python
ALL_PRODS += PyL1TriggerPhase2L1ParticleFlow
PyL1TriggerPhase2L1ParticleFlow_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerPhase2L1ParticleFlow,src/L1Trigger/Phase2L1ParticleFlow/python,src_L1Trigger_Phase2L1ParticleFlow_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerPhase2L1ParticleFlow,src/L1Trigger/Phase2L1ParticleFlow/python))
endif
ALL_COMMONRULES += src_L1Trigger_Phase2L1ParticleFlow_python
src_L1Trigger_Phase2L1ParticleFlow_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_Phase2L1ParticleFlow_python,src/L1Trigger/Phase2L1ParticleFlow/python,PYTHON))
