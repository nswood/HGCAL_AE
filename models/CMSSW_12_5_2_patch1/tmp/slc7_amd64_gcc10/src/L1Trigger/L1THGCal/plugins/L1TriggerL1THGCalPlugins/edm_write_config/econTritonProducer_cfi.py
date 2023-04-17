import FWCore.ParameterSet.Config as cms

econTritonProducer = cms.EDProducer('ECONTritonProducer',
  Client = cms.PSet(
    mode = cms.string('PseudoAsync'),
    allowedTries = cms.untracked.uint32(0),
    verbose = cms.untracked.bool(False),
    modelName = cms.required.string,
    modelVersion = cms.string(''),
    modelConfigPath = cms.required.FileInPath,
    preferredServer = cms.untracked.string(''),
    timeout = cms.required.untracked.uint32,
    useSharedMemory = cms.untracked.bool(True),
    compression = cms.untracked.string(''),
    outputs = cms.untracked.vstring()
  ),
  TriggerCells = cms.required.InputTag,
  inputType = cms.required.string,
  normType = cms.required.string,
  preNorm = cms.required.bool,
  cut = cms.required.string,
  verbose = cms.required.uint32,
  mightGet = cms.optional.untracked.vstring
)
