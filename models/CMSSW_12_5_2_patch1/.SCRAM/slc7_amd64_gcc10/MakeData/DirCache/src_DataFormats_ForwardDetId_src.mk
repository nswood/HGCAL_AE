ifeq ($(strip $(DataFormats/ForwardDetId)),)
ALL_COMMONRULES += src_DataFormats_ForwardDetId_src
src_DataFormats_ForwardDetId_src_parent := DataFormats/ForwardDetId
src_DataFormats_ForwardDetId_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_DataFormats_ForwardDetId_src,src/DataFormats/ForwardDetId/src,LIBRARY))
DataFormatsForwardDetId := self/DataFormats/ForwardDetId
DataFormats/ForwardDetId := DataFormatsForwardDetId
DataFormatsForwardDetId_files := $(patsubst src/DataFormats/ForwardDetId/src/%,%,$(wildcard $(foreach dir,src/DataFormats/ForwardDetId/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DataFormatsForwardDetId_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/ForwardDetId/BuildFile
DataFormatsForwardDetId_LOC_USE := self cmssw  FWCore/Utilities DataFormats/DetId 
DataFormatsForwardDetId_LCGDICTS  := x 
DataFormatsForwardDetId_PRE_INIT_FUNC += $$(eval $$(call LCGDict,DataFormatsForwardDetId,src/DataFormats/ForwardDetId/src/classes.h,src/DataFormats/ForwardDetId/src/classes_def.xml,$(SCRAMSTORENAME_LIB),$(GENREFLEX_ARGS) $(root_EX_FLAGS_GENREFLEX_FAILES_ON_WARNS)))
DataFormatsForwardDetId_EX_LIB   := DataFormatsForwardDetId
DataFormatsForwardDetId_EX_USE   := $(foreach d,$(DataFormatsForwardDetId_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DataFormatsForwardDetId_PACKAGE := self/src/DataFormats/ForwardDetId/src
ALL_PRODS += DataFormatsForwardDetId
DataFormatsForwardDetId_CLASS := LIBRARY
DataFormats/ForwardDetId_forbigobj+=DataFormatsForwardDetId
DataFormatsForwardDetId_INIT_FUNC        += $$(eval $$(call Library,DataFormatsForwardDetId,src/DataFormats/ForwardDetId/src,src_DataFormats_ForwardDetId_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
