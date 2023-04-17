src_Validation_HGCalValidation_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/Validation/HGCalValidation/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_Validation_HGCalValidation_scripts,src/Validation/HGCalValidation/scripts,$(SCRAMSTORENAME_BIN),*))
