ifeq ($(strip $(PyL1TriggerL1THGCalUtilities)),)
PyL1TriggerL1THGCalUtilities := self/src/L1Trigger/L1THGCalUtilities/python
src_L1Trigger_L1THGCalUtilities_python_parent := src/L1Trigger/L1THGCalUtilities
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/L1Trigger/L1THGCalUtilities/python)
PyL1TriggerL1THGCalUtilities_files := $(patsubst src/L1Trigger/L1THGCalUtilities/python/%,%,$(wildcard $(foreach dir,src/L1Trigger/L1THGCalUtilities/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyL1TriggerL1THGCalUtilities_LOC_USE := self cmssw  
PyL1TriggerL1THGCalUtilities_PACKAGE := self/src/L1Trigger/L1THGCalUtilities/python
ALL_PRODS += PyL1TriggerL1THGCalUtilities
PyL1TriggerL1THGCalUtilities_INIT_FUNC        += $$(eval $$(call PythonProduct,PyL1TriggerL1THGCalUtilities,src/L1Trigger/L1THGCalUtilities/python,src_L1Trigger_L1THGCalUtilities_python))
else
$(eval $(call MultipleWarningMsg,PyL1TriggerL1THGCalUtilities,src/L1Trigger/L1THGCalUtilities/python))
endif
ALL_COMMONRULES += src_L1Trigger_L1THGCalUtilities_python
src_L1Trigger_L1THGCalUtilities_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_L1Trigger_L1THGCalUtilities_python,src/L1Trigger/L1THGCalUtilities/python,PYTHON))
