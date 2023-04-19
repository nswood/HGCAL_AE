ifeq ($(strip $(PyL1TriggerL1CaloTrigger)),)
PyL1TriggerL1CaloTrigger := self/src/L1Trigger/L1CaloTrigger/python
src_L1Trigger_L1CaloTrigger_python_parent := src/L1Trigger/L1CaloTrigger
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/L1CaloTrigger/python)
PyL1TriggerL1CaloTrigger_files := $(patsubst src/L1Trigger/L1CaloTrigger/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1CaloTrigger/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerL1CaloTrigger_LOC_USE := self cmssw  
PyL1TriggerL1CaloTrigger_PACKAGE := self/src/L1Trigger/L1CaloTrigger/python
ALL_PRODS += PyL1TriggerL1CaloTrigger
PyL1TriggerL1CaloTrigger_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerL1CaloTrigger,src/L1Trigger/L1CaloTrigger/python,src_L1Trigger_L1CaloTrigger_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerL1CaloTrigger,src/L1Trigger/L1CaloTrigger/python))
endif
ALL_COMMONRULES += src_L1Trigger_L1CaloTrigger_python
src_L1Trigger_L1CaloTrigger_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1CaloTrigger_python,src/L1Trigger/L1CaloTrigger/python,PYTHON))
