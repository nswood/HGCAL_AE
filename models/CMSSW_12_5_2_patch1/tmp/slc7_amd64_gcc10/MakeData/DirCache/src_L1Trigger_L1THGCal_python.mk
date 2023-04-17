ifeq ($(strip $(PyL1TriggerL1THGCal)),)
PyL1TriggerL1THGCal := self/src/L1Trigger/L1THGCal/python
src_L1Trigger_L1THGCal_python_parent := src/L1Trigger/L1THGCal
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/L1THGCal/python)
PyL1TriggerL1THGCal_files := $(patsubst src/L1Trigger/L1THGCal/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1THGCal/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerL1THGCal_LOC_USE := self cmssw  
PyL1TriggerL1THGCal_PACKAGE := self/src/L1Trigger/L1THGCal/python
ALL_PRODS += PyL1TriggerL1THGCal
PyL1TriggerL1THGCal_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerL1THGCal,src/L1Trigger/L1THGCal/python,src_L1Trigger_L1THGCal_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerL1THGCal,src/L1Trigger/L1THGCal/python))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCal_python
src_L1Trigger_L1THGCal_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCal_python,src/L1Trigger/L1THGCal/python,PYTHON))
