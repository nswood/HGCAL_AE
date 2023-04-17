ifeq ($(strip $(DataFormats/L1THGCal)),)
ALL_COMMONRULES += src_DataFormats_L1THGCal_src
src_DataFormats_L1THGCal_src_parent := DataFormats/L1THGCal
src_DataFormats_L1THGCal_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_L1THGCal_src,src/DataFormats/L1THGCal/src,LIBRARY))
DataFormatsL1THGCal := self/DataFormats/L1THGCal
DataFormats/L1THGCal := DataFormatsL1THGCal
DataFormatsL1THGCal_files := $(patsubst src/DataFormats/L1THGCal/src/%,%,$(wildcard $(foreach dir,src/DataFormats/L1THGCal/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsL1THGCal_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/L1THGCal/BuildFile
DataFormatsL1THGCal_LOC_USE := self cmssw  DataFormats/Common DataFormats/L1Trigger DataFormats/DetId DataFormats/ForwardDetId DataFormats/GeometryVector FWCore/Utilities FWCore/MessageLogger rootrflx boost 
DataFormatsL1THGCal_LCGDICTS  := x 
DataFormatsL1THGCal_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsL1THGCal,src/DataFormats/L1THGCal/src/classes.h,src/DataFormats/L1THGCal/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) $(root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS)))
DataFormatsL1THGCal_EX_LIB   := DataFormatsL1THGCal
DataFormatsL1THGCal_EX_USE   := $(foreach d,$(DataFormatsL1THGCal_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsL1THGCal_PACKAGE := self/src/DataFormats/L1THGCal/src
ALL_PRODS += DataFormatsL1THGCal
DataFormatsL1THGCal_CLASS := LIBRARY
DataFormats/L1THGCal_forbigobj+=DataFormatsL1THGCal
DataFormatsL1THGCal_INIT_FUNC        += $$(eval $$(call Library,DataFormatsL1THGCal,src/DataFormats/L1THGCal/src,src_DataFormats_L1THGCal_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
