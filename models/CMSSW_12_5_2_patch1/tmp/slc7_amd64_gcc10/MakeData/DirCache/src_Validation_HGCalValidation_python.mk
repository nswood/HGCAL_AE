ifeq ($(strip $(PyValidationHGCalValidation)),)
PyValidationHGCalValidation := self/src/Validation/HGCalValidation/python
src_Validation_HGCalValidation_python_parent := src/Validation/HGCalValidation
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Validation/HGCalValidation/python)
PyValidationHGCalValidation_files := $(patsubst src/Validation/HGCalValidation/python/%,%,$(wildcard $(foreach dir,src/Validation/HGCalValidation/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyValidationHGCalValidation_LOC_USE := self cmssw  
PyValidationHGCalValidation_PACKAGE := self/src/Validation/HGCalValidation/python
ALL_PRODS += PyValidationHGCalValidation
PyValidationHGCalValidation_INIT_FUNC        += $$(eval $$(call PythonProduct,PyValidationHGCalValidation,src/Validation/HGCalValidation/python,src_Validation_HGCalValidation_python))
else
$(eval $(call MultipleWarningMsg,PyValidationHGCalValidation,src/Validation/HGCalValidation/python))
endif
ALL_COMMONRULES += src_Validation_HGCalValidation_python
src_Validation_HGCalValidation_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Validation_HGCalValidation_python,src/Validation/HGCalValidation/python,PYTHON))
