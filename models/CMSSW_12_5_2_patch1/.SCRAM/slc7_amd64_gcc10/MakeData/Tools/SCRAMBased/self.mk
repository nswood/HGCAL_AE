ifeq ($(strip $(DQM/EcalMonitorClient)),)
DQMEcalMonitorClient := self/DQM/EcalMonitorClient
DQM/EcalMonitorClient := DQMEcalMonitorClient
DQMEcalMonitorClient_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalMonitorClient_EX_USE := $(foreach d, self cmssw  DQM/EcalCommon DQMServices/Core DataFormats/EcalDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet rootcore onnxruntime PhysicsTools/ONNXRuntime ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalMonitorClient_EX_LIB   := DQMEcalMonitorClient
ALL_EXTERNAL_PRODS += DQMEcalMonitorClient
DQMEcalMonitorClient_CLASS := LIBRARY
DQM/EcalMonitorClient_relbigobj+=DQMEcalMonitorClient
endif
ifeq ($(strip $(DQMEcalMonitorClientPlugins)),)
DQMEcalMonitorClientPlugins := self/src/DQM/EcalMonitorClient/plugins
DQMEcalMonitorClientPlugins_LOC_USE := self cmssw  DQM/EcalCommon DQM/EcalMonitorClient 
ALL_EXTERNAL_PLUGIN_PRODS += DQMEcalMonitorClientPlugins
DQM/EcalMonitorClient_relbigobj+=DQMEcalMonitorClientPlugins
endif
ifeq ($(strip $(DQMHLTEvFPlugins)),)
DQMHLTEvFPlugins := self/src/DQM/HLTEvF/plugins
DQMHLTEvFPlugins_LOC_USE := self cmssw  HLTrigger/HLTcore HLTrigger/JetMET CondFormats/L1TObjects DQMServices/Core DataFormats/BeamSpot DataFormats/BTauReco DataFormats/Common DataFormats/Math DataFormats/HLTReco DataFormats/JetReco DataFormats/L1TGlobal DataFormats/OnlineMetaData DataFormats/RecoCandidate FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry Geometry/Records DQMOffline/Trigger rootcore 
ALL_EXTERNAL_PLUGIN_PRODS += DQMHLTEvFPlugins
DQM/HLTEvF_relbigobj+=DQMHLTEvFPlugins
endif
ifeq ($(strip $(DQM/Integration)),)
src_DQM_Integration := self/DQM/Integration
DQM/Integration  := src_DQM_Integration
src_DQM_Integration_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_DQM_Integration_EX_USE := $(foreach d, self cmssw CoralBase RelationalAccess,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_DQM_Integration
endif

ifeq ($(strip $(DQM/SiPixelPhase1Track)),)
src_DQM_SiPixelPhase1Track := self/DQM/SiPixelPhase1Track
DQM/SiPixelPhase1Track  := src_DQM_SiPixelPhase1Track
src_DQM_SiPixelPhase1Track_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_DQM_SiPixelPhase1Track_EX_USE := $(foreach d, self cmssw,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_DQM_SiPixelPhase1Track
endif

ifeq ($(strip $(DQMSiPixelPhase1TrackAuto)),)
DQMSiPixelPhase1TrackAuto := self/src/DQM/SiPixelPhase1Track/plugins
DQMSiPixelPhase1TrackAuto_LOC_USE := self cmssw  DQM/SiPixelPhase1Common DataFormats/TrackerRecHit2D RecoPixelVertexing/PixelLowPtUtilities CondFormats/SiPixelTransient Alignment/OfflineValidation 
ALL_EXTERNAL_PLUGIN_PRODS += DQMSiPixelPhase1TrackAuto
DQM/SiPixelPhase1Track_relbigobj+=DQMSiPixelPhase1TrackAuto
endif
ifeq ($(strip $(DQM/EcalCommon)),)
DQMEcalCommon := self/DQM/EcalCommon
DQM/EcalCommon := DQMEcalCommon
DQMEcalCommon_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalCommon_EX_USE := $(foreach d, self cmssw  DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRawData FWCore/Utilities FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry Geometry/EcalMapping Geometry/CaloTopology Geometry/CaloGeometry Geometry/Records CalibCalorimetry/EcalLaserAnalyzer CondFormats/EcalObjects DQMServices/Core rootcore boost ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalCommon_EX_LIB   := DQMEcalCommon
ALL_EXTERNAL_PRODS += DQMEcalCommon
DQMEcalCommon_CLASS := LIBRARY
DQM/EcalCommon_relbigobj+=DQMEcalCommon
endif
ifeq ($(strip $(DQMEcalCommonPlugins)),)
DQMEcalCommonPlugins := self/src/DQM/EcalCommon/plugins
DQMEcalCommonPlugins_LOC_USE := self cmssw  DQM/EcalCommon 
ALL_EXTERNAL_PLUGIN_PRODS += DQMEcalCommonPlugins
DQM/EcalCommon_relbigobj+=DQMEcalCommonPlugins
endif
ifeq ($(strip $(DQM/EcalMonitorDbModule)),)
DQMEcalMonitorDbModule := self/DQM/EcalMonitorDbModule
DQM/EcalMonitorDbModule := DQMEcalMonitorDbModule
DQMEcalMonitorDbModule_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMEcalMonitorDbModule_EX_USE := $(foreach d, self cmssw  CoralBase DQMServices/Core DQM/EcalCommon FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry Utilities/Xerces OnlineDB/EcalCondDB RelationalAccess rootcore rootgraphics xerces-c ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMEcalMonitorDbModule_EX_LIB   := DQMEcalMonitorDbModule
ALL_EXTERNAL_PRODS += DQMEcalMonitorDbModule
DQMEcalMonitorDbModule_CLASS := LIBRARY
DQM/EcalMonitorDbModule_relbigobj+=DQMEcalMonitorDbModule
endif
ifeq ($(strip $(DQMEcalMonitorDbModulePlugins)),)
DQMEcalMonitorDbModulePlugins := self/src/DQM/EcalMonitorDbModule/plugins
DQMEcalMonitorDbModulePlugins_LOC_USE := self cmssw  CondCore/DBOutputService DQM/EcalMonitorDbModule 
ALL_EXTERNAL_PLUGIN_PRODS += DQMEcalMonitorDbModulePlugins
DQM/EcalMonitorDbModule_relbigobj+=DQMEcalMonitorDbModulePlugins
endif
ifeq ($(strip $(DQMOffline/Trigger)),)
DQMOfflineTrigger := self/DQMOffline/Trigger
DQMOffline/Trigger := DQMOfflineTrigger
DQMOfflineTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineTrigger_EX_USE := $(foreach d, self cmssw  CommonTools/TriggerUtils CommonTools/Utils DQMServices/Core DataFormats/CaloTowers DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/HLTReco DataFormats/HeavyIonEvent DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/TauReco DataFormats/TrackReco FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities HLTrigger/HLTcore RecoEcal/EgammaCoreTools RecoEgamma/EgammaIsolationAlgos RecoJets/JetProducers MagneticField/Engine MagneticField/Records root boost ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
DQMOfflineTrigger_EX_LIB   := DQMOfflineTrigger
ALL_EXTERNAL_PRODS += DQMOfflineTrigger
DQMOfflineTrigger_CLASS := LIBRARY
DQMOffline/Trigger_relbigobj+=DQMOfflineTrigger
endif
ifeq ($(strip $(DQMOfflineTriggerPlugins)),)
DQMOfflineTriggerPlugins := self/src/DQMOffline/Trigger/plugins
DQMOfflineTriggerPlugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry DataFormats/HLTReco DataFormats/MuonReco DataFormats/EgammaCandidates DataFormats/TrackReco DataFormats/BTauReco DataFormats/TauReco DataFormats/METReco DataFormats/JetReco CommonTools/Egamma RecoVertex/KalmanVertexFit HLTrigger/HLTcore DQMServices/Core CommonTools/CandUtils CommonTools/Utils CommonTools/TriggerUtils DataFormats/VertexReco DQMOffline/Trigger TrackingTools/TransientTrack root roofit boost 
ALL_EXTERNAL_PLUGIN_PRODS += DQMOfflineTriggerPlugins
DQMOffline/Trigger_relbigobj+=DQMOfflineTriggerPlugins
endif
ifeq ($(strip $(DQMOffline/Hcal)),)
DQMOfflineHcal := self/DQMOffline/Hcal
DQMOffline/Hcal := DQMOfflineHcal
DQMOfflineHcal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineHcal_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet DQMServices/Core boost root DataFormats/Common DataFormats/HcalDetId DataFormats/METReco Geometry/CaloGeometry Geometry/CaloTopology CondFormats/EcalObjects CondFormats/DataRecord CondFormats/HcalObjects RecoLocalCalo/HcalRecAlgos RecoLocalCalo/EcalRecAlgos Geometry/HcalTowerAlgo ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += DQMOfflineHcal
DQMOfflineHcal_CLASS := LIBRARY
DQMOffline/Hcal_relbigobj+=DQMOfflineHcal
endif
ifeq ($(strip $(DQMOffline/JetMET)),)
DQMOfflineJetMET := self/DQMOffline/JetMET
DQMOffline/JetMET := DQMOfflineJetMET
DQMOfflineJetMET_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
DQMOfflineJetMET_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/Utilities MagneticField/Engine DQMServices/Core FWCore/PluginManager DataFormats/JetReco DataFormats/METReco DataFormats/CaloTowers DataFormats/HcalRecHit DataFormats/HcalDetId DataFormats/EgammaReco DataFormats/EgammaCandidates HLTrigger/HLTcore RecoJets/JetProducers RecoHI/HiJetAlgos DataFormats/CSCRecHit DataFormats/EcalDetId DataFormats/DetId DataFormats/RecoCandidate Geometry/CaloGeometry Geometry/CSCGeometry Geometry/HcalTowerAlgo DataFormats/TrackReco DataFormats/Common DataFormats/Math RecoJets/JetAssociationAlgorithms MagneticField/Records TrackingTools/Records DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D DataFormats/SiStripCluster DataFormats/SiStripDetId DataFormats/PatCandidates CalibFormats/SiStripObjects CondFormats/SiStripObjects CalibTracker/Records CondFormats/DataRecord CommonTools/TriggerUtils RecoMuon/TrackingTools JetMETCorrections/Objects JetMETCorrections/JetCorrector ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += DQMOfflineJetMET
DQMOfflineJetMET_CLASS := LIBRARY
DQMOffline/JetMET_relbigobj+=DQMOfflineJetMET
endif
ifeq ($(strip $(DQMOfflineJetMETPlugins)),)
DQMOfflineJetMETPlugins := self/src/DQMOffline/JetMET/plugins
DQMOfflineJetMETPlugins_LOC_USE := self cmssw  DQMServices/Core FWCore/Framework CommonTools/UtilAlgos 
ALL_EXTERNAL_PLUGIN_PRODS += DQMOfflineJetMETPlugins
DQMOffline/JetMET_relbigobj+=DQMOfflineJetMETPlugins
endif
ifeq ($(strip $(Geometry/HcalCommonData)),)
GeometryHcalCommonData := self/Geometry/HcalCommonData
Geometry/HcalCommonData := GeometryHcalCommonData
GeometryHcalCommonData_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHcalCommonData_EX_USE := $(foreach d, self cmssw  DetectorDescription/Core DetectorDescription/DDCMS DataFormats/HcalDetId CondFormats/GeometryObjects DataFormats/DetId DataFormats/Math DetectorDescription/RegressionTest FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities SimDataFormats/CaloHit dd4hep clhep ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHcalCommonData_EX_LIB   := GeometryHcalCommonData
ALL_EXTERNAL_PRODS += GeometryHcalCommonData
GeometryHcalCommonData_CLASS := LIBRARY
Geometry/HcalCommonData_relbigobj+=GeometryHcalCommonData
endif
ifeq ($(strip $(GeometryHcalCommonDataPlugins)),)
GeometryHcalCommonDataPlugins := self/src/Geometry/HcalCommonData/plugins
GeometryHcalCommonDataPlugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet Geometry/Records Geometry/HcalCommonData DetectorDescription/Core DetectorDescription/DDCMS CondFormats/GeometryObjects 
ALL_EXTERNAL_PLUGIN_PRODS += GeometryHcalCommonDataPlugins
Geometry/HcalCommonData_relbigobj+=GeometryHcalCommonDataPlugins
endif
ifeq ($(strip $(Geometry/CaloEventSetup)),)
src_Geometry_CaloEventSetup := self/Geometry/CaloEventSetup
Geometry/CaloEventSetup  := src_Geometry_CaloEventSetup
src_Geometry_CaloEventSetup_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_Geometry_CaloEventSetup_EX_USE := $(foreach d, self cmssw CondFormats/Alignment CondFormats/GeometryObjects Geometry/Records,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_Geometry_CaloEventSetup
endif

ifeq ($(strip $(GeometryCaloEventSetupPlugins)),)
GeometryCaloEventSetupPlugins := self/src/Geometry/CaloEventSetup/plugins
GeometryCaloEventSetupPlugins_LOC_USE := self cmssw  FWCore/Framework Geometry/Records Geometry/CaloGeometry Geometry/EcalAlgo Geometry/CaloTopology Geometry/HcalTowerAlgo Geometry/HGCalGeometry CondFormats/Alignment FWCore/MessageLogger FWCore/ParameterSet zlib 
ALL_EXTERNAL_PLUGIN_PRODS += GeometryCaloEventSetupPlugins
Geometry/CaloEventSetup_relbigobj+=GeometryCaloEventSetupPlugins
endif
ifeq ($(strip $(Geometry/CaloTopology)),)
GeometryCaloTopology := self/Geometry/CaloTopology
Geometry/CaloTopology := GeometryCaloTopology
GeometryCaloTopology_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryCaloTopology_EX_USE := $(foreach d, self cmssw  DataFormats/CaloTowers DataFormats/HcalDetId DataFormats/EcalDetId DataFormats/ForwardDetId DataFormats/Common Geometry/CaloGeometry Geometry/HcalCommonData Geometry/HGCalCommonData boost ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryCaloTopology_EX_LIB   := GeometryCaloTopology
ALL_EXTERNAL_PRODS += GeometryCaloTopology
GeometryCaloTopology_CLASS := LIBRARY
Geometry/CaloTopology_relbigobj+=GeometryCaloTopology
endif
ifeq ($(strip $(Geometry/HGCalGeometry)),)
GeometryHGCalGeometry := self/Geometry/HGCalGeometry
Geometry/HGCalGeometry := GeometryHGCalGeometry
GeometryHGCalGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHGCalGeometry_EX_USE := $(foreach d, self cmssw  DataFormats/ForwardDetId DataFormats/Common Geometry/CaloGeometry Geometry/CaloTopology Geometry/HGCalCommonData MagneticField/Engine TrackingTools/TrajectoryState TrackingTools/GeomPropagators ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHGCalGeometry_EX_LIB   := GeometryHGCalGeometry
ALL_EXTERNAL_PRODS += GeometryHGCalGeometry
GeometryHGCalGeometry_CLASS := LIBRARY
Geometry/HGCalGeometry_relbigobj+=GeometryHGCalGeometry
endif
ifeq ($(strip $(GeometryHGCalGeometryPlugins)),)
GeometryHGCalGeometryPlugins := self/src/Geometry/HGCalGeometry/plugins
GeometryHGCalGeometryPlugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet Geometry/HGCalGeometry Geometry/CaloTopology Geometry/Records 
ALL_EXTERNAL_PLUGIN_PRODS += GeometryHGCalGeometryPlugins
Geometry/HGCalGeometry_relbigobj+=GeometryHGCalGeometryPlugins
endif
ifeq ($(strip $(Geometry/HcalEventSetup)),)
GeometryHcalEventSetup := self/Geometry/HcalEventSetup
Geometry/HcalEventSetup := GeometryHcalEventSetup
GeometryHcalEventSetup_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHcalEventSetup_EX_USE := $(foreach d, self cmssw  FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger Geometry/Records Geometry/CaloGeometry Geometry/CaloTopology Geometry/HcalTowerAlgo CondFormats/Alignment clhep ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += GeometryHcalEventSetup
GeometryHcalEventSetup_CLASS := LIBRARY
Geometry/HcalEventSetup_relbigobj+=GeometryHcalEventSetup
endif
ifeq ($(strip $(Geometry/HcalTowerAlgo)),)
GeometryHcalTowerAlgo := self/Geometry/HcalTowerAlgo
Geometry/HcalTowerAlgo := GeometryHcalTowerAlgo
GeometryHcalTowerAlgo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeometryHcalTowerAlgo_EX_USE := $(foreach d, self cmssw  Geometry/CaloGeometry Geometry/CaloTopology Geometry/HcalCommonData DataFormats/HcalDetId DataFormats/CaloTowers FWCore/MessageLogger FWCore/ParameterSet clhep boost_serialization ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
GeometryHcalTowerAlgo_EX_LIB   := GeometryHcalTowerAlgo
ALL_EXTERNAL_PRODS += GeometryHcalTowerAlgo
GeometryHcalTowerAlgo_CLASS := LIBRARY
Geometry/HcalTowerAlgo_relbigobj+=GeometryHcalTowerAlgo
endif
ifeq ($(strip $(GeometryHcalTowerAlgoPlugins)),)
GeometryHcalTowerAlgoPlugins := self/src/Geometry/HcalTowerAlgo/plugins
GeometryHcalTowerAlgoPlugins_LOC_USE := self cmssw  FWCore/Framework Geometry/Records Geometry/HcalTowerAlgo 
ALL_EXTERNAL_PLUGIN_PRODS += GeometryHcalTowerAlgoPlugins
Geometry/HcalTowerAlgo_relbigobj+=GeometryHcalTowerAlgoPlugins
endif
ifeq ($(strip $(HLTrigger/Timer)),)
HLTriggerTimer := self/HLTrigger/Timer
HLTrigger/Timer := HLTriggerTimer
HLTriggerTimer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
HLTriggerTimer_EX_USE := $(foreach d, self cmssw  boost_chrono DataFormats/Provenance FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HLTriggerTimer_EX_LIB   := HLTriggerTimer
ALL_EXTERNAL_PRODS += HLTriggerTimer
HLTriggerTimer_CLASS := LIBRARY
HLTrigger/Timer_relbigobj+=HLTriggerTimer
endif
ifeq ($(strip $(HLTriggerTimerPlugins)),)
HLTriggerTimerPlugins := self/src/HLTrigger/Timer/plugins
HLTriggerTimerPlugins_LOC_USE := self cmssw  fmt json DQMServices/Core DataFormats/Provenance DataFormats/Scalers FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities HLTrigger/Timer boost_regex 
ALL_EXTERNAL_PLUGIN_PRODS += HLTriggerTimerPlugins
HLTrigger/Timer_relbigobj+=HLTriggerTimerPlugins
endif
ifeq ($(strip $(HLTrigger/JetMET)),)
HLTriggerJetMET := self/HLTrigger/JetMET
HLTrigger/JetMET := HLTriggerJetMET
HLTriggerJetMET_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
HLTriggerJetMET_EX_USE := $(foreach d, self cmssw  DataFormats/Common DataFormats/BTauReco DataFormats/HLTReco DataFormats/HcalRecHit DataFormats/JetReco DataFormats/METReco DataFormats/Math Geometry/Records Geometry/CaloTopology FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities RecoMET/METAlgorithms HLTrigger/HLTcore RecoJets/JetProducers ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
HLTriggerJetMET_EX_LIB   := HLTriggerJetMET
ALL_EXTERNAL_PRODS += HLTriggerJetMET
HLTriggerJetMET_CLASS := LIBRARY
HLTrigger/JetMET_relbigobj+=HLTriggerJetMET
endif
ifeq ($(strip $(HLTriggerJetMETPlugins)),)
HLTriggerJetMETPlugins := self/src/HLTrigger/JetMET/plugins
HLTriggerJetMETPlugins_LOC_USE := self cmssw  CommonTools/Utils DataFormats/Common DataFormats/EcalRecHit DataFormats/HLTReco DataFormats/JetReco DataFormats/Math DataFormats/METReco DataFormats/Phase2TrackerCluster DataFormats/Scouting DataFormats/SiPixelCluster FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CaloGeometry Geometry/Records TrackingTools/IPTools TrackingTools/TransientTrack HLTrigger/HLTcore HLTrigger/JetMET RecoBTag/FeatureTools 
ALL_EXTERNAL_PLUGIN_PRODS += HLTriggerJetMETPlugins
HLTrigger/JetMET_relbigobj+=HLTriggerJetMETPlugins
endif
ifeq ($(strip $(SimG4CMS/Calo)),)
SimG4CMSCalo := self/SimG4CMS/Calo
SimG4CMS/Calo := SimG4CMSCalo
SimG4CMSCalo_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSCalo_EX_USE := $(foreach d, self cmssw  FWCore/PluginManager SimGeneral/GFlash SimG4Core/SensitiveDetector SimG4Core/Notification DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/ForwardDetId DataFormats/Math CondFormats/GeometryObjects CondFormats/HcalObjects SimDataFormats/SimHitMaker SimDataFormats/CaloHit SimDataFormats/CaloTest Geometry/HcalCommonData Geometry/EcalCommonData Geometry/HGCalCommonData Geometry/Records FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos boost clhep dd4hep geant4core hepmc root rootmath ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSCalo_EX_LIB   := SimG4CMSCalo
ALL_EXTERNAL_PRODS += SimG4CMSCalo
SimG4CMSCalo_CLASS := LIBRARY
SimG4CMS/Calo_relbigobj+=SimG4CMSCalo
endif
ifeq ($(strip $(SimG4CMSCaloPlugins)),)
SimG4CMSCaloPlugins := self/src/SimG4CMS/Calo/plugins
SimG4CMSCaloPlugins_LOC_USE := self cmssw  CommonTools/UtilAlgos CondFormats/DataRecord DataFormats/EcalDetId DataFormats/HcalDetId FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/PluginManager FWCore/ServiceRegistry Geometry/HcalCommonData Geometry/HcalTowerAlgo Geometry/HGCalGeometry Geometry/CaloTopology Geometry/Records SimDataFormats/CaloHit SimDataFormats/Track SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimG4Core/Watcher SimG4CMS/Calo boost root clhep geant4core 
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSCaloPlugins
SimG4CMS/Calo_relbigobj+=SimG4CMSCaloPlugins
endif
ifeq ($(strip $(SimG4CMS/HcalTestBeam)),)
SimG4CMSHcalTestBeam := self/SimG4CMS/HcalTestBeam
SimG4CMS/HcalTestBeam := SimG4CMSHcalTestBeam
SimG4CMSHcalTestBeam_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSHcalTestBeam_EX_USE := $(foreach d, self cmssw  DataFormats/HcalDetId Geometry/EcalCommonData Geometry/HcalTestBeamData SimDataFormats/HcalTestBeam SimG4Core/Notification SimG4CMS/Calo FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos geant4core hepmc clhep rootmath rootphysics root ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSHcalTestBeam_EX_LIB   := SimG4CMSHcalTestBeam
ALL_EXTERNAL_PRODS += SimG4CMSHcalTestBeam
SimG4CMSHcalTestBeam_CLASS := LIBRARY
SimG4CMS/HcalTestBeam_relbigobj+=SimG4CMSHcalTestBeam
endif
ifeq ($(strip $(SimG4CMSHcalTestBeamPlugins)),)
SimG4CMSHcalTestBeamPlugins := self/src/SimG4CMS/HcalTestBeam/plugins
SimG4CMSHcalTestBeamPlugins_LOC_USE := self cmssw  DataFormats/HcalDetId DataFormats/Math Geometry/HcalTestBeamData SimDataFormats/HcalTestBeam SimG4Core/Notification SimG4Core/Watcher SimG4CMS/Calo FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger CommonTools/UtilAlgos SimG4CMS/HcalTestBeam geant4core hepmc clhep rootmath rootphysics root 
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSHcalTestBeamPlugins
SimG4CMS/HcalTestBeam_relbigobj+=SimG4CMSHcalTestBeamPlugins
endif
ifeq ($(strip $(SimG4CMS/ShowerLibraryProducer)),)
SimG4CMSShowerLibraryProducer := self/SimG4CMS/ShowerLibraryProducer
SimG4CMS/ShowerLibraryProducer := SimG4CMSShowerLibraryProducer
SimG4CMSShowerLibraryProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimG4CMSShowerLibraryProducer_EX_USE := $(foreach d, self cmssw  SimG4Core/SensitiveDetector SimG4Core/Notification SimG4CMS/Calo DataFormats/Math SimDataFormats/CaloHit FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/ServiceRegistry CommonTools/UtilAlgos boost geant4core root rootmath ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimG4CMSShowerLibraryProducer_EX_LIB   := SimG4CMSShowerLibraryProducer
ALL_EXTERNAL_PRODS += SimG4CMSShowerLibraryProducer
SimG4CMSShowerLibraryProducer_CLASS := LIBRARY
SimG4CMS/ShowerLibraryProducer_relbigobj+=SimG4CMSShowerLibraryProducer
endif
ifeq ($(strip $(SimG4CMSHcalForwardLibWriter)),)
SimG4CMSHcalForwardLibWriter := self/src/SimG4CMS/ShowerLibraryProducer/plugins
SimG4CMSHcalForwardLibWriter_LOC_USE := self cmssw  root FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/HcalCommonData Geometry/Records SimG4CMS/Forward SimG4CMS/ShowerLibraryProducer SimG4Core/SensitiveDetector SimG4Core/Watcher 
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSHcalForwardLibWriter
SimG4CMS/ShowerLibraryProducer_relbigobj+=SimG4CMSHcalForwardLibWriter
endif
ifeq ($(strip $(SimG4CMSShowerLibraryProducerPlugins)),)
SimG4CMSShowerLibraryProducerPlugins := self/src/SimG4CMS/ShowerLibraryProducer/plugins
SimG4CMSShowerLibraryProducerPlugins_LOC_USE := self cmssw  root FWCore/Framework FWCore/ParameterSet FWCore/PluginManager Geometry/HcalCommonData Geometry/Records SimG4CMS/Forward SimG4CMS/ShowerLibraryProducer SimG4Core/SensitiveDetector SimG4Core/Watcher 
ALL_EXTERNAL_PLUGIN_PRODS += SimG4CMSShowerLibraryProducerPlugins
SimG4CMS/ShowerLibraryProducer_relbigobj+=SimG4CMSShowerLibraryProducerPlugins
endif
ifeq ($(strip $(CalibCalorimetry/CaloMiscalibTools)),)
CalibCalorimetryCaloMiscalibTools := self/CalibCalorimetry/CaloMiscalibTools
CalibCalorimetry/CaloMiscalibTools := CalibCalorimetryCaloMiscalibTools
CalibCalorimetryCaloMiscalibTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryCaloMiscalibTools_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet Utilities/Xerces CondFormats/DataRecord DataFormats/EcalDetId DataFormats/HcalDetId CondFormats/EcalObjects DataFormats/DetId DataFormats/HcalRecHit Geometry/CaloTopology xerces-c ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryCaloMiscalibTools_EX_LIB   := CalibCalorimetryCaloMiscalibTools
ALL_EXTERNAL_PRODS += CalibCalorimetryCaloMiscalibTools
CalibCalorimetryCaloMiscalibTools_CLASS := LIBRARY
CalibCalorimetry/CaloMiscalibTools_relbigobj+=CalibCalorimetryCaloMiscalibTools
endif
ifeq ($(strip $(CalibCalorimetryCaloMiscalibToolsPlugin)),)
CalibCalorimetryCaloMiscalibToolsPlugin := self/src/CalibCalorimetry/CaloMiscalibTools/plugins
CalibCalorimetryCaloMiscalibToolsPlugin_LOC_USE := self cmssw  CalibCalorimetry/CaloMiscalibTools CondCore/DBOutputService 
ALL_EXTERNAL_PLUGIN_PRODS += CalibCalorimetryCaloMiscalibToolsPlugin
CalibCalorimetry/CaloMiscalibTools_relbigobj+=CalibCalorimetryCaloMiscalibToolsPlugin
endif
ifeq ($(strip $(CalibCalorimetry/CaloTPG)),)
CalibCalorimetryCaloTPG := self/CalibCalorimetry/CaloTPG
CalibCalorimetry/CaloTPG := CalibCalorimetryCaloTPG
CalibCalorimetryCaloTPG_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryCaloTPG_EX_USE := $(foreach d, self cmssw  FWCore/Framework CalibFormats/CaloTPG Geometry/CaloTopology Geometry/HcalTowerAlgo CalibCalorimetry/HcalTPGAlgos ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryCaloTPG_EX_LIB   := CalibCalorimetryCaloTPG
ALL_EXTERNAL_PRODS += CalibCalorimetryCaloTPG
CalibCalorimetryCaloTPG_CLASS := LIBRARY
CalibCalorimetry/CaloTPG_relbigobj+=CalibCalorimetryCaloTPG
endif
ifeq ($(strip $(CalibCalorimetryCaloTPGPlugins)),)
CalibCalorimetryCaloTPGPlugins := self/src/CalibCalorimetry/CaloTPG/plugins
CalibCalorimetryCaloTPGPlugins_LOC_USE := self cmssw  CalibCalorimetry/CaloTPG 
ALL_EXTERNAL_PLUGIN_PRODS += CalibCalorimetryCaloTPGPlugins
CalibCalorimetry/CaloTPG_relbigobj+=CalibCalorimetryCaloTPGPlugins
endif
ifeq ($(strip $(CalibCalorimetry/CastorCalib)),)
CalibCalorimetryCastorCalib := self/CalibCalorimetry/CastorCalib
CalibCalorimetry/CastorCalib := CalibCalorimetryCastorCalib
CalibCalorimetryCastorCalib_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryCastorCalib_EX_USE := $(foreach d, self cmssw  root clhep FWCore/Framework FWCore/MessageLogger DataFormats/HcalDetId DataFormats/HcalDigi CalibFormats/CastorObjects ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryCastorCalib_EX_LIB   := CalibCalorimetryCastorCalib
ALL_EXTERNAL_PRODS += CalibCalorimetryCastorCalib
CalibCalorimetryCastorCalib_CLASS := LIBRARY
CalibCalorimetry/CastorCalib_relbigobj+=CalibCalorimetryCastorCalib
endif
ifeq ($(strip $(CalibCalorimetryCastorPlugins)),)
CalibCalorimetryCastorPlugins := self/src/CalibCalorimetry/CastorCalib/plugins
CalibCalorimetryCastorPlugins_LOC_USE := self cmssw  CalibCalorimetry/CastorCalib CalibFormats/CastorObjects CommonTools/UtilAlgos CondFormats/DataRecord CondFormats/CastorObjects DataFormats/HcalDetId Geometry/ForwardGeometry FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CaloTopology 
ALL_EXTERNAL_PLUGIN_PRODS += CalibCalorimetryCastorPlugins
CalibCalorimetry/CastorCalib_relbigobj+=CalibCalorimetryCastorPlugins
endif
ifeq ($(strip $(CalibCalorimetry/HcalAlgos)),)
CalibCalorimetryHcalAlgos := self/CalibCalorimetry/HcalAlgos
CalibCalorimetry/HcalAlgos := CalibCalorimetryHcalAlgos
CalibCalorimetryHcalAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryHcalAlgos_EX_USE := $(foreach d, self cmssw  boost root clhep gsl FWCore/Framework FWCore/MessageLogger DataFormats/HcalDetId CondFormats/HcalObjects DataFormats/HcalDigi CalibFormats/HcalObjects ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryHcalAlgos_EX_LIB   := CalibCalorimetryHcalAlgos
ALL_EXTERNAL_PRODS += CalibCalorimetryHcalAlgos
CalibCalorimetryHcalAlgos_CLASS := LIBRARY
CalibCalorimetry/HcalAlgos_relbigobj+=CalibCalorimetryHcalAlgos
endif
ifeq ($(strip $(HcalPulseContainmentTest)),)
HcalPulseContainmentTest := self/src/CalibCalorimetry/HcalAlgos/plugins
HcalPulseContainmentTest_LOC_USE := self cmssw  CalibCalorimetry/HcalAlgos FWCore/Framework FWCore/ParameterSet 
ALL_EXTERNAL_PLUGIN_PRODS += HcalPulseContainmentTest
CalibCalorimetry/HcalAlgos_relbigobj+=HcalPulseContainmentTest
endif
ifeq ($(strip $(CalibCalorimetry/HcalPlugins)),)
CalibCalorimetryHcalPlugins := self/CalibCalorimetry/HcalPlugins
CalibCalorimetry/HcalPlugins := CalibCalorimetryHcalPlugins
CalibCalorimetryHcalPlugins_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryHcalPlugins_EX_USE := $(foreach d, self cmssw  CalibCalorimetry/HcalAlgos CalibFormats/HcalObjects CondFormats/DataRecord CondFormats/HcalObjects DataFormats/HcalDetId Geometry/ForwardGeometry FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CaloTopology ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += CalibCalorimetryHcalPlugins
CalibCalorimetryHcalPlugins_CLASS := LIBRARY
CalibCalorimetry/HcalPlugins_relbigobj+=CalibCalorimetryHcalPlugins
endif
ifeq ($(strip $(CalibCalorimetry/HcalTPGAlgos)),)
CalibCalorimetryHcalTPGAlgos := self/CalibCalorimetry/HcalTPGAlgos
CalibCalorimetry/HcalTPGAlgos := CalibCalorimetryHcalTPGAlgos
CalibCalorimetryHcalTPGAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryHcalTPGAlgos_EX_USE := $(foreach d, self cmssw  DataFormats/HcalDigi CalibFormats/HcalObjects Geometry/HcalTowerAlgo CalibCalorimetry/HcalAlgos DataFormats/HcalDetId Utilities/Xerces CondFormats/HcalObjects xerces-c md5 ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibCalorimetryHcalTPGAlgos_EX_LIB   := CalibCalorimetryHcalTPGAlgos
ALL_EXTERNAL_PRODS += CalibCalorimetryHcalTPGAlgos
CalibCalorimetryHcalTPGAlgos_CLASS := LIBRARY
CalibCalorimetry/HcalTPGAlgos_relbigobj+=CalibCalorimetryHcalTPGAlgos
endif
ifeq ($(strip $(CalibCalorimetry/HcalTPGEventSetup)),)
CalibCalorimetryHcalTPGEventSetup := self/CalibCalorimetry/HcalTPGEventSetup
CalibCalorimetry/HcalTPGEventSetup := CalibCalorimetryHcalTPGEventSetup
CalibCalorimetryHcalTPGEventSetup_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibCalorimetryHcalTPGEventSetup_EX_USE := $(foreach d, self cmssw  FWCore/Framework CalibCalorimetry/HcalTPGAlgos CalibFormats/HcalObjects ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += CalibCalorimetryHcalTPGEventSetup
CalibCalorimetryHcalTPGEventSetup_CLASS := LIBRARY
CalibCalorimetry/HcalTPGEventSetup_relbigobj+=CalibCalorimetryHcalTPGEventSetup
endif
ifeq ($(strip $(Calibration/EcalAlCaRecoProducers)),)
CalibrationEcalAlCaRecoProducers := self/Calibration/EcalAlCaRecoProducers
Calibration/EcalAlCaRecoProducers := CalibrationEcalAlCaRecoProducers
CalibrationEcalAlCaRecoProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationEcalAlCaRecoProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet DataFormats/EgammaCandidates DataFormats/EcalDetId ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += CalibrationEcalAlCaRecoProducers
CalibrationEcalAlCaRecoProducers_CLASS := LIBRARY
Calibration/EcalAlCaRecoProducers_relbigobj+=CalibrationEcalAlCaRecoProducers
endif
ifeq ($(strip $(CalibrationEcalAlCaRecoProducersAuto)),)
CalibrationEcalAlCaRecoProducersAuto := self/src/Calibration/EcalAlCaRecoProducers/plugins
CalibrationEcalAlCaRecoProducersAuto_LOC_USE := self cmssw  clhep CalibFormats/HcalObjects CalibFormats/SiStripObjects CalibTracker/Records CommonTools/UtilAlgos CondFormats/SiPixelObjects DataFormats/EgammaCandidates DataFormats/RecoCandidate DataFormats/TrackReco DataFormats/HLTReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalAlgo Geometry/EcalMapping Geometry/HcalTowerAlgo Geometry/Records 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationEcalAlCaRecoProducersAuto
Calibration/EcalAlCaRecoProducers_relbigobj+=CalibrationEcalAlCaRecoProducersAuto
endif
ifeq ($(strip $(CalibrationHcalAlCaRecoProducersPlugins)),)
CalibrationHcalAlCaRecoProducersPlugins := self/src/Calibration/HcalAlCaRecoProducers/plugins
CalibrationHcalAlCaRecoProducersPlugins_LOC_USE := self cmssw  Calibration/IsolatedParticles CommonTools/UtilAlgos CondFormats/DataRecord CondFormats/HcalObjects DataFormats/CaloTowers DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaReco DataFormats/FEDRawData DataFormats/HcalCalibObjects DataFormats/HcalIsolatedTrack DataFormats/HcalRecHit DataFormats/JetReco DataFormats/Luminosity DataFormats/METReco DataFormats/RecoCandidate DataFormats/Scalers FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet HLTrigger/HLTcore RecoLocalCalo/EcalRecAlgos RecoLocalCalo/HcalRecAlgos TrackPropagation/SteppingHelixPropagator rootphysics boost hls clhep root 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationHcalAlCaRecoProducersPlugins
Calibration/HcalAlCaRecoProducers_relbigobj+=CalibrationHcalAlCaRecoProducersPlugins
endif
ifeq ($(strip $(Calibration/HcalCalibAlgos)),)
CalibrationHcalCalibAlgos := self/Calibration/HcalCalibAlgos
Calibration/HcalCalibAlgos := CalibrationHcalCalibAlgos
CalibrationHcalCalibAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationHcalCalibAlgos_EX_USE := $(foreach d, self cmssw  root rootgraphics rootminuit FWCore/Utilities CommonTools/UtilAlgos DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/DetId DataFormats/HcalRecHit Geometry/HcalTowerAlgo CondTools/Hcal Calibration/Tools DataFormats/EcalRecHit DataFormats/GeometryVector Geometry/CaloGeometry Geometry/CaloTopology Utilities/Xerces ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationHcalCalibAlgos_LCGDICTS  := x 
CalibrationHcalCalibAlgos_EX_LIB   := CalibrationHcalCalibAlgos
ALL_EXTERNAL_PRODS += CalibrationHcalCalibAlgos
CalibrationHcalCalibAlgos_CLASS := LIBRARY
Calibration/HcalCalibAlgos_relbigobj+=CalibrationHcalCalibAlgos
endif
ifeq ($(strip $(CalibrationHcalCalibAlgosPlugins)),)
CalibrationHcalCalibAlgosPlugins := self/src/Calibration/HcalCalibAlgos/plugins
CalibrationHcalCalibAlgosPlugins_LOC_USE := self cmssw  Calibration/HcalCalibAlgos CondFormats/HcalObjects CondFormats/L1TObjects DataFormats/Common DataFormats/DetId DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/HcalRecHit DataFormats/JetReco DataFormats/L1GlobalTrigger DataFormats/TrackReco DataFormats/HcalIsolatedTrack FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities Geometry/Records HLTrigger/HLTcore Calibration/IsolatedParticles rootphysics boost root clhep hepmc CommonTools/UtilAlgos TrackingTools/TrackAssociator 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationHcalCalibAlgosPlugins
Calibration/HcalCalibAlgos_relbigobj+=CalibrationHcalCalibAlgosPlugins
endif
ifeq ($(strip $(Calibration/IsolatedParticles)),)
CalibrationIsolatedParticles := self/Calibration/IsolatedParticles
Calibration/IsolatedParticles := CalibrationIsolatedParticles
CalibrationIsolatedParticles_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CalibrationIsolatedParticles_EX_USE := $(foreach d, self cmssw  clhep boost root FWCore/Framework MagneticField/Engine DataFormats/DetId DataFormats/EcalDetId DataFormats/HcalDetId DataFormats/EcalRecHit DataFormats/HcalRecHit DataFormats/Common DataFormats/TrackReco SimDataFormats/CaloHit SimDataFormats/Track SimDataFormats/GeneratorProducts SimDataFormats/Vertex SimTracker/TrackerHitAssociation SimGeneral/HepPDTRecord Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalAlgo Geometry/HcalTowerAlgo RecoLocalCalo/EcalRecAlgos TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/TrackAssociator ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CalibrationIsolatedParticles_EX_LIB   := CalibrationIsolatedParticles
ALL_EXTERNAL_PRODS += CalibrationIsolatedParticles
CalibrationIsolatedParticles_CLASS := LIBRARY
Calibration/IsolatedParticles_relbigobj+=CalibrationIsolatedParticles
endif
ifeq ($(strip $(CalibrationElectronStudy)),)
CalibrationElectronStudy := self/src/Calibration/IsolatedParticles/plugins
CalibrationElectronStudy_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationElectronStudy
Calibration/IsolatedParticles_relbigobj+=CalibrationElectronStudy
endif
ifeq ($(strip $(CalibrationHcalRaddamMuon)),)
CalibrationHcalRaddamMuon := self/src/Calibration/IsolatedParticles/plugins
CalibrationHcalRaddamMuon_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationHcalRaddamMuon
Calibration/IsolatedParticles_relbigobj+=CalibrationHcalRaddamMuon
endif
ifeq ($(strip $(CalibrationIsoTrackCalib)),)
CalibrationIsoTrackCalib := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsoTrackCalib_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsoTrackCalib
Calibration/IsolatedParticles_relbigobj+=CalibrationIsoTrackCalib
endif
ifeq ($(strip $(CalibrationIsoTrackCalibration)),)
CalibrationIsoTrackCalibration := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsoTrackCalibration_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsoTrackCalibration
Calibration/IsolatedParticles_relbigobj+=CalibrationIsoTrackCalibration
endif
ifeq ($(strip $(CalibrationIsoTrig)),)
CalibrationIsoTrig := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsoTrig_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsoTrig
Calibration/IsolatedParticles_relbigobj+=CalibrationIsoTrig
endif
ifeq ($(strip $(CalibrationIsolatedGenParticles)),)
CalibrationIsolatedGenParticles := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsolatedGenParticles_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsolatedGenParticles
Calibration/IsolatedParticles_relbigobj+=CalibrationIsolatedGenParticles
endif
ifeq ($(strip $(CalibrationIsolatedParticlesGeneratedJets)),)
CalibrationIsolatedParticlesGeneratedJets := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsolatedParticlesGeneratedJets_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsolatedParticlesGeneratedJets
Calibration/IsolatedParticles_relbigobj+=CalibrationIsolatedParticlesGeneratedJets
endif
ifeq ($(strip $(CalibrationIsolatedTracksCone)),)
CalibrationIsolatedTracksCone := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsolatedTracksCone_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsolatedTracksCone
Calibration/IsolatedParticles_relbigobj+=CalibrationIsolatedTracksCone
endif
ifeq ($(strip $(CalibrationIsolatedTracksHcalScale)),)
CalibrationIsolatedTracksHcalScale := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsolatedTracksHcalScale_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsolatedTracksHcalScale
Calibration/IsolatedParticles_relbigobj+=CalibrationIsolatedTracksHcalScale
endif
ifeq ($(strip $(CalibrationIsolatedTracksNxN)),)
CalibrationIsolatedTracksNxN := self/src/Calibration/IsolatedParticles/plugins
CalibrationIsolatedTracksNxN_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationIsolatedTracksNxN
Calibration/IsolatedParticles_relbigobj+=CalibrationIsolatedTracksNxN
endif
ifeq ($(strip $(CalibrationStudyCaloGen)),)
CalibrationStudyCaloGen := self/src/Calibration/IsolatedParticles/plugins
CalibrationStudyCaloGen_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationStudyCaloGen
Calibration/IsolatedParticles_relbigobj+=CalibrationStudyCaloGen
endif
ifeq ($(strip $(CalibrationStudyCaloResponse)),)
CalibrationStudyCaloResponse := self/src/Calibration/IsolatedParticles/plugins
CalibrationStudyCaloResponse_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationStudyCaloResponse
Calibration/IsolatedParticles_relbigobj+=CalibrationStudyCaloResponse
endif
ifeq ($(strip $(CalibrationStudyTriggerHLT)),)
CalibrationStudyTriggerHLT := self/src/Calibration/IsolatedParticles/plugins
CalibrationStudyTriggerHLT_LOC_USE := self cmssw  clhep boost root rootgraphics DataFormats/Common DataFormats/DetId DataFormats/L1GlobalTrigger DataFormats/L1Trigger DataFormats/TrackReco DataFormats/VertexReco DataFormats/JetReco DataFormats/Luminosity L1Trigger/GlobalTriggerAnalyzer SimGeneral/HepPDTRecord SimDataFormats/GeneratorProducts SimDataFormats/Vertex CondFormats/DataRecord CondFormats/L1TObjects FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/MessageLogger FWCore/Utilities CommonTools/UtilAlgos Geometry/Records MagneticField/Engine MagneticField/Records TrackingTools/TrackAssociator RecoJets/JetProducers HLTrigger/HLTcore Calibration/IsolatedParticles DataFormats/HcalIsolatedTrack 
ALL_EXTERNAL_PLUGIN_PRODS += CalibrationStudyTriggerHLT
Calibration/IsolatedParticles_relbigobj+=CalibrationStudyTriggerHLT
endif
ifeq ($(strip $(CaloOnlineTools/HcalOnlineDb)),)
CaloOnlineToolsHcalOnlineDb := self/CaloOnlineTools/HcalOnlineDb
CaloOnlineTools/HcalOnlineDb := CaloOnlineToolsHcalOnlineDb
CaloOnlineToolsHcalOnlineDb_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CaloOnlineToolsHcalOnlineDb_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet boost oracle xerces-c zlib DataFormats/HcalDetId CalibCalorimetry/CaloTPG CalibCalorimetry/HcalAlgos CalibCalorimetry/HcalTPGAlgos Geometry/CaloTopology OnlineDB/Oracle SimCalorimetry/HcalTrigPrimAlgos root rootgraphics ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CaloOnlineToolsHcalOnlineDb_EX_LIB   := CaloOnlineToolsHcalOnlineDb
ALL_EXTERNAL_PRODS += CaloOnlineToolsHcalOnlineDb
CaloOnlineToolsHcalOnlineDb_CLASS := LIBRARY
CaloOnlineTools/HcalOnlineDb_relbigobj+=CaloOnlineToolsHcalOnlineDb
endif
ifeq ($(strip $(CaloOnlineToolsHcalOnlineDbPlugins)),)
CaloOnlineToolsHcalOnlineDbPlugins := self/src/CaloOnlineTools/HcalOnlineDb/plugins
CaloOnlineToolsHcalOnlineDbPlugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet boost xerces-c zlib DataFormats/HcalDetId CalibCalorimetry/HcalTPGAlgos CaloOnlineTools/HcalOnlineDb 
ALL_EXTERNAL_PLUGIN_PRODS += CaloOnlineToolsHcalOnlineDbPlugins
CaloOnlineTools/HcalOnlineDb_relbigobj+=CaloOnlineToolsHcalOnlineDbPlugins
endif
ifeq ($(strip $(CommonTools/ParticleFlow)),)
CommonToolsParticleFlow := self/CommonTools/ParticleFlow
CommonTools/ParticleFlow := CommonToolsParticleFlow
CommonToolsParticleFlow_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CommonToolsParticleFlow_EX_USE := $(foreach d, self cmssw  DataFormats/Common DataFormats/ParticleFlowCandidate DataFormats/EgammaCandidates DataFormats/METReco DataFormats/JetReco DataFormats/PatCandidates rootmath FWCore/ParameterSet ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CommonToolsParticleFlow_EX_LIB   := CommonToolsParticleFlow
ALL_EXTERNAL_PRODS += CommonToolsParticleFlow
CommonToolsParticleFlow_CLASS := LIBRARY
CommonTools/ParticleFlow_relbigobj+=CommonToolsParticleFlow
endif
ifeq ($(strip $(CommonToolsParticleFlow_plugins)),)
CommonToolsParticleFlow_plugins := self/src/CommonTools/ParticleFlow/plugins
CommonToolsParticleFlow_plugins_LOC_USE := self cmssw  DataFormats/ParticleFlowCandidate DataFormats/JetReco DataFormats/TauReco DataFormats/METReco DataFormats/TrackReco DataFormats/VertexReco PhysicsTools/IsolationAlgos FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet CommonTools/Utils CommonTools/ParticleFlow CalibFormats/HcalObjects Geometry/HcalTowerAlgo 
ALL_EXTERNAL_PLUGIN_PRODS += CommonToolsParticleFlow_plugins
CommonTools/ParticleFlow_relbigobj+=CommonToolsParticleFlow_plugins
endif
ifeq ($(strip $(CondCore/HcalPlugins)),)
CondCoreHcalPlugins := self/CondCore/HcalPlugins
CondCore/HcalPlugins := CondCoreHcalPlugins
CondCoreHcalPlugins_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondCoreHcalPlugins_EX_USE := $(foreach d, self cmssw  CondCore/ESSources CondFormats/HcalObjects CondFormats/DataRecord ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += CondCoreHcalPlugins
CondCoreHcalPlugins_CLASS := LIBRARY
CondCore/HcalPlugins_relbigobj+=CondCoreHcalPlugins
endif
ifeq ($(strip $(HcalChannelQuality_PayloadInspector)),)
HcalChannelQuality_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalChannelQuality_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalChannelQuality_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalChannelQuality_PayloadInspector
endif
ifeq ($(strip $(HcalGains_PayloadInspector)),)
HcalGains_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalGains_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalGains_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalGains_PayloadInspector
endif
ifeq ($(strip $(HcalL1TriggerObjects_PayloadInspector)),)
HcalL1TriggerObjects_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalL1TriggerObjects_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalL1TriggerObjects_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalL1TriggerObjects_PayloadInspector
endif
ifeq ($(strip $(HcalPedestalWidths_PayloadInspector)),)
HcalPedestalWidths_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalPedestalWidths_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalPedestalWidths_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalPedestalWidths_PayloadInspector
endif
ifeq ($(strip $(HcalPedestals_PayloadInspector)),)
HcalPedestals_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalPedestals_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalPedestals_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalPedestals_PayloadInspector
endif
ifeq ($(strip $(HcalRecoParams_PayloadInspector)),)
HcalRecoParams_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalRecoParams_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalRecoParams_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalRecoParams_PayloadInspector
endif
ifeq ($(strip $(HcalRespCorrs_PayloadInspector)),)
HcalRespCorrs_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalRespCorrs_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalRespCorrs_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalRespCorrs_PayloadInspector
endif
ifeq ($(strip $(HcalSiPMCharacteristics_PayloadInspector)),)
HcalSiPMCharacteristics_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalSiPMCharacteristics_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalSiPMCharacteristics_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalSiPMCharacteristics_PayloadInspector
endif
ifeq ($(strip $(HcalSiPMParameters_PayloadInspector)),)
HcalSiPMParameters_PayloadInspector := self/src/CondCore/HcalPlugins/plugins
HcalSiPMParameters_PayloadInspector_LOC_USE := self cmssw  CondCore/Utilities CondCore/CondDB CondFormats/HcalObjects 
ALL_EXTERNAL_PLUGIN_PRODS += HcalSiPMParameters_PayloadInspector
CondCore/HcalPlugins_relbigobj+=HcalSiPMParameters_PayloadInspector
endif
ifeq ($(strip $(CondFormats/HcalObjects)),)
CondFormatsHcalObjects := self/CondFormats/HcalObjects
CondFormats/HcalObjects := CondFormatsHcalObjects
CondFormatsHcalObjects_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondFormatsHcalObjects_EX_USE := $(foreach d, self cmssw  boost_serialization CondFormats/Serialization DataFormats/DetId DataFormats/HcalDetId FWCore/MessageLogger FWCore/Utilities Geometry/CaloTopology HeterogeneousCore/CUDACore HeterogeneousCore/CUDAUtilities ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondFormatsHcalObjects_LCGDICTS  := x 
CondFormatsHcalObjects_EX_LIB   := CondFormatsHcalObjects
ALL_EXTERNAL_PRODS += CondFormatsHcalObjects
CondFormatsHcalObjects_CLASS := LIBRARY
CondFormats/HcalObjects_relbigobj+=CondFormatsHcalObjects
endif
ifeq ($(strip $(CondToolsGeometryPlugins)),)
CondToolsGeometryPlugins := self/src/CondTools/Geometry/plugins
CondToolsGeometryPlugins_LOC_USE := self cmssw  root CondCore/DBOutputService CondFormats/Common CondFormats/GeometryObjects DataFormats/Math DetectorDescription/Core DetectorDescription/DDCMS FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder Geometry/TrackerNumberingBuilder Geometry/CaloGeometry Geometry/EcalAlgo Geometry/HcalCommonData Geometry/HcalTowerAlgo Geometry/ForwardGeometry Geometry/CSCGeometryBuilder Geometry/DTGeometry Geometry/DTGeometryBuilder Geometry/RPCGeometry Geometry/RPCGeometryBuilder Geometry/GEMGeometry Geometry/GEMGeometryBuilder Geometry/MuonNumbering Geometry/HGCalGeometry Geometry/VeryForwardGeometryBuilder dd4hep 
ALL_EXTERNAL_PLUGIN_PRODS += CondToolsGeometryPlugins
CondTools/Geometry_relbigobj+=CondToolsGeometryPlugins
endif
ifeq ($(strip $(CondTools/Hcal)),)
CondToolsHcal := self/CondTools/Hcal
CondTools/Hcal := CondToolsHcal
CondToolsHcal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
CondToolsHcal_EX_USE := $(foreach d, self cmssw  FWCore/Framework Utilities/Xerces DataFormats/HcalDetId CalibCalorimetry/HcalAlgos CalibCalorimetry/CastorCalib CondFormats/HcalObjects CondFormats/CastorObjects CalibFormats/HcalObjects RelationalAccess CondCore/PopCon xerces-c ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
CondToolsHcal_EX_LIB   := CondToolsHcal
ALL_EXTERNAL_PRODS += CondToolsHcal
CondToolsHcal_CLASS := LIBRARY
CondTools/Hcal_relbigobj+=CondToolsHcal
endif
ifeq ($(strip $(CondToolsHcalPlugin)),)
CondToolsHcalPlugin := self/src/CondTools/Hcal/plugins
CondToolsHcalPlugin_LOC_USE := self cmssw  boost FWCore/Framework CalibCalorimetry/HcalAlgos CondFormats/HcalObjects CalibFormats/HcalObjects CondTools/Hcal RelationalAccess CondCore/PopCon xerces-c 
ALL_EXTERNAL_PLUGIN_PRODS += CondToolsHcalPlugin
CondTools/Hcal_relbigobj+=CondToolsHcalPlugin
endif
ifeq ($(strip $(DPGAnalysisHcalToolsAuto)),)
DPGAnalysisHcalToolsAuto := self/src/DPGAnalysis/HcalTools/plugins
DPGAnalysisHcalToolsAuto_LOC_USE := self cmssw  root DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/HcalRecHit DataFormats/L1GlobalTrigger CondFormats/HcalObjects CondFormats/DataRecord EventFilter/HcalRawToDigi Geometry/CaloGeometry Geometry/HcalCommonData Geometry/Records Geometry/CaloTopology Geometry/HcalTowerAlgo DataFormats/FEDRawData CalibFormats/HcalObjects CalibCalorimetry/HcalAlgos FWCore/ServiceRegistry CommonTools/UtilAlgos 
ALL_EXTERNAL_PLUGIN_PRODS += DPGAnalysisHcalToolsAuto
DPGAnalysis/HcalTools_relbigobj+=DPGAnalysisHcalToolsAuto
endif
ifeq ($(strip $(EventFilter/CastorRawToDigi)),)
EventFilterCastorRawToDigi := self/EventFilter/CastorRawToDigi
EventFilter/CastorRawToDigi := EventFilterCastorRawToDigi
EventFilterCastorRawToDigi_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
EventFilterCastorRawToDigi_EX_USE := $(foreach d, self cmssw  DataFormats/HcalDetId DataFormats/HcalDigi DataFormats/FEDRawData FWCore/MessageLogger CondFormats/CastorObjects FWCore/Utilities EventFilter/HcalRawToDigi boost ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
EventFilterCastorRawToDigi_EX_LIB   := EventFilterCastorRawToDigi
ALL_EXTERNAL_PRODS += EventFilterCastorRawToDigi
EventFilterCastorRawToDigi_CLASS := LIBRARY
EventFilter/CastorRawToDigi_relbigobj+=EventFilterCastorRawToDigi
endif
ifeq ($(strip $(EventFilterCastorRawToDigiPlugins)),)
EventFilterCastorRawToDigiPlugins := self/src/EventFilter/CastorRawToDigi/plugins
EventFilterCastorRawToDigiPlugins_LOC_USE := self cmssw  DataFormats/HcalDigi DataFormats/FEDRawData CalibFormats/CastorObjects FWCore/Framework FWCore/MessageLogger boost EventFilter/CastorRawToDigi 
ALL_EXTERNAL_PLUGIN_PRODS += EventFilterCastorRawToDigiPlugins
EventFilter/CastorRawToDigi_relbigobj+=EventFilterCastorRawToDigiPlugins
endif
ifeq ($(strip $(FastSimulation/CaloGeometryTools)),)
FastSimulationCaloGeometryTools := self/FastSimulation/CaloGeometryTools
FastSimulation/CaloGeometryTools := FastSimulationCaloGeometryTools
FastSimulationCaloGeometryTools_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationCaloGeometryTools_EX_USE := $(foreach d, self cmssw  DataFormats/DetId DataFormats/EcalDetId DataFormats/GeometryVector DataFormats/Math FWCore/MessageLogger FWCore/ParameterSet FastSimulation/CalorimeterProperties Geometry/CaloGeometry Geometry/CaloTopology Geometry/EcalAlgo Geometry/HcalTowerAlgo clhep rootmath ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationCaloGeometryTools_EX_LIB   := FastSimulationCaloGeometryTools
ALL_EXTERNAL_PRODS += FastSimulationCaloGeometryTools
FastSimulationCaloGeometryTools_CLASS := LIBRARY
FastSimulation/CaloGeometryTools_relbigobj+=FastSimulationCaloGeometryTools
endif
ifeq ($(strip $(FastSimulation/Calorimetry)),)
FastSimulationCalorimetry := self/FastSimulation/Calorimetry
FastSimulation/Calorimetry := FastSimulationCalorimetry
FastSimulationCalorimetry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationCalorimetry_EX_USE := $(foreach d, self cmssw  DataFormats/DetId DataFormats/HcalDetId FWCore/MessageLogger FWCore/ParameterSet SimG4CMS/Calo FastSimulation/CaloGeometryTools FastSimulation/CaloHitMakers FastSimulation/Event FastSimulation/ShowerDevelopment FastSimulation/Utilities FastSimulation/MaterialEffects FastSimulation/ParticlePropagator Geometry/HcalTowerAlgo ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationCalorimetry_EX_LIB   := FastSimulationCalorimetry
ALL_EXTERNAL_PRODS += FastSimulationCalorimetry
FastSimulationCalorimetry_CLASS := LIBRARY
FastSimulation/Calorimetry_relbigobj+=FastSimulationCalorimetry
endif
ifeq ($(strip $(FastSimulation/ShowerDevelopment)),)
FastSimulationShowerDevelopment := self/FastSimulation/ShowerDevelopment
FastSimulation/ShowerDevelopment := FastSimulationShowerDevelopment
FastSimulationShowerDevelopment_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationShowerDevelopment_EX_USE := $(foreach d, self cmssw  DataFormats/Math FWCore/MessageLogger FWCore/ParameterSet FastSimulation/CaloHitMakers FastSimulation/CalorimeterProperties FastSimulation/Utilities clhep ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationShowerDevelopment_EX_LIB   := FastSimulationShowerDevelopment
ALL_EXTERNAL_PRODS += FastSimulationShowerDevelopment
FastSimulationShowerDevelopment_CLASS := LIBRARY
FastSimulation/ShowerDevelopment_relbigobj+=FastSimulationShowerDevelopment
endif
ifeq ($(strip $(FastSimulation/SimplifiedGeometryPropagator)),)
FastSimulationSimplifiedGeometryPropagator := self/FastSimulation/SimplifiedGeometryPropagator
FastSimulation/SimplifiedGeometryPropagator := FastSimulationSimplifiedGeometryPropagator
FastSimulationSimplifiedGeometryPropagator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationSimplifiedGeometryPropagator_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/Utilities FWCore/PluginManager DataFormats/GeometryVector SimDataFormats/Track SimDataFormats/Vertex DataFormats/Math MagneticField/Engine MagneticField/Records RecoTracker/Record RecoTracker/TkDetLayers FWCore/ServiceRegistry GeneratorInterface/Pythia8Interface pythia8 heppdt clhep hepmc rootcore geant4core ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationSimplifiedGeometryPropagator_EX_LIB   := FastSimulationSimplifiedGeometryPropagator
ALL_EXTERNAL_PRODS += FastSimulationSimplifiedGeometryPropagator
FastSimulationSimplifiedGeometryPropagator_CLASS := LIBRARY
FastSimulation/SimplifiedGeometryPropagator_relbigobj+=FastSimulationSimplifiedGeometryPropagator
endif
ifeq ($(strip $(FastSimulationSimplifiedGeometryPropagatorAuto)),)
FastSimulationSimplifiedGeometryPropagatorAuto := self/src/FastSimulation/SimplifiedGeometryPropagator/plugins
FastSimulationSimplifiedGeometryPropagatorAuto_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet TrackingTools/DetLayers TrackingTools/TrajectoryState TrackingTools/GeomPropagators RecoTracker/DeDx FastSimulation/TrajectoryManager FastSimulation/SimplifiedGeometryPropagator FastSimulation/Calorimetry FastSimulation/CaloGeometryTools FastSimulation/ShowerDevelopment Geometry/Records Geometry/CaloGeometry DataFormats/Math hepmc clhep 
ALL_EXTERNAL_PLUGIN_PRODS += FastSimulationSimplifiedGeometryPropagatorAuto
FastSimulation/SimplifiedGeometryPropagator_relbigobj+=FastSimulationSimplifiedGeometryPropagatorAuto
endif
ifeq ($(strip $(Fireworks/Geometry)),)
FireworksGeometry := self/Fireworks/Geometry
Fireworks/Geometry := FireworksGeometry
FireworksGeometry_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FireworksGeometry_EX_USE := $(foreach d, self cmssw  FWCore/PluginManager FWCore/Framework Geometry/CommonDetUnit Geometry/CaloGeometry Geometry/HGCalGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/GEMGeometry Geometry/TrackerGeometryBuilder Geometry/Records DataFormats/GeometrySurface DataFormats/MuonDetId RecoLocalCalo/HGCalRecAlgos Fireworks/Core rootcore rootgeom rooteve rootphysics ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FireworksGeometry_EX_LIB   := FireworksGeometry
ALL_EXTERNAL_PRODS += FireworksGeometry
FireworksGeometry_CLASS := LIBRARY
Fireworks/Geometry_relbigobj+=FireworksGeometry
endif
ifeq ($(strip $(FireworksDisplayGeomPlugin)),)
FireworksDisplayGeomPlugin := self/src/Fireworks/Geometry/plugins
FireworksDisplayGeomPlugin_LOC_USE := self cmssw  FWCore/Framework Fireworks/Geometry Fireworks/Eve rooteve rootgeom rootphysics rootrgl MagneticField/Engine MagneticField/Records 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksDisplayGeomPlugin
Fireworks/Geometry_relbigobj+=FireworksDisplayGeomPlugin
endif
ifeq ($(strip $(FireworksGeometryDumpFWRecoGeometryPlugin)),)
FireworksGeometryDumpFWRecoGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryDumpFWRecoGeometryPlugin_LOC_USE := self cmssw  Fireworks/Geometry rooteve rootgeom rootcore FWCore/Framework FWCore/ParameterSet Geometry/CaloGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/TrackerGeometryBuilder Geometry/Records 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryDumpFWRecoGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryDumpFWRecoGeometryPlugin
endif
ifeq ($(strip $(FireworksGeometryDumpFWTGeoRecoGeometryPlugin)),)
FireworksGeometryDumpFWTGeoRecoGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryDumpFWTGeoRecoGeometryPlugin_LOC_USE := self cmssw  Fireworks/Geometry rooteve rootgeom rootcore FWCore/Framework FWCore/ParameterSet Geometry/CaloGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/RPCGeometry Geometry/TrackerGeometryBuilder Geometry/Records 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryDumpFWTGeoRecoGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryDumpFWTGeoRecoGeometryPlugin
endif
ifeq ($(strip $(FireworksGeometryDumpSimGeometryPlugin)),)
FireworksGeometryDumpSimGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryDumpSimGeometryPlugin_LOC_USE := self cmssw  Fireworks/Geometry FWCore/Framework FWCore/ParameterSet rootgeom 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryDumpSimGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryDumpSimGeometryPlugin
endif
ifeq ($(strip $(FireworksGeometryFWRecoGeometryESProducerPlugin)),)
FireworksGeometryFWRecoGeometryESProducerPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryFWRecoGeometryESProducerPlugin_LOC_USE := self cmssw  Fireworks/Geometry 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryFWRecoGeometryESProducerPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryFWRecoGeometryESProducerPlugin
endif
ifeq ($(strip $(FireworksGeometryFWTGeoRecoGeometryESProducerPlugin)),)
FireworksGeometryFWTGeoRecoGeometryESProducerPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryFWTGeoRecoGeometryESProducerPlugin_LOC_USE := self cmssw  Fireworks/Geometry 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryFWTGeoRecoGeometryESProducerPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryFWTGeoRecoGeometryESProducerPlugin
endif
ifeq ($(strip $(FireworksGeometryMFProducerPlugin)),)
FireworksGeometryMFProducerPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryMFProducerPlugin_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet clhep MagneticField/Engine MagneticField/Records rootgpad 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryMFProducerPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryMFProducerPlugin
endif
ifeq ($(strip $(FireworksGeometryPlugins)),)
FireworksGeometryPlugins := self/src/Fireworks/Geometry/plugins
FireworksGeometryPlugins_LOC_USE := self cmssw  Geometry/Records Fireworks/Geometry rootgpad rooteve rootgeom 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryPlugins
Fireworks/Geometry_relbigobj+=FireworksGeometryPlugins
endif
ifeq ($(strip $(FireworksGeometryTGeoMgrFromDddPlugin)),)
FireworksGeometryTGeoMgrFromDddPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryTGeoMgrFromDddPlugin_LOC_USE := self cmssw  DetectorDescription/Core Fireworks/Geometry 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryTGeoMgrFromDddPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryTGeoMgrFromDddPlugin
endif
ifeq ($(strip $(FireworksGeometryValidateGeometryPlugin)),)
FireworksGeometryValidateGeometryPlugin := self/src/Fireworks/Geometry/plugins
FireworksGeometryValidateGeometryPlugin_LOC_USE := self cmssw  FWCore/Framework Geometry/RPCGeometry Geometry/DTGeometry Geometry/CSCGeometry Geometry/CaloGeometry Geometry/TrackerGeometryBuilder Geometry/Records Fireworks/Core Fireworks/Tracks rootcore rootgeom 
ALL_EXTERNAL_PLUGIN_PRODS += FireworksGeometryValidateGeometryPlugin
Fireworks/Geometry_relbigobj+=FireworksGeometryValidateGeometryPlugin
endif
ifeq ($(strip $(GeneratorInterface/RivetInterface)),)
GeneratorInterfaceRivetInterface := self/GeneratorInterface/RivetInterface
GeneratorInterface/RivetInterface := GeneratorInterfaceRivetInterface
GeneratorInterfaceRivetInterface_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
GeneratorInterfaceRivetInterface_EX_USE := $(foreach d, self cmssw  rivet yoda fastjet clhep boost gsl root ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += GeneratorInterfaceRivetInterface
GeneratorInterfaceRivetInterface_CLASS := LIBRARY
GeneratorInterface/RivetInterface_relbigobj+=GeneratorInterfaceRivetInterface
endif
ifeq ($(strip $(GeneratorInterfaceRivetInterface_plugins)),)
GeneratorInterfaceRivetInterface_plugins := self/src/GeneratorInterface/RivetInterface/plugins
GeneratorInterfaceRivetInterface_plugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ServiceRegistry SimDataFormats/GeneratorProducts DataFormats/Common rivet yoda gsl tinyxml2 DQMServices/Core SimGeneral/HepPDTRecord DataFormats/HepMCCandidate DataFormats/METReco DataFormats/PatCandidates 
ALL_EXTERNAL_PLUGIN_PRODS += GeneratorInterfaceRivetInterface_plugins
GeneratorInterface/RivetInterface_relbigobj+=GeneratorInterfaceRivetInterface_plugins
endif
ifeq ($(strip $(JetMETCorrections/MinBias)),)
JetMETCorrectionsMinBias := self/JetMETCorrections/MinBias
JetMETCorrections/MinBias := JetMETCorrectionsMinBias
JetMETCorrectionsMinBias_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
JetMETCorrectionsMinBias_EX_USE := $(foreach d, self cmssw  DataFormats/HcalRecHit Geometry/HcalTowerAlgo CommonTools/UtilAlgos Geometry/Records root ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += JetMETCorrectionsMinBias
JetMETCorrectionsMinBias_CLASS := LIBRARY
JetMETCorrections/MinBias_relbigobj+=JetMETCorrectionsMinBias
endif
ifeq ($(strip $(L1Trigger/L1CaloTrigger)),)
L1TriggerL1CaloTrigger := self/L1Trigger/L1CaloTrigger
L1Trigger/L1CaloTrigger := L1TriggerL1CaloTrigger
L1TriggerL1CaloTrigger_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerL1CaloTrigger_EX_USE := $(foreach d, self cmssw  FWCore/ParameterSet clhep ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1CaloTrigger_EX_LIB   := L1TriggerL1CaloTrigger
ALL_EXTERNAL_PRODS += L1TriggerL1CaloTrigger
L1TriggerL1CaloTrigger_CLASS := LIBRARY
L1Trigger/L1CaloTrigger_relbigobj+=L1TriggerL1CaloTrigger
endif
ifeq ($(strip $(L1TriggerL1CaloTriggerAuto)),)
L1TriggerL1CaloTriggerAuto := self/src/L1Trigger/L1CaloTrigger/plugins
L1TriggerL1CaloTriggerAuto_LOC_USE := self cmssw  FWCore/Framework Geometry/CaloGeometry Geometry/HcalTowerAlgo Geometry/EcalAlgo DataFormats/L1TCalorimeterPhase2 DataFormats/L1Trigger DataFormats/HcalDetId DataFormats/EcalDigi DataFormats/HcalDigi DataFormats/JetReco CalibFormats/CaloTPG L1Trigger/L1CaloTrigger DataFormats/L1THGCal L1Trigger/L1TCalorimeter FWCore/ParameterSet root boost 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1CaloTriggerAuto
L1Trigger/L1CaloTrigger_relbigobj+=L1TriggerL1CaloTriggerAuto
endif
ifeq ($(strip $(L1Trigger/L1TCaloLayer1)),)
L1TriggerL1TCaloLayer1 := self/L1Trigger/L1TCaloLayer1
L1Trigger/L1TCaloLayer1 := L1TriggerL1TCaloLayer1
L1TriggerL1TCaloLayer1_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerL1TCaloLayer1_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/MessageLogger DataFormats/HcalDigi CondFormats/L1TObjects CalibFormats/CaloTPG L1Trigger/L1TCalorimeter CondFormats/DataRecord Geometry/HcalTowerAlgo Geometry/Records ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1TCaloLayer1_EX_LIB   := L1TriggerL1TCaloLayer1
ALL_EXTERNAL_PRODS += L1TriggerL1TCaloLayer1
L1TriggerL1TCaloLayer1_CLASS := LIBRARY
L1Trigger/L1TCaloLayer1_relbigobj+=L1TriggerL1TCaloLayer1
endif
ifeq ($(strip $(L1TriggerL1TCaloLayer1Auto)),)
L1TriggerL1TCaloLayer1Auto := self/src/L1Trigger/L1TCaloLayer1/plugins
L1TriggerL1TCaloLayer1Auto_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet DataFormats/HcalDigi DataFormats/EcalDigi DataFormats/L1TCalorimeter L1Trigger/L1TCalorimeter L1Trigger/L1TCaloLayer1 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1TCaloLayer1Auto
L1Trigger/L1TCaloLayer1_relbigobj+=L1TriggerL1TCaloLayer1Auto
endif
ifeq ($(strip $(L1Trigger/L1THGCal)),)
L1TriggerL1THGCal := self/L1Trigger/L1THGCal
L1Trigger/L1THGCal := L1TriggerL1THGCal
L1TriggerL1THGCal_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerL1THGCal_EX_USE := $(foreach d, self cmssw  DataFormats/L1Trigger FWCore/Framework Geometry/HGCalGeometry Geometry/CaloTopology Geometry/Records DataFormats/L1THGCal SimDataFormats/CaloTest PhysicsTools/TensorFlow json ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1THGCal_EX_LIB   := L1TriggerL1THGCal
ALL_EXTERNAL_PRODS += L1TriggerL1THGCal
L1TriggerL1THGCal_CLASS := LIBRARY
L1Trigger/L1THGCal_relbigobj+=L1TriggerL1THGCal
endif
ifeq ($(strip $(L1TriggerL1THGCalPlugins)),)
L1TriggerL1THGCalPlugins := self/src/L1Trigger/L1THGCal/plugins
L1TriggerL1THGCalPlugins_LOC_USE := self cmssw  L1Trigger/L1THGCal Geometry/Records 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1THGCalPlugins
L1Trigger/L1THGCal_relbigobj+=L1TriggerL1THGCalPlugins
endif
ifeq ($(strip $(L1TriggerL1THGCalPlugins_fe_be)),)
L1TriggerL1THGCalPlugins_fe_be := self/src/L1Trigger/L1THGCal/plugins
L1TriggerL1THGCalPlugins_fe_be_LOC_USE := self cmssw  CommonTools/MVAUtils Geometry/Records rootcore L1Trigger/L1THGCal DataFormats/L1THGCal 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1THGCalPlugins_fe_be
L1Trigger/L1THGCal_relbigobj+=L1TriggerL1THGCalPlugins_fe_be
endif
ifeq ($(strip $(L1TriggerL1THGCalPlugins_geometries)),)
L1TriggerL1THGCalPlugins_geometries := self/src/L1Trigger/L1THGCal/plugins
L1TriggerL1THGCalPlugins_geometries_LOC_USE := self cmssw  L1Trigger/L1THGCal tbb 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1THGCalPlugins_geometries
L1Trigger/L1THGCal_relbigobj+=L1TriggerL1THGCalPlugins_geometries
endif
ifeq ($(strip $(L1Trigger/L1THGCalUtilities)),)
L1TriggerL1THGCalUtilities := self/L1Trigger/L1THGCalUtilities
L1Trigger/L1THGCalUtilities := L1TriggerL1THGCalUtilities
L1TriggerL1THGCalUtilities_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerL1THGCalUtilities_EX_USE := $(foreach d, self cmssw  FWCore/Framework DataFormats/Common DataFormats/L1THGCal FWCore/ParameterSet FWCore/PluginManager SimDataFormats/CaloAnalysis ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
L1TriggerL1THGCalUtilities_LCGDICTS  := x 
L1TriggerL1THGCalUtilities_EX_LIB   := L1TriggerL1THGCalUtilities
ALL_EXTERNAL_PRODS += L1TriggerL1THGCalUtilities
L1TriggerL1THGCalUtilities_CLASS := LIBRARY
L1Trigger/L1THGCalUtilities_relbigobj+=L1TriggerL1THGCalUtilities
endif
ifeq ($(strip $(L1TriggerL1THGCalUtilitiesPlugins_calotruth)),)
L1TriggerL1THGCalUtilitiesPlugins_calotruth := self/src/L1Trigger/L1THGCalUtilities/plugins
L1TriggerL1THGCalUtilitiesPlugins_calotruth_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet Geometry/Records SimDataFormats/CaloAnalysis DataFormats/L1THGCal L1Trigger/L1THGCal 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1THGCalUtilitiesPlugins_calotruth
L1Trigger/L1THGCalUtilities_relbigobj+=L1TriggerL1THGCalUtilitiesPlugins_calotruth
endif
ifeq ($(strip $(L1TriggerL1THGCalUtilitiesPlugins_selectors)),)
L1TriggerL1THGCalUtilitiesPlugins_selectors := self/src/L1Trigger/L1THGCalUtilities/plugins
L1TriggerL1THGCalUtilitiesPlugins_selectors_LOC_USE := self cmssw  L1Trigger/L1THGCal CommonTools/Utils CommonTools/MVAUtils roottmva 
ALL_EXTERNAL_PLUGIN_PRODS += L1TriggerL1THGCalUtilitiesPlugins_selectors
L1Trigger/L1THGCalUtilities_relbigobj+=L1TriggerL1THGCalUtilitiesPlugins_selectors
endif
ifeq ($(strip $(L1TriggerConfig/L1ScalesProducers)),)
L1TriggerConfigL1ScalesProducers := self/L1TriggerConfig/L1ScalesProducers
L1TriggerConfig/L1ScalesProducers := L1TriggerConfigL1ScalesProducers
L1TriggerConfigL1ScalesProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
L1TriggerConfigL1ScalesProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CondFormats/L1TObjects CondFormats/DataRecord CalibFormats/CaloTPG CalibCalorimetry/EcalTPGTools CalibCalorimetry/CaloTPG CondTools/L1Trigger Geometry/EcalMapping Geometry/HcalTowerAlgo ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += L1TriggerConfigL1ScalesProducers
L1TriggerConfigL1ScalesProducers_CLASS := LIBRARY
L1TriggerConfig/L1ScalesProducers_relbigobj+=L1TriggerConfigL1ScalesProducers
endif
ifeq ($(strip $(RecoEgamma/EgammaElectronAlgos)),)
RecoEgammaEgammaElectronAlgos := self/RecoEgamma/EgammaElectronAlgos
RecoEgamma/EgammaElectronAlgos := RecoEgammaEgammaElectronAlgos
RecoEgammaEgammaElectronAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaElectronAlgos_EX_USE := $(foreach d, self cmssw  ofast-flag TrackingTools/MaterialEffects FWCore/Framework FWCore/ParameterSet clhep MagneticField/Engine DataFormats/DetId DataFormats/TrackingRecHit DataFormats/GsfTrackReco DataFormats/TrackReco DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/CaloRecHit Geometry/TrackerGeometryBuilder Geometry/CaloGeometry Geometry/CaloTopology RecoTracker/MeasurementDet TrackingTools/DetLayers TrackingTools/GsfTools TrackingTools/GsfTracking DataFormats/HcalRecHit RecoEcal/EgammaCoreTools RecoEgamma/EgammaTools RecoEgamma/EgammaIsolationAlgos RecoEgamma/ElectronIdentification CondFormats/GBRForest CondFormats/DataRecord CommonTools/Egamma ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaElectronAlgos_EX_LIB   := RecoEgammaEgammaElectronAlgos
ALL_EXTERNAL_PRODS += RecoEgammaEgammaElectronAlgos
RecoEgammaEgammaElectronAlgos_CLASS := LIBRARY
RecoEgamma/EgammaElectronAlgos_relbigobj+=RecoEgammaEgammaElectronAlgos
endif
ifeq ($(strip $(RecoEgamma/EgammaElectronProducers)),)
RecoEgammaEgammaElectronProducers := self/RecoEgamma/EgammaElectronProducers
RecoEgamma/EgammaElectronProducers := RecoEgammaEgammaElectronProducers
RecoEgammaEgammaElectronProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaElectronProducers_EX_USE := $(foreach d, self cmssw  CommonTools/BaseParticlePropagator DataFormats/BeamSpot DataFormats/Common DataFormats/EgammaCandidates DataFormats/GsfTrackReco DataFormats/ParticleFlowReco DataFormats/TrackReco RecoEcal/EgammaCoreTools ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaElectronProducers_EX_LIB   := RecoEgammaEgammaElectronProducers
ALL_EXTERNAL_PRODS += RecoEgammaEgammaElectronProducers
RecoEgammaEgammaElectronProducers_CLASS := LIBRARY
RecoEgamma/EgammaElectronProducers_relbigobj+=RecoEgammaEgammaElectronProducers
endif
ifeq ($(strip $(RecoEgammaEgammaElectronProducersPlugins)),)
RecoEgammaEgammaElectronProducersPlugins := self/src/RecoEgamma/EgammaElectronProducers/plugins
RecoEgammaEgammaElectronProducersPlugins_LOC_USE := self cmssw  CommonTools/CandAlgos CommonTools/ParticleFlow DataFormats/BeamSpot DataFormats/Candidate DataFormats/Common DataFormats/EcalRecHit DataFormats/EgammaCandidates DataFormats/PatCandidates DataFormats/EgammaReco DataFormats/GeometryVector DataFormats/GsfTrackReco DataFormats/Math DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco DataFormats/TrackReco CommonTools/BaseParticlePropagator FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities MagneticField/Engine MagneticField/Records RecoEcal/EgammaCoreTools RecoEgamma/EgammaElectronAlgos RecoEgamma/EgammaElectronProducers RecoEgamma/EgammaIsolationAlgos RecoTracker/TkTrackingRegions RecoTracker/TransientTrackingRecHit TrackingTools/PatternTools TrackingTools/Records TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaEgammaElectronProducersPlugins
RecoEgamma/EgammaElectronProducers_relbigobj+=RecoEgammaEgammaElectronProducersPlugins
endif
ifeq ($(strip $(RecoEgammaEgammaHLTProducersPlugins)),)
RecoEgammaEgammaHLTProducersPlugins := self/src/RecoEgamma/EgammaHLTProducers/plugins
RecoEgammaEgammaHLTProducersPlugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet DataFormats/EgammaCandidates Geometry/CaloGeometry RecoEcal/EgammaCoreTools RecoEgamma/EgammaIsolationAlgos RecoEgamma/EgammaTools MagneticField/Engine MagneticField/Records DataFormats/DetId DataFormats/TrackingRecHit CondFormats/L1TObjects CondFormats/DataRecord Geometry/TrackerGeometryBuilder DataFormats/L1Trigger DataFormats/L1TrackTrigger SimDataFormats/Associations SimDataFormats/TrackingAnalysis SimTracker/TrackTriggerAssociation TrackingTools/GsfTools 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaEgammaHLTProducersPlugins
RecoEgamma/EgammaHLTProducers_relbigobj+=RecoEgammaEgammaHLTProducersPlugins
endif
ifeq ($(strip $(RecoEgamma/EgammaIsolationAlgos)),)
RecoEgammaEgammaIsolationAlgos := self/RecoEgamma/EgammaIsolationAlgos
RecoEgamma/EgammaIsolationAlgos := RecoEgammaEgammaIsolationAlgos
RecoEgammaEgammaIsolationAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaIsolationAlgos_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger Geometry/CaloGeometry Geometry/CaloTopology DataFormats/Candidate DataFormats/RecoCandidate DataFormats/ParticleFlowReco DataFormats/ParticleFlowCandidate DataFormats/HcalDetId DataFormats/PatCandidates CondFormats/HcalObjects RecoLocalCalo/EcalRecAlgos RecoLocalCalo/HcalRecAlgos CommonTools/Statistics CondFormats/DataRecord ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaEgammaIsolationAlgos_EX_LIB   := RecoEgammaEgammaIsolationAlgos
ALL_EXTERNAL_PRODS += RecoEgammaEgammaIsolationAlgos
RecoEgammaEgammaIsolationAlgos_CLASS := LIBRARY
RecoEgamma/EgammaIsolationAlgos_relbigobj+=RecoEgammaEgammaIsolationAlgos
endif
ifeq ($(strip $(RecoEgammaEgammaIsolationAlgosPlugins)),)
RecoEgammaEgammaIsolationAlgosPlugins := self/src/RecoEgamma/EgammaIsolationAlgos/plugins
RecoEgammaEgammaIsolationAlgosPlugins_LOC_USE := self cmssw  DataFormats/BeamSpot PhysicsTools/IsolationAlgos DataFormats/CaloTowers DataFormats/RecoCandidate DataFormats/EgammaCandidates DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloGeometry Geometry/Records CommonTools/Statistics RecoEgamma/EgammaIsolationAlgos RecoLocalCalo/EcalRecAlgos DataFormats/ParticleFlowCandidate DataFormats/PatCandidates 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaEgammaIsolationAlgosPlugins
RecoEgamma/EgammaIsolationAlgos_relbigobj+=RecoEgammaEgammaIsolationAlgosPlugins
endif
ifeq ($(strip $(RecoEgammaEgammaIsolationAlgosPlugins_iso_deposit_extractors)),)
RecoEgammaEgammaIsolationAlgosPlugins_iso_deposit_extractors := self/src/RecoEgamma/EgammaIsolationAlgos/plugins
RecoEgammaEgammaIsolationAlgosPlugins_iso_deposit_extractors_LOC_USE := self cmssw  DataFormats/BeamSpot PhysicsTools/IsolationAlgos DataFormats/CaloTowers DataFormats/RecoCandidate DataFormats/EgammaCandidates DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloGeometry Geometry/Records CommonTools/Statistics RecoEgamma/EgammaIsolationAlgos RecoLocalCalo/EcalRecAlgos DataFormats/ParticleFlowCandidate DataFormats/PatCandidates 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaEgammaIsolationAlgosPlugins_iso_deposit_extractors
RecoEgamma/EgammaIsolationAlgos_relbigobj+=RecoEgammaEgammaIsolationAlgosPlugins_iso_deposit_extractors
endif
ifeq ($(strip $(RecoEgammaEgammaIsolationAlgosPlugins_isolation_cones)),)
RecoEgammaEgammaIsolationAlgosPlugins_isolation_cones := self/src/RecoEgamma/EgammaIsolationAlgos/plugins
RecoEgammaEgammaIsolationAlgosPlugins_isolation_cones_LOC_USE := self cmssw  DataFormats/BeamSpot PhysicsTools/IsolationAlgos DataFormats/CaloTowers DataFormats/RecoCandidate DataFormats/EgammaCandidates DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloGeometry Geometry/Records CommonTools/Statistics RecoEgamma/EgammaIsolationAlgos RecoLocalCalo/EcalRecAlgos DataFormats/ParticleFlowCandidate DataFormats/PatCandidates 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaEgammaIsolationAlgosPlugins_isolation_cones
RecoEgamma/EgammaIsolationAlgos_relbigobj+=RecoEgammaEgammaIsolationAlgosPlugins_isolation_cones
endif
ifeq ($(strip $(RecoEgamma/EgammaPhotonProducers)),)
RecoEgammaEgammaPhotonProducers := self/RecoEgamma/EgammaPhotonProducers
RecoEgamma/EgammaPhotonProducers := RecoEgammaEgammaPhotonProducers
RecoEgammaEgammaPhotonProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaEgammaPhotonProducers_EX_FLAGS_USE_SOURCE_ONLY   := RecoCaloTools/Selectors
RecoEgammaEgammaPhotonProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet DataFormats/ParticleFlowCandidate DataFormats/EgammaCandidates DataFormats/Common DataFormats/TrackCandidate DataFormats/TrackReco DataFormats/EgammaTrackReco DataFormats/CaloRecHit DataFormats/Math Geometry/CaloGeometry Geometry/CaloTopology RecoEcal/EgammaCoreTools RecoEgamma/EgammaIsolationAlgos RecoEgamma/EgammaElectronAlgos RecoEgamma/EgammaPhotonAlgos RecoEgamma/PhotonIdentification RecoEgamma/EgammaTools RecoTracker/MeasurementDet RecoTracker/CkfPattern RecoTracker/TrackProducer DataFormats/HcalRecHit clhep PhysicsTools/TensorFlow ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoEgammaEgammaPhotonProducers
RecoEgammaEgammaPhotonProducers_CLASS := LIBRARY
RecoEgamma/EgammaPhotonProducers_relbigobj+=RecoEgammaEgammaPhotonProducers
endif
ifeq ($(strip $(RecoEgamma/PhotonIdentification)),)
RecoEgammaPhotonIdentification := self/RecoEgamma/PhotonIdentification
RecoEgamma/PhotonIdentification := RecoEgammaPhotonIdentification
RecoEgammaPhotonIdentification_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoEgammaPhotonIdentification_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet CondFormats/EcalObjects CondFormats/HcalObjects CondFormats/DataRecord DataFormats/BeamSpot DataFormats/DetId DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/HcalRecHit DataFormats/TrackReco Geometry/CaloGeometry Geometry/Records Geometry/CaloTopology RecoEcal/EgammaCoreTools RecoEgamma/EgammaIsolationAlgos RecoEgamma/EgammaTools RecoLocalCalo/EcalRecAlgos RecoLocalCalo/HcalRecAlgos PhysicsTools/TensorFlow CommonTools/MVAUtils ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoEgammaPhotonIdentification_EX_LIB   := RecoEgammaPhotonIdentification
ALL_EXTERNAL_PRODS += RecoEgammaPhotonIdentification
RecoEgammaPhotonIdentification_CLASS := LIBRARY
RecoEgamma/PhotonIdentification_relbigobj+=RecoEgammaPhotonIdentification
endif
ifeq ($(strip $(RecoEgammaPhotonIdentificationPlugins)),)
RecoEgammaPhotonIdentificationPlugins := self/src/RecoEgamma/PhotonIdentification/plugins
RecoEgammaPhotonIdentificationPlugins_LOC_USE := self cmssw  FWCore/Framework DataFormats/Common DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/PatCandidates Geometry/CaloGeometry PhysicsTools/SelectorUtils CommonTools/Egamma CommonTools/MVAUtils CommonTools/UtilAlgos CommonTools/Utils RecoEgamma/PhotonIdentification RecoEgamma/EgammaTools 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaPhotonIdentificationPlugins
RecoEgamma/PhotonIdentification_relbigobj+=RecoEgammaPhotonIdentificationPlugins
endif
ifeq ($(strip $(RecoEgammaPhotonIdentificationPlugins_cuts)),)
RecoEgammaPhotonIdentificationPlugins_cuts := self/src/RecoEgamma/PhotonIdentification/plugins
RecoEgammaPhotonIdentificationPlugins_cuts_LOC_USE := self cmssw  FWCore/Framework DataFormats/Common DataFormats/EgammaReco DataFormats/EgammaCandidates DataFormats/PatCandidates Geometry/CaloGeometry PhysicsTools/SelectorUtils CommonTools/Egamma CommonTools/MVAUtils CommonTools/UtilAlgos CommonTools/Utils RecoEgamma/EgammaTools 
ALL_EXTERNAL_PLUGIN_PRODS += RecoEgammaPhotonIdentificationPlugins_cuts
RecoEgamma/PhotonIdentification_relbigobj+=RecoEgammaPhotonIdentificationPlugins_cuts
endif
ifeq ($(strip $(RecoJets/FFTJetProducers)),)
RecoJetsFFTJetProducers := self/RecoJets/FFTJetProducers
RecoJets/FFTJetProducers := RecoJetsFFTJetProducers
RecoJetsFFTJetProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsFFTJetProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework RecoJets/FFTJetAlgorithms RecoJets/JetProducers ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsFFTJetProducers_EX_LIB   := RecoJetsFFTJetProducers
ALL_EXTERNAL_PRODS += RecoJetsFFTJetProducers
RecoJetsFFTJetProducers_CLASS := LIBRARY
RecoJets/FFTJetProducers_relbigobj+=RecoJetsFFTJetProducers
endif
ifeq ($(strip $(RecoJetsFFTWJetProducers_plugins)),)
RecoJetsFFTWJetProducers_plugins := self/src/RecoJets/FFTJetProducers/plugins
RecoJetsFFTWJetProducers_plugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ServiceRegistry FWCore/Utilities FWCore/ParameterSet DataFormats/JetReco DataFormats/Common DataFormats/Histograms DataFormats/ParticleFlowCandidate DataFormats/Candidate DataFormats/VertexReco DataFormats/BeamSpot RecoJets/JetProducers RecoJets/FFTJetAlgorithms RecoJets/FFTJetProducers JetMETCorrections/FFTJetObjects 
ALL_EXTERNAL_PLUGIN_PRODS += RecoJetsFFTWJetProducers_plugins
RecoJets/FFTJetProducers_relbigobj+=RecoJetsFFTWJetProducers_plugins
endif
ifeq ($(strip $(RecoJets/JetProducers)),)
RecoJetsJetProducers := self/RecoJets/JetProducers
RecoJets/JetProducers := RecoJetsJetProducers
RecoJetsJetProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoJetsJetProducers_EX_FLAGS_USE_SOURCE_ONLY   := Geometry/CommonDetUnit
RecoJetsJetProducers_EX_USE := $(foreach d, self cmssw  boost FWCore/Framework DataFormats/JetReco DataFormats/PatCandidates Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records SimDataFormats/CaloHit SimDataFormats/Vertex SimDataFormats/Track RecoJets/JetAlgorithms JetMETCorrections/JetCorrector DataFormats/CastorReco CommonTools/MVAUtils fastjet vdt_headers boost_serialization ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoJetsJetProducers_EX_LIB   := RecoJetsJetProducers
ALL_EXTERNAL_PRODS += RecoJetsJetProducers
RecoJetsJetProducers_CLASS := LIBRARY
RecoJets/JetProducers_relbigobj+=RecoJetsJetProducers
endif
ifeq ($(strip $(RecoJetsJetProducers_plugins)),)
RecoJetsJetProducers_plugins := self/src/RecoJets/JetProducers/plugins
RecoJetsJetProducers_plugins_LOC_USE := self cmssw  RecoJets/JetProducers RecoJets/JetAlgorithms RecoEgamma/EgammaIsolationAlgos FWCore/Framework FWCore/ParameterSet DataFormats/BTauReco DataFormats/JetReco DataFormats/VertexReco DataFormats/HcalRecHit DataFormats/EcalRecHit Geometry/CaloGeometry Geometry/Records CommonTools/UtilAlgos CondFormats/JetMETObjects CondFormats/EcalObjects CondFormats/DataRecord JetMETCorrections/Objects fastjet fastjet-contrib 
ALL_EXTERNAL_PLUGIN_PRODS += RecoJetsJetProducers_plugins
RecoJets/JetProducers_relbigobj+=RecoJetsJetProducers_plugins
endif
ifeq ($(strip $(RecoLocalCalo/CaloTowersCreator)),)
RecoLocalCaloCaloTowersCreator := self/RecoLocalCalo/CaloTowersCreator
RecoLocalCalo/CaloTowersCreator := RecoLocalCaloCaloTowersCreator
RecoLocalCaloCaloTowersCreator_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloCaloTowersCreator_EX_USE := $(foreach d, self cmssw  boost DataFormats/CaloTowers DataFormats/HcalRecHit DataFormats/DetId DataFormats/RecoCandidate Geometry/CaloTopology Geometry/CaloGeometry FWCore/Framework FWCore/ParameterSet CondFormats/DataRecord CondFormats/EcalObjects CondFormats/HcalObjects RecoLocalCalo/HcalRecAlgos RecoLocalCalo/EcalRecAlgos ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoLocalCaloCaloTowersCreator
RecoLocalCaloCaloTowersCreator_CLASS := LIBRARY
RecoLocalCalo/CaloTowersCreator_relbigobj+=RecoLocalCaloCaloTowersCreator
endif
ifeq ($(strip $(RecoLocalCalo/HGCalRecAlgos)),)
RecoLocalCaloHGCalRecAlgos := self/RecoLocalCalo/HGCalRecAlgos
RecoLocalCalo/HGCalRecAlgos := RecoLocalCaloHGCalRecAlgos
RecoLocalCaloHGCalRecAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloHGCalRecAlgos_EX_USE := $(foreach d, self cmssw  clhep DataFormats/HGCRecHit root rootminuit FWCore/MessageLogger FWCore/ParameterSet FWCore/Framework Geometry/HGCalGeometry Geometry/HcalTowerAlgo Geometry/Records DataFormats/ParticleFlowReco ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloHGCalRecAlgos_EX_LIB   := RecoLocalCaloHGCalRecAlgos
ALL_EXTERNAL_PRODS += RecoLocalCaloHGCalRecAlgos
RecoLocalCaloHGCalRecAlgos_CLASS := LIBRARY
RecoLocalCalo/HGCalRecAlgos_relbigobj+=RecoLocalCaloHGCalRecAlgos
endif
ifeq ($(strip $(RecoLocalCalo/HcalRecAlgos)),)
RecoLocalCaloHcalRecAlgos := self/RecoLocalCalo/HcalRecAlgos
RecoLocalCalo/HcalRecAlgos := RecoLocalCaloHcalRecAlgos
RecoLocalCaloHcalRecAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloHcalRecAlgos_EX_USE := $(foreach d, self cmssw  boost clhep cuda eigen rootminuit2 vdt_headers CalibCalorimetry/HcalAlgos CalibFormats/CaloObjects CalibFormats/HcalObjects DataFormats/HcalDigi DataFormats/HcalRecHit DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloTopology HeterogeneousCore/CUDACore HeterogeneousCore/CUDAUtilities RecoLocalCalo/EcalRecAlgos ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoLocalCaloHcalRecAlgos_EX_LIB   := RecoLocalCaloHcalRecAlgos
ALL_EXTERNAL_PRODS += RecoLocalCaloHcalRecAlgos
RecoLocalCaloHcalRecAlgos_CLASS := LIBRARY
RecoLocalCalo/HcalRecAlgos_relbigobj+=RecoLocalCaloHcalRecAlgos
endif
ifeq ($(strip $(RecoLocalCaloHcalRecAlgosPlugin)),)
RecoLocalCaloHcalRecAlgosPlugin := self/src/RecoLocalCalo/HcalRecAlgos/plugins
RecoLocalCaloHcalRecAlgosPlugin_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet RecoLocalCalo/HcalRecAlgos Geometry/HcalTowerAlgo 
ALL_EXTERNAL_PLUGIN_PRODS += RecoLocalCaloHcalRecAlgosPlugin
RecoLocalCalo/HcalRecAlgos_relbigobj+=RecoLocalCaloHcalRecAlgosPlugin
endif
ifeq ($(strip $(RecoLocalCalo/HcalRecProducers)),)
RecoLocalCaloHcalRecProducers := self/RecoLocalCalo/HcalRecProducers
RecoLocalCalo/HcalRecProducers := RecoLocalCaloHcalRecProducers
RecoLocalCaloHcalRecProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalCaloHcalRecProducers_EX_USE := $(foreach d, self cmssw  boost cuda CUDADataFormats/HcalDigi CUDADataFormats/HcalRecHitSoA CalibCalorimetry/HcalAlgos CalibFormats/HcalObjects CommonTools/UtilAlgos DataFormats/Common DataFormats/HcalDetId DataFormats/HcalRecHit FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry Geometry/HcalCommonData Geometry/Records HeterogeneousCore/CUDACore HeterogeneousCore/CUDAUtilities RecoLocalCalo/HcalRecAlgos SimCalorimetry/HcalSimAlgos ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoLocalCaloHcalRecProducers
RecoLocalCaloHcalRecProducers_CLASS := LIBRARY
RecoLocalCalo/HcalRecProducers_relbigobj+=RecoLocalCaloHcalRecProducers
endif
ifeq ($(strip $(RecoMET/METAlgorithms)),)
RecoMETMETAlgorithms := self/RecoMET/METAlgorithms
RecoMET/METAlgorithms := RecoMETMETAlgorithms
RecoMETMETAlgorithms_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMETMETAlgorithms_EX_USE := $(foreach d, self cmssw  DataFormats/METReco DataFormats/JetReco DataFormats/CaloTowers DataFormats/Common DataFormats/CSCRecHit FWCore/ParameterSet rootphysics MagneticField/Records MagneticField/Engine TrackingTools/GeomPropagators TrackingTools/TrackAssociator Geometry/CaloTopology Geometry/HcalTowerAlgo Geometry/CSCGeometry RecoEcal/EgammaCoreTools DataFormats/ParticleFlowCandidate DataFormats/L1GlobalMuonTrigger DataFormats/MuonReco DataFormats/ParticleFlowReco DataFormats/VertexReco CondFormats/JetMETObjects RecoMuon/TrackingTools RecoParticleFlow/PFClusterTools JetMETCorrections/Modules ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoMETMETAlgorithms_EX_LIB   := RecoMETMETAlgorithms
ALL_EXTERNAL_PRODS += RecoMETMETAlgorithms
RecoMETMETAlgorithms_CLASS := LIBRARY
RecoMET/METAlgorithms_relbigobj+=RecoMETMETAlgorithms
endif
ifeq ($(strip $(RecoMET/METProducers)),)
RecoMETMETProducers := self/RecoMET/METProducers
RecoMET/METProducers := RecoMETMETProducers
RecoMETMETProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoMETMETProducers_EX_USE := $(foreach d, self cmssw  RecoMET/METAlgorithms DataFormats/METReco FWCore/Framework DataFormats/Common DataFormats/JetReco DataFormats/TrackReco CalibFormats/HcalObjects RecoLocalCalo/HcalRecAlgos Geometry/CSCGeometry JetMETCorrections/Modules ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoMETMETProducers
RecoMETMETProducers_CLASS := LIBRARY
RecoMET/METProducers_relbigobj+=RecoMETMETProducers
endif
ifeq ($(strip $(RecoParticleFlow/PFClusterProducer)),)
RecoParticleFlowPFClusterProducer := self/RecoParticleFlow/PFClusterProducer
RecoParticleFlow/PFClusterProducer := RecoParticleFlowPFClusterProducer
RecoParticleFlowPFClusterProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFClusterProducer_EX_USE := $(foreach d, self cmssw  CondFormats/HcalObjects CondFormats/EcalObjects CondFormats/GBRForest CondFormats/DataRecord DataFormats/Common DataFormats/ParticleFlowReco Geometry/HGCalGeometry RecoLocalCalo/HcalRecAlgos DataFormats/DetId DataFormats/HcalDetId DataFormats/ForwardDetId RecoEcal/EgammaCoreTools RecoParticleFlow/PFClusterTools Calibration/Tools CalibCalorimetry/EcalTPGTools DataFormats/HGCRecHit RecoLocalCalo/HGCalRecAlgos vdt_headers rootmath root ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFClusterProducer_EX_LIB   := RecoParticleFlowPFClusterProducer
ALL_EXTERNAL_PRODS += RecoParticleFlowPFClusterProducer
RecoParticleFlowPFClusterProducer_CLASS := LIBRARY
RecoParticleFlow/PFClusterProducer_relbigobj+=RecoParticleFlowPFClusterProducer
endif
ifeq ($(strip $(RecoParticleFlowPFClusterProducerPlugins)),)
RecoParticleFlowPFClusterProducerPlugins := self/src/RecoParticleFlow/PFClusterProducer/plugins
RecoParticleFlowPFClusterProducerPlugins_LOC_USE := self cmssw  CondFormats/HcalObjects CondFormats/EcalObjects CondFormats/DataRecord DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/Math DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records RecoParticleFlow/PFClusterProducer 
ALL_EXTERNAL_PLUGIN_PRODS += RecoParticleFlowPFClusterProducerPlugins
RecoParticleFlow/PFClusterProducer_relbigobj+=RecoParticleFlowPFClusterProducerPlugins
endif
ifeq ($(strip $(RecoParticleFlowPFClusterProducerPlugins_simmappers)),)
RecoParticleFlowPFClusterProducerPlugins_simmappers := self/src/RecoParticleFlow/PFClusterProducer/plugins
RecoParticleFlowPFClusterProducerPlugins_simmappers_LOC_USE := self cmssw  CondFormats/HcalObjects CondFormats/EcalObjects CondFormats/DataRecord DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/Math DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records RecoLocalCalo/HGCalRecProducers RecoParticleFlow/PFClusterProducer 
ALL_EXTERNAL_PLUGIN_PRODS += RecoParticleFlowPFClusterProducerPlugins_simmappers
RecoParticleFlow/PFClusterProducer_relbigobj+=RecoParticleFlowPFClusterProducerPlugins_simmappers
endif
ifeq ($(strip $(RecoParticleFlow/PFProducer)),)
RecoParticleFlowPFProducer := self/RecoParticleFlow/PFProducer
RecoParticleFlow/PFProducer := RecoParticleFlowPFProducer
RecoParticleFlowPFProducer_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoParticleFlowPFProducer_EX_USE := $(foreach d, self cmssw  CondFormats/GBRForest CommonTools/MVAUtils CommonTools/ParticleFlow DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaCandidates DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco DataFormats/TrackReco DataFormats/VertexReco DataFormats/MuonReco DataFormats/EcalDetId RecoParticleFlow/PFClusterTools RecoParticleFlow/PFTracking RecoEcal/EgammaCoreTools boost clhep rootmath onnxruntime ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoParticleFlowPFProducer_EX_LIB   := RecoParticleFlowPFProducer
ALL_EXTERNAL_PRODS += RecoParticleFlowPFProducer
RecoParticleFlowPFProducer_CLASS := LIBRARY
RecoParticleFlow/PFProducer_relbigobj+=RecoParticleFlowPFProducer
endif
ifeq ($(strip $(RecoParticleFlowPFProducerPlugins)),)
RecoParticleFlowPFProducerPlugins := self/src/RecoParticleFlow/PFProducer/plugins
RecoParticleFlowPFProducerPlugins_LOC_USE := self cmssw  CommonTools/ParticleFlow CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoParticleFlow/PFTracking RecoEcal/EgammaCoreTools PhysicsTools/ONNXRuntime 
ALL_EXTERNAL_PLUGIN_PRODS += RecoParticleFlowPFProducerPlugins
RecoParticleFlow/PFProducer_relbigobj+=RecoParticleFlowPFProducerPlugins
endif
ifeq ($(strip $(RecoParticleFlowPFProducerPlugins_importers)),)
RecoParticleFlowPFProducerPlugins_importers := self/src/RecoParticleFlow/PFProducer/plugins
RecoParticleFlowPFProducerPlugins_importers_LOC_USE := self cmssw  CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoParticleFlow/PFTracking RecoEcal/EgammaCoreTools RecoEgamma/EgammaIsolationAlgos 
ALL_EXTERNAL_PLUGIN_PRODS += RecoParticleFlowPFProducerPlugins_importers
RecoParticleFlow/PFProducer_relbigobj+=RecoParticleFlowPFProducerPlugins_importers
endif
ifeq ($(strip $(RecoParticleFlowPFProducerPlugins_kdtrees)),)
RecoParticleFlowPFProducerPlugins_kdtrees := self/src/RecoParticleFlow/PFProducer/plugins
RecoParticleFlowPFProducerPlugins_kdtrees_LOC_USE := self cmssw  CommonTools/RecoAlgos CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoEcal/EgammaCoreTools 
ALL_EXTERNAL_PLUGIN_PRODS += RecoParticleFlowPFProducerPlugins_kdtrees
RecoParticleFlow/PFProducer_relbigobj+=RecoParticleFlowPFProducerPlugins_kdtrees
endif
ifeq ($(strip $(RecoParticleFlowPFProducerPlugins_linkers)),)
RecoParticleFlowPFProducerPlugins_linkers := self/src/RecoParticleFlow/PFProducer/plugins
RecoParticleFlowPFProducerPlugins_linkers_LOC_USE := self cmssw  CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoEcal/EgammaCoreTools 
ALL_EXTERNAL_PLUGIN_PRODS += RecoParticleFlowPFProducerPlugins_linkers
RecoParticleFlow/PFProducer_relbigobj+=RecoParticleFlowPFProducerPlugins_linkers
endif
ifeq ($(strip $(RecoTauTag/HLTProducers)),)
RecoTauTagHLTProducers := self/RecoTauTag/HLTProducers
RecoTauTag/HLTProducers := RecoTauTagHLTProducers
RecoTauTagHLTProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTauTagHLTProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/Common DataFormats/BTauReco DataFormats/TauReco DataFormats/TrackReco DataFormats/Math DataFormats/Candidate DataFormats/JetReco DataFormats/CaloTowers DataFormats/VertexReco DataFormats/L1Trigger DataFormats/HLTReco HLTrigger/HLTcore RecoTracker/TkTrackingRegions CUDADataFormats/SiPixelCluster CUDADataFormats/Track CUDADataFormats/Vertex PhysicsTools/TensorFlow root ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoTauTagHLTProducers
RecoTauTagHLTProducers_CLASS := LIBRARY
RecoTauTag/HLTProducers_relbigobj+=RecoTauTagHLTProducers
endif
ifeq ($(strip $(RecoTauTag/RecoTau)),)
RecoTauTagRecoTau := self/RecoTauTag/RecoTau
RecoTauTag/RecoTau := RecoTauTagRecoTau
RecoTauTagRecoTau_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoTauTagRecoTau_EX_USE := $(foreach d, self cmssw  MagneticField/Engine MagneticField/Records Geometry/CaloTopology Geometry/CaloGeometry CondFormats/GBRForest CondFormats/DataRecord CondFormats/EcalObjects DataFormats/Math DataFormats/TauReco DataFormats/VertexReco DataFormats/PatCandidates DataFormats/ParticleFlowCandidate DataFormats/TrackReco DataFormats/DetId DataFormats/EcalDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager TrackingTools/TransientTrack TrackingTools/Records RecoVertex/AdaptiveVertexFit PhysicsTools/JetMCUtils CommonTools/Utils CommonTools/BaseParticlePropagator RecoLocalCalo/HGCalRecAlgos roottmva PhysicsTools/TensorFlow ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoTauTagRecoTau_EX_LIB   := RecoTauTagRecoTau
ALL_EXTERNAL_PRODS += RecoTauTagRecoTau
RecoTauTagRecoTau_CLASS := LIBRARY
RecoTauTag/RecoTau_relbigobj+=RecoTauTagRecoTau
endif
ifeq ($(strip $(RecoTauTagRecoTauPlugins)),)
RecoTauTagRecoTauPlugins := self/src/RecoTauTag/RecoTau/plugins
RecoTauTagRecoTauPlugins_LOC_USE := self cmssw  TrackingTools/IPTools TrackingTools/Records RecoVertex/KalmanVertexFit CommonTools/CandUtils DataFormats/Candidate DataFormats/MuonReco DataFormats/TrackReco TrackingTools/TransientTrack RecoVertex/VertexPrimitives FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/TauReco CommonTools/UtilAlgos RecoTauTag/RecoTau DataFormats/JetReco DataFormats/ParticleFlowReco RecoBTag/SecondaryVertex DataFormats/VertexReco CondFormats/GBRForest CondFormats/DataRecord Geometry/CaloGeometry Geometry/HcalTowerAlgo Geometry/Records MagneticField/Engine MagneticField/Records CommonTools/BaseParticlePropagator root 
ALL_EXTERNAL_PLUGIN_PRODS += RecoTauTagRecoTauPlugins
RecoTauTag/RecoTau_relbigobj+=RecoTauTagRecoTauPlugins
endif
ifeq ($(strip $(SimCalorimetry/HGCalSimAlgos)),)
SimCalorimetryHGCalSimAlgos := self/SimCalorimetry/HGCalSimAlgos
SimCalorimetry/HGCalSimAlgos := SimCalorimetryHGCalSimAlgos
SimCalorimetryHGCalSimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHGCalSimAlgos_EX_USE := $(foreach d, self cmssw  FWCore/ParameterSet DataFormats/ForwardDetId Geometry/HGCalGeometry Geometry/HcalTowerAlgo vdt_headers ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHGCalSimAlgos_EX_LIB   := SimCalorimetryHGCalSimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryHGCalSimAlgos
SimCalorimetryHGCalSimAlgos_CLASS := LIBRARY
SimCalorimetry/HGCalSimAlgos_relbigobj+=SimCalorimetryHGCalSimAlgos
endif
ifeq ($(strip $(SimCalorimetry/HGCalSimProducers)),)
SimCalorimetryHGCalSimProducers := self/SimCalorimetry/HGCalSimProducers
SimCalorimetry/HGCalSimProducers := SimCalorimetryHGCalSimProducers
SimCalorimetryHGCalSimProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHGCalSimProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/Utilities DataFormats/ForwardDetId Geometry/HGCalGeometry Geometry/HcalTowerAlgo SimCalorimetry/HGCalSimAlgos hepmc clhep vdt_headers ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHGCalSimProducers_EX_LIB   := SimCalorimetryHGCalSimProducers
ALL_EXTERNAL_PRODS += SimCalorimetryHGCalSimProducers
SimCalorimetryHGCalSimProducers_CLASS := LIBRARY
SimCalorimetry/HGCalSimProducers_relbigobj+=SimCalorimetryHGCalSimProducers
endif
ifeq ($(strip $(SimCalorimetryHGCalSimProducersAuto)),)
SimCalorimetryHGCalSimProducersAuto := self/src/SimCalorimetry/HGCalSimProducers/plugins
SimCalorimetryHGCalSimProducersAuto_LOC_USE := self cmssw  FWCore/Framework FWCore/Utilities Geometry/Records SimCalorimetry/HGCalSimProducers SimDataFormats/CaloTest SimGeneral/MixingModule SimGeneral/PreMixingModule root 
ALL_EXTERNAL_PLUGIN_PRODS += SimCalorimetryHGCalSimProducersAuto
SimCalorimetry/HGCalSimProducers_relbigobj+=SimCalorimetryHGCalSimProducersAuto
endif
ifeq ($(strip $(SimCalorimetry/HcalSimAlgos)),)
SimCalorimetryHcalSimAlgos := self/SimCalorimetry/HcalSimAlgos
SimCalorimetry/HcalSimAlgos := SimCalorimetryHcalSimAlgos
SimCalorimetryHcalSimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalSimAlgos_EX_USE := $(foreach d, self cmssw  SimCalorimetry/CaloSimAlgos CondFormats/HcalObjects CalibCalorimetry/HcalAlgos CalibFormats/HcalObjects DataFormats/HcalDigi clhep rootcore DataFormats/HcalDetId Geometry/CaloTopology ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalSimAlgos_EX_LIB   := SimCalorimetryHcalSimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryHcalSimAlgos
SimCalorimetryHcalSimAlgos_CLASS := LIBRARY
SimCalorimetry/HcalSimAlgos_relbigobj+=SimCalorimetryHcalSimAlgos
endif
ifeq ($(strip $(SimCalorimetry/HcalSimProducers)),)
SimCalorimetryHcalSimProducers := self/SimCalorimetry/HcalSimProducers
SimCalorimetry/HcalSimProducers := SimCalorimetryHcalSimProducers
SimCalorimetryHcalSimProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalSimProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/Utilities SimCalorimetry/HcalSimAlgos SimGeneral/MixingModule DataFormats/HcalDetId ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalSimProducers_EX_LIB   := SimCalorimetryHcalSimProducers
ALL_EXTERNAL_PRODS += SimCalorimetryHcalSimProducers
SimCalorimetryHcalSimProducers_CLASS := LIBRARY
SimCalorimetry/HcalSimProducers_relbigobj+=SimCalorimetryHcalSimProducers
endif
ifeq ($(strip $(SimCalorimetryHcalSimProducersPlugins)),)
SimCalorimetryHcalSimProducersPlugins := self/src/SimCalorimetry/HcalSimProducers/plugins
SimCalorimetryHcalSimProducersPlugins_LOC_USE := self cmssw  SimCalorimetry/HcalSimProducers SimGeneral/MixingModule SimGeneral/PreMixingModule 
ALL_EXTERNAL_PLUGIN_PRODS += SimCalorimetryHcalSimProducersPlugins
SimCalorimetry/HcalSimProducers_relbigobj+=SimCalorimetryHcalSimProducersPlugins
endif
ifeq ($(strip $(SimCalorimetry/HcalTrigPrimAlgos)),)
SimCalorimetryHcalTrigPrimAlgos := self/SimCalorimetry/HcalTrigPrimAlgos
SimCalorimetry/HcalTrigPrimAlgos := SimCalorimetryHcalTrigPrimAlgos
SimCalorimetryHcalTrigPrimAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
SimCalorimetryHcalTrigPrimAlgos_EX_USE := $(foreach d, self cmssw  CondFormats/HcalObjects CalibCalorimetry/HcalTPGAlgos CalibFormats/HcalObjects DataFormats/HcalDigi CalibFormats/CaloTPG Geometry/HcalTowerAlgo EventFilter/HcalRawToDigi clhep ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
SimCalorimetryHcalTrigPrimAlgos_EX_LIB   := SimCalorimetryHcalTrigPrimAlgos
ALL_EXTERNAL_PRODS += SimCalorimetryHcalTrigPrimAlgos
SimCalorimetryHcalTrigPrimAlgos_CLASS := LIBRARY
SimCalorimetry/HcalTrigPrimAlgos_relbigobj+=SimCalorimetryHcalTrigPrimAlgos
endif
ifeq ($(strip $(SimCalorimetryHcalTrigPrimProducersPlugins)),)
SimCalorimetryHcalTrigPrimProducersPlugins := self/src/SimCalorimetry/HcalTrigPrimProducers/plugins
SimCalorimetryHcalTrigPrimProducersPlugins_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet SimCalorimetry/HcalTrigPrimAlgos DataFormats/L1GlobalTrigger 
ALL_EXTERNAL_PLUGIN_PRODS += SimCalorimetryHcalTrigPrimProducersPlugins
SimCalorimetry/HcalTrigPrimProducers_relbigobj+=SimCalorimetryHcalTrigPrimProducersPlugins
endif
ifeq ($(strip $(SimGeneralCaloAnalysisPlugins)),)
SimGeneralCaloAnalysisPlugins := self/src/SimGeneral/CaloAnalysis/plugins
SimGeneralCaloAnalysisPlugins_LOC_USE := self cmssw  clhep DataFormats/SiStripDetId DataFormats/SiPixelDetId FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet SimDataFormats/GeneratorProducts SimDataFormats/CaloAnalysis SimDataFormats/Vertex DataFormats/HepMCCandidate SimGeneral/MixingModule SimGeneral/PreMixingModule SimDataFormats/CaloTest DataFormats/ForwardDetId DataFormats/HcalDetId Geometry/Records Geometry/HGCalGeometry Geometry/HcalTowerAlgo Geometry/HcalCommonData 
ALL_EXTERNAL_PLUGIN_PRODS += SimGeneralCaloAnalysisPlugins
SimGeneral/CaloAnalysis_relbigobj+=SimGeneralCaloAnalysisPlugins
endif
ifeq ($(strip $(SimGeneralDataMixingModulePlugins)),)
SimGeneralDataMixingModulePlugins := self/src/SimGeneral/DataMixingModule/plugins
SimGeneralDataMixingModulePlugins_LOC_USE := self cmssw  CalibFormats/HcalObjects CondFormats/EcalObjects DataFormats/CSCDigi DataFormats/Common DataFormats/DTDigi DataFormats/EcalDigi DataFormats/EcalRecHit DataFormats/HcalDigi DataFormats/HcalRecHit DataFormats/Provenance DataFormats/RPCDigi DataFormats/SiPixelDigi DataFormats/SiStripDigi DataFormats/TrackReco DataFormats/HepMCCandidate FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities Mixing/Base SimCalorimetry/CaloSimAlgos SimCalorimetry/HcalSimAlgos SimCalorimetry/HcalSimProducers SimDataFormats/PileupSummaryInfo SimDataFormats/CrossingFrame 
ALL_EXTERNAL_PLUGIN_PRODS += SimGeneralDataMixingModulePlugins
SimGeneral/DataMixingModule_relbigobj+=SimGeneralDataMixingModulePlugins
endif
ifeq ($(strip $(SimGeneralDebuggingAuto)),)
SimGeneralDebuggingAuto := self/src/SimGeneral/Debugging/plugins
SimGeneralDebuggingAuto_LOC_USE := self cmssw  FWCore/Framework FWCore/ParameterSet SimDataFormats/Track SimDataFormats/Vertex SimDataFormats/TrackingAnalysis SimDataFormats/CaloAnalysis SimDataFormats/CaloHit SimDataFormats/CaloTest Geometry/HcalTowerAlgo Geometry/HGCalGeometry Geometry/Records 
ALL_EXTERNAL_PLUGIN_PRODS += SimGeneralDebuggingAuto
SimGeneral/Debugging_relbigobj+=SimGeneralDebuggingAuto
endif
ifeq ($(strip $(TopQuarkAnalysis/TopEventProducers)),)
TopQuarkAnalysisTopEventProducers := self/TopQuarkAnalysis/TopEventProducers
TopQuarkAnalysis/TopEventProducers := TopQuarkAnalysisTopEventProducers
TopQuarkAnalysisTopEventProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
TopQuarkAnalysisTopEventProducers_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet CommonTools/Utils AnalysisDataFormats/TopObjects TopQuarkAnalysis/TopKinFitter TopQuarkAnalysis/TopJetCombination TopQuarkAnalysis/TopEventSelection RecoJets/JetProducers DataFormats/Candidate DataFormats/HepMCCandidate DataFormats/Math FWCore/Common FWCore/MessageLogger FWCore/Utilities SimDataFormats/GeneratorProducts TopQuarkAnalysis/TopTools fastjet ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += TopQuarkAnalysisTopEventProducers
TopQuarkAnalysisTopEventProducers_CLASS := LIBRARY
TopQuarkAnalysis/TopEventProducers_relbigobj+=TopQuarkAnalysisTopEventProducers
endif
ifeq ($(strip $(Validation/GlobalHits)),)
ValidationGlobalHits := self/Validation/GlobalHits
Validation/GlobalHits := ValidationGlobalHits
ValidationGlobalHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationGlobalHits_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities SimDataFormats/ValidationFormats SimDataFormats/GeneratorProducts DataFormats/HcalDetId DataFormats/DetId DataFormats/Common Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder DataFormats/MuonDetId Geometry/HcalTowerAlgo Geometry/CSCGeometry Geometry/DTGeometry Geometry/RPCGeometry Geometry/HcalCommonData Geometry/Records DQMServices/Core root clhep rootmath DataFormats/Math ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationGlobalHits
ValidationGlobalHits_CLASS := LIBRARY
Validation/GlobalHits_relbigobj+=ValidationGlobalHits
endif
ifeq ($(strip $(Validation/GlobalRecHits)),)
ValidationGlobalRecHits := self/Validation/GlobalRecHits
Validation/GlobalRecHits := ValidationGlobalRecHits
ValidationGlobalRecHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationGlobalRecHits_EX_USE := $(foreach d, self cmssw  FWCore/Framework DataFormats/Common FWCore/ParameterSet FWCore/MessageLogger DataFormats/EcalDigi DataFormats/EcalDetId DataFormats/EcalRecHit DataFormats/HcalDetId DataFormats/HcalDigi CalibFormats/HcalObjects Geometry/Records Geometry/CaloGeometry Geometry/HcalTowerAlgo DataFormats/HcalRecHit DataFormats/SiStripDigi DataFormats/SiStripDetId SimTracker/TrackerHitAssociation Geometry/TrackerGeometryBuilder DataFormats/SiPixelDigi DataFormats/SiPixelDetId DataFormats/DTDigi DataFormats/MuonDetId DataFormats/DTRecHit Geometry/DTGeometry DataFormats/CSCDigi Geometry/CSCGeometry DataFormats/CSCRecHit Geometry/RPCGeometry DataFormats/RPCDigi DataFormats/RPCRecHit SimDataFormats/CrossingFrame SimDataFormats/CaloHit DQMServices/Core SimDataFormats/ValidationFormats Validation/DTRecHits root ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationGlobalRecHits
ValidationGlobalRecHits_CLASS := LIBRARY
Validation/GlobalRecHits_relbigobj+=ValidationGlobalRecHits
endif
ifeq ($(strip $(Validation/HcalDigis)),)
ValidationHcalDigis := self/Validation/HcalDigis
Validation/HcalDigis := ValidationHcalDigis
ValidationHcalDigis_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationHcalDigis_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet Geometry/HcalTowerAlgo Geometry/CaloGeometry Geometry/Records Geometry/HcalCommonData CalibFormats/HcalObjects DQMServices/Core root clhep CalibFormats/CaloTPG ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationHcalDigis
ValidationHcalDigis_CLASS := LIBRARY
Validation/HcalDigis_relbigobj+=ValidationHcalDigis
endif
ifeq ($(strip $(Validation/HcalHits)),)
ValidationHcalHits := self/Validation/HcalHits
Validation/HcalHits := ValidationHcalHits
ValidationHcalHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationHcalHits_EX_USE := $(foreach d, self cmssw  DataFormats/HcalDetId DataFormats/Math DQMServices/Core FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet Geometry/HcalCommonData SimDataFormats/CaloHit SimDataFormats/GeneratorProducts SimDataFormats/ValidationFormats SimG4CMS/Calo SimG4Core/Notification SimG4Core/Watcher geant4core hepmc rootmath ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationHcalHits
ValidationHcalHits_CLASS := LIBRARY
Validation/HcalHits_relbigobj+=ValidationHcalHits
endif
ifeq ($(strip $(testValidationHcalHits)),)
testValidationHcalHits := self/src/Validation/HcalHits/plugins
testValidationHcalHits_LOC_USE := self cmssw  CommonTools/UtilAlgos DataFormats/HcalDetId DataFormats/HepMCCandidate DQMServices/Core FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger Geometry/HcalCommonData Geometry/Records SimDataFormats/CaloHit SimDataFormats/ValidationFormats geant4core hepmc clhep root 
ALL_EXTERNAL_PLUGIN_PRODS += testValidationHcalHits
Validation/HcalHits_relbigobj+=testValidationHcalHits
endif
ifeq ($(strip $(Validation/HcalRecHits)),)
ValidationHcalRecHits := self/Validation/HcalRecHits
Validation/HcalRecHits := ValidationHcalRecHits
ValidationHcalRecHits_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationHcalRecHits_EX_USE := $(foreach d, self cmssw  FWCore/Framework FWCore/ParameterSet DQMServices/Core root DataFormats/Common DataFormats/HcalDetId DataFormats/METReco Geometry/CaloGeometry Geometry/HcalTowerAlgo Geometry/HcalCommonData SimDataFormats/GeneratorProducts SimDataFormats/CaloHit CondFormats/EcalObjects CondFormats/DataRecord CondFormats/HcalObjects RecoLocalCalo/HcalRecAlgos RecoLocalCalo/EcalRecAlgos clhep hepmc ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += ValidationHcalRecHits
ValidationHcalRecHits_CLASS := LIBRARY
Validation/HcalRecHits_relbigobj+=ValidationHcalRecHits
endif
ifeq ($(strip $(Validation/RecoParticleFlow)),)
ValidationRecoParticleFlow := self/Validation/RecoParticleFlow
Validation/RecoParticleFlow := ValidationRecoParticleFlow
ValidationRecoParticleFlow_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
ValidationRecoParticleFlow_EX_USE := $(foreach d, self cmssw  root rootgpad rootcore ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ValidationRecoParticleFlow_LCGDICTS  := x 
ValidationRecoParticleFlow_EX_LIB   := ValidationRecoParticleFlow
ALL_EXTERNAL_PRODS += ValidationRecoParticleFlow
ValidationRecoParticleFlow_CLASS := LIBRARY
Validation/RecoParticleFlow_relbigobj+=ValidationRecoParticleFlow
endif
ifeq ($(strip $(ValidationRecoParticleFlow_plugins)),)
ValidationRecoParticleFlow_plugins := self/src/Validation/RecoParticleFlow/plugins
ValidationRecoParticleFlow_plugins_LOC_USE := self cmssw  FWCore/Framework root rootcore FWCore/MessageLogger FWCore/ParameterSet DQMServices/Core DataFormats/METReco DataFormats/PatCandidates DataFormats/ParticleFlowReco DataFormats/ParticleFlowCandidate RecoParticleFlow/Benchmark CommonTools/UtilAlgos Geometry/HcalTowerAlgo MagneticField/Records 
ALL_EXTERNAL_PLUGIN_PRODS += ValidationRecoParticleFlow_plugins
Validation/RecoParticleFlow_relbigobj+=ValidationRecoParticleFlow_plugins
endif
ifeq ($(strip $(FWCore/Version)),)
FWCoreVersion := self/FWCore/Version
FWCore/Version := FWCoreVersion
FWCoreVersion_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreVersion_EX_USE := $(foreach d, self cmssw  ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreVersion_EX_LIB   := FWCoreVersion
ALL_EXTERNAL_PRODS += FWCoreVersion
FWCoreVersion_CLASS := LIBRARY
FWCore/Version_relbigobj+=FWCoreVersion
endif
