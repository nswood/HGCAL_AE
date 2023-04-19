ifeq ($(strip $(Fireworks/Calo)),)
ALL_COMMONRULES += src_Fireworks_Calo_src
src_Fireworks_Calo_src_parent := Fireworks/Calo
src_Fireworks_Calo_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Fireworks_Calo_src,src/Fireworks/Calo/src,LIBRARY))
FireworksCalo := self/Fireworks/Calo
Fireworks/Calo := FireworksCalo
FireworksCalo_files := $(patsubst src/Fireworks/Calo/src/%,%,$(wildcard $(foreach dir,src/Fireworks/Calo/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
FireworksCalo_BuildFile    := $(WORKINGDIR)/cache/bf/src/Fireworks/Calo/BuildFile
FireworksCalo_LOC_USE := self cmssw  DataFormats/CaloRecHit DataFormats/CaloTowers DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/FWLite DataFormats/JetReco DataFormats/TauReco Fireworks/Core Fireworks/Tracks boost_system rootgpad rootphysics rooteve rootgeom 
FireworksCalo_EX_LIB   := FireworksCalo
FireworksCalo_EX_USE   := $(foreach d,$(FireworksCalo_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksCalo_PACKAGE := self/src/Fireworks/Calo/src
ALL_PRODS += FireworksCalo
FireworksCalo_CLASS := LIBRARY
Fireworks/Calo_forbigobj+=FireworksCalo
FireworksCalo_INIT_FUNC        += $$(eval $$(call Library,FireworksCalo,src/Fireworks/Calo/src,src_Fireworks_Calo_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
