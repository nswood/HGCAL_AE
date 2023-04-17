ifeq ($(strip $(PyDQMOfflineL1Trigger)),)
PyDQMOfflineL1Trigger := self/src/DQMOffline/L1Trigger/python
src_DQMOffline_L1Trigger_python_parent := src/DQMOffline/L1Trigger
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/DQMOffline/L1Trigger/python)
PyDQMOfflineL1Trigger_files := $(patsubst src/DQMOffline/L1Trigger/python/%,%,$(wildcard $(foreach dir,src/DQMOffline/L1Trigger/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyDQMOfflineL1Trigger_LOC_USE := self cmssw  
PyDQMOfflineL1Trigger_PACKAGE := self/src/DQMOffline/L1Trigger/python
ALL_PRODS += PyDQMOfflineL1Trigger
PyDQMOfflineL1Trigger_INIT_FUNC        += $$(eval $$(call PythonProduct,PyDQMOfflineL1Trigger,src/DQMOffline/L1Trigger/python,src_DQMOffline_L1Trigger_python))
else
$(eval $(call MultipleWarningMsg,PyDQMOfflineL1Trigger,src/DQMOffline/L1Trigger/python))
endif
ALL_COMMONRULES += src_DQMOffline_L1Trigger_python
src_DQMOffline_L1Trigger_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DQMOffline_L1Trigger_python,src/DQMOffline/L1Trigger/python,PYTHON))
