// Do NOT change. Changes will be lost next time file is generated

#define R__DICTIONARY_FILENAME tmpdIslc7_amd64_gcc10dIsrcdIValidationdIHGCalValidationdIsrcdIValidationHGCalValidationdIadIValidationHGCalValidation_xr
#define R__NO_DEPRECATION

/*******************************************************************/
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#define G__DICTIONARY
#include "RConfig.h"
#include "TClass.h"
#include "TDictAttributeMap.h"
#include "TInterpreter.h"
#include "TROOT.h"
#include "TBuffer.h"
#include "TMemberInspector.h"
#include "TInterpreter.h"
#include "TVirtualMutex.h"
#include "TError.h"

#ifndef G__ROOT
#define G__ROOT
#endif

#include "RtypesImp.h"
#include "TIsAProxy.h"
#include "TFileMergeInfo.h"
#include <algorithm>
#include "TCollectionProxyInfo.h"
/*******************************************************************/

#include "TDataMember.h"

// Header files passed as explicit arguments
#include "src/Validation/HGCalValidation/src/classes.h"

// Header files passed via #pragma extra_include

// The generated code does not explicitly qualify STL entities
namespace std {} using namespace std;

namespace ROOT {
   static void *new_ValidHit(void *p = 0);
   static void *newArray_ValidHit(Long_t size, void *p);
   static void delete_ValidHit(void *p);
   static void deleteArray_ValidHit(void *p);
   static void destruct_ValidHit(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::ValidHit*)
   {
      ::ValidHit *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TInstrumentedIsAProxy< ::ValidHit >(0);
      static ::ROOT::TGenericClassInfo 
         instance("ValidHit", ::ValidHit::Class_Version(), "Validation/HGCalValidation/interface/ValidHit.h", 8,
                  typeid(::ValidHit), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &::ValidHit::Dictionary, isa_proxy, 4,
                  sizeof(::ValidHit) );
      instance.SetNew(&new_ValidHit);
      instance.SetNewArray(&newArray_ValidHit);
      instance.SetDelete(&delete_ValidHit);
      instance.SetDeleteArray(&deleteArray_ValidHit);
      instance.SetDestructor(&destruct_ValidHit);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::ValidHit*)
   {
      return GenerateInitInstanceLocal((::ValidHit*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::ValidHit*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));
} // end of namespace ROOT

namespace ROOT {
   static TClass *edmcLcLWrapperlEvectorlEValidHitgRsPgR_Dictionary();
   static void edmcLcLWrapperlEvectorlEValidHitgRsPgR_TClassManip(TClass*);
   static void *new_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p = 0);
   static void *newArray_edmcLcLWrapperlEvectorlEValidHitgRsPgR(Long_t size, void *p);
   static void delete_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p);
   static void deleteArray_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p);
   static void destruct_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::edm::Wrapper<vector<ValidHit> >*)
   {
      ::edm::Wrapper<vector<ValidHit> > *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::edm::Wrapper<vector<ValidHit> >));
      static ::ROOT::TGenericClassInfo 
         instance("edm::Wrapper<vector<ValidHit> >", ::edm::Wrapper<vector<ValidHit> >::Class_Version(), "DataFormats/Common/interface/Wrapper.h", 24,
                  typeid(::edm::Wrapper<vector<ValidHit> >), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &edmcLcLWrapperlEvectorlEValidHitgRsPgR_Dictionary, isa_proxy, 4,
                  sizeof(::edm::Wrapper<vector<ValidHit> >) );
      instance.SetNew(&new_edmcLcLWrapperlEvectorlEValidHitgRsPgR);
      instance.SetNewArray(&newArray_edmcLcLWrapperlEvectorlEValidHitgRsPgR);
      instance.SetDelete(&delete_edmcLcLWrapperlEvectorlEValidHitgRsPgR);
      instance.SetDeleteArray(&deleteArray_edmcLcLWrapperlEvectorlEValidHitgRsPgR);
      instance.SetDestructor(&destruct_edmcLcLWrapperlEvectorlEValidHitgRsPgR);

      ::ROOT::AddClassAlternate("edm::Wrapper<vector<ValidHit> >","edm::Wrapper<std::vector<ValidHit> >");

      ::ROOT::AddClassAlternate("edm::Wrapper<vector<ValidHit> >","edm::Wrapper<std::vector<ValidHit, std::allocator<ValidHit> > >");
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::edm::Wrapper<vector<ValidHit> >*)
   {
      return GenerateInitInstanceLocal((::edm::Wrapper<vector<ValidHit> >*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::edm::Wrapper<vector<ValidHit> >*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *edmcLcLWrapperlEvectorlEValidHitgRsPgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::edm::Wrapper<vector<ValidHit> >*)0x0)->GetClass();
      edmcLcLWrapperlEvectorlEValidHitgRsPgR_TClassManip(theClass);
   return theClass;
   }

   static void edmcLcLWrapperlEvectorlEValidHitgRsPgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

//______________________________________________________________________________
atomic_TClass_ptr ValidHit::fgIsA(0);  // static to hold class pointer

//______________________________________________________________________________
const char *ValidHit::Class_Name()
{
   return "ValidHit";
}

//______________________________________________________________________________
const char *ValidHit::ImplFileName()
{
   return ::ROOT::GenerateInitInstanceLocal((const ::ValidHit*)0x0)->GetImplFileName();
}

//______________________________________________________________________________
int ValidHit::ImplFileLine()
{
   return ::ROOT::GenerateInitInstanceLocal((const ::ValidHit*)0x0)->GetImplFileLine();
}

//______________________________________________________________________________
TClass *ValidHit::Dictionary()
{
   fgIsA = ::ROOT::GenerateInitInstanceLocal((const ::ValidHit*)0x0)->GetClass();
   return fgIsA;
}

//______________________________________________________________________________
TClass *ValidHit::Class()
{
   if (!fgIsA.load()) { R__LOCKGUARD(gInterpreterMutex); fgIsA = ::ROOT::GenerateInitInstanceLocal((const ::ValidHit*)0x0)->GetClass(); }
   return fgIsA;
}

//______________________________________________________________________________
void ValidHit::Streamer(TBuffer &R__b)
{
   // Stream an object of class ValidHit.

   if (R__b.IsReading()) {
      R__b.ReadClassBuffer(ValidHit::Class(),this);
   } else {
      R__b.WriteClassBuffer(ValidHit::Class(),this);
   }
}

namespace ROOT {
   // Wrappers around operator new
   static void *new_ValidHit(void *p) {
      return  p ? new(p) ::ValidHit : new ::ValidHit;
   }
   static void *newArray_ValidHit(Long_t nElements, void *p) {
      return p ? new(p) ::ValidHit[nElements] : new ::ValidHit[nElements];
   }
   // Wrapper around operator delete
   static void delete_ValidHit(void *p) {
      delete ((::ValidHit*)p);
   }
   static void deleteArray_ValidHit(void *p) {
      delete [] ((::ValidHit*)p);
   }
   static void destruct_ValidHit(void *p) {
      typedef ::ValidHit current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::ValidHit

namespace ROOT {
   // Wrappers around operator new
   static void *new_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p) {
      return  p ? ::new((::ROOT::Internal::TOperatorNewHelper*)p) ::edm::Wrapper<vector<ValidHit> > : new ::edm::Wrapper<vector<ValidHit> >;
   }
   static void *newArray_edmcLcLWrapperlEvectorlEValidHitgRsPgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::Internal::TOperatorNewHelper*)p) ::edm::Wrapper<vector<ValidHit> >[nElements] : new ::edm::Wrapper<vector<ValidHit> >[nElements];
   }
   // Wrapper around operator delete
   static void delete_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p) {
      delete ((::edm::Wrapper<vector<ValidHit> >*)p);
   }
   static void deleteArray_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p) {
      delete [] ((::edm::Wrapper<vector<ValidHit> >*)p);
   }
   static void destruct_edmcLcLWrapperlEvectorlEValidHitgRsPgR(void *p) {
      typedef ::edm::Wrapper<vector<ValidHit> > current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::edm::Wrapper<vector<ValidHit> >

namespace ROOT {
   static TClass *vectorlEValidHitgR_Dictionary();
   static void vectorlEValidHitgR_TClassManip(TClass*);
   static void *new_vectorlEValidHitgR(void *p = 0);
   static void *newArray_vectorlEValidHitgR(Long_t size, void *p);
   static void delete_vectorlEValidHitgR(void *p);
   static void deleteArray_vectorlEValidHitgR(void *p);
   static void destruct_vectorlEValidHitgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<ValidHit>*)
   {
      vector<ValidHit> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<ValidHit>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<ValidHit>", -2, "vector", 389,
                  typeid(vector<ValidHit>), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &vectorlEValidHitgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<ValidHit>) );
      instance.SetNew(&new_vectorlEValidHitgR);
      instance.SetNewArray(&newArray_vectorlEValidHitgR);
      instance.SetDelete(&delete_vectorlEValidHitgR);
      instance.SetDeleteArray(&deleteArray_vectorlEValidHitgR);
      instance.SetDestructor(&destruct_vectorlEValidHitgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<ValidHit> >()));

      ::ROOT::AddClassAlternate("vector<ValidHit>","std::vector<ValidHit, std::allocator<ValidHit> >");
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const vector<ValidHit>*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEValidHitgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<ValidHit>*)0x0)->GetClass();
      vectorlEValidHitgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEValidHitgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEValidHitgR(void *p) {
      return  p ? ::new((::ROOT::Internal::TOperatorNewHelper*)p) vector<ValidHit> : new vector<ValidHit>;
   }
   static void *newArray_vectorlEValidHitgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::Internal::TOperatorNewHelper*)p) vector<ValidHit>[nElements] : new vector<ValidHit>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEValidHitgR(void *p) {
      delete ((vector<ValidHit>*)p);
   }
   static void deleteArray_vectorlEValidHitgR(void *p) {
      delete [] ((vector<ValidHit>*)p);
   }
   static void destruct_vectorlEValidHitgR(void *p) {
      typedef vector<ValidHit> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<ValidHit>

namespace {
  void TriggerDictionaryInitialization_ValidationHGCalValidation_xr_Impl() {
    static const char* headers[] = {
"0",
0
    };
    static const char* includePaths[] = {
"/uscms_data/d3/nswood/Notebooks/AE_Dev/models/CMSSW_12_5_2_patch1/src",
"/uscms_data/d3/nswood/Notebooks/AE_Dev/models/CMSSW_12_5_2_patch1/poison",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw-patch/CMSSW_12_5_2_patch1/src",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/dd4hep/v01-19x-9f8e66d3f2a7c9d76d7fed87c7424aa6/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/classlib/3.1.3-7a805383ac3cf7b871d22a6c66bd8f6f/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/geant4/10.7.2-de00a520f12d7612b9b1aabc9b70eef3/include/Geant4",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/geant4/10.7.2-de00a520f12d7612b9b1aabc9b70eef3/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pcre/8.43-28d54724578a9006cf0dca75629374e3/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/bz2lib/1.0.6-86270889250d9cb8193d1963706a39cb/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/cuda/11.5.2-c927b7e765e06433950d8a7eab9eddb4/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/expat/2.1.0-e2e74851cebffc0aa0988d120ae74fcd/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/gsl/2.6-b614983d7a3915ce8c14658bc72be5cb/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/hepmc/2.06.10-46867a6dcc6e5712b7953fe57085fcbd/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libuuid/2.34-fe91b21b8e54a48f2d45894d9da65f14/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/protobuf/3.15.1-7e10d5eb9143430224a15d6b61e33af1/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/vdt/0.4.3-4cf643375686641d118ddf967ccfd199/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/vecgeom/v1.1.17-7ce0f1b5045075193fd912aa24f47572/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/vecgeom/v1.1.17-7ce0f1b5045075193fd912aa24f47572/include/VecGeom",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xerces-c/3.1.3-5b1e4ab8f5a2057565f3be0ae6a10b37/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xz/5.2.5-d6fed2038c4e8d6e04531d1adba59f37/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/zlib/1.2.11-71514f01d2850dfd0bcd391557259a58/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/eigen/82dd3710dac619448f50331c1d6a35da673f764a-01f0fbbc69fe5c11dd0acfe3c748f30b/include/eigen3",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fmt/8.0.1-b8a6534feba2e3dac314eff5040afd69/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/md5/1.0.0-0440f43b57c5656322f7cd7a65f85771/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/OpenBLAS/0.3.15-04b535a741a2f5a1f273ae128823f6ef/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tinyxml2/6.2.0-b4ef6e4242045ed0c243ef457f5b32a5/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/lcg/root/6.24.07-a31cbfc28a0c92b3c007615905b5b9b2/include/",
"/uscms_data/d3/nswood/Notebooks/AE_Dev/models/CMSSW_12_5_2_patch1/",
0
    };
    static const char* fwdDeclCode = R"DICTFWDDCLS(
#line 1 "ValidationHGCalValidation_xr dictionary forward declarations' payload"
#pragma clang diagnostic ignored "-Wkeyword-compat"
#pragma clang diagnostic ignored "-Wignored-attributes"
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
extern int __Cling_AutoLoading_Map;
class __attribute__((annotate("$clingAutoload$Validation/HGCalValidation/interface/ValidHit.h")))  ValidHit;
namespace std{template <typename _Tp> class __attribute__((annotate("$clingAutoload$bits/allocator.h")))  __attribute__((annotate("$clingAutoload$string")))  allocator;
}
)DICTFWDDCLS";
    static const char* payloadCode = R"DICTPAYLOAD(
#line 1 "ValidationHGCalValidation_xr dictionary payload"

#ifndef CMS_DICT_IMPL
  #define CMS_DICT_IMPL 1
#endif
#ifndef _REENTRANT
  #define _REENTRANT 1
#endif
#ifndef GNUSOURCE
  #define GNUSOURCE 1
#endif
#ifndef __STRICT_ANSI__
  #define __STRICT_ANSI__ 1
#endif
#ifndef GNU_GCC
  #define GNU_GCC 1
#endif
#ifndef _GNU_SOURCE
  #define _GNU_SOURCE 1
#endif
#ifndef EIGEN_DONT_PARALLELIZE
  #define EIGEN_DONT_PARALLELIZE 1
#endif
#ifndef TBB_USE_GLIBCXX_VERSION
  #define TBB_USE_GLIBCXX_VERSION 100300
#endif
#ifndef TBB_SUPPRESS_DEPRECATED_MESSAGES
  #define TBB_SUPPRESS_DEPRECATED_MESSAGES 1
#endif
#ifndef TBB_PREVIEW_RESUMABLE_TASKS
  #define TBB_PREVIEW_RESUMABLE_TASKS 1
#endif
#ifndef TBB_PREVIEW_TASK_GROUP_EXTENSIONS
  #define TBB_PREVIEW_TASK_GROUP_EXTENSIONS 1
#endif
#ifndef BOOST_SPIRIT_THREADSAFE
  #define BOOST_SPIRIT_THREADSAFE 1
#endif
#ifndef PHOENIX_THREADSAFE
  #define PHOENIX_THREADSAFE 1
#endif
#ifndef BOOST_MATH_DISABLE_STD_FPCLASSIFY
  #define BOOST_MATH_DISABLE_STD_FPCLASSIFY 1
#endif
#ifndef BOOST_UUID_RANDOM_PROVIDER_FORCE_POSIX
  #define BOOST_UUID_RANDOM_PROVIDER_FORCE_POSIX 1
#endif
#ifndef GNU_GCC
  #define GNU_GCC 1
#endif
#ifndef G4V9
  #define G4V9 1
#endif
#ifndef __STDC_LIMIT_MACROS
  #define __STDC_LIMIT_MACROS 1
#endif
#ifndef __STDC_FORMAT_MACROS
  #define __STDC_FORMAT_MACROS 1
#endif
#ifndef GNU_GCC
  #define GNU_GCC 1
#endif
#ifndef G4V9
  #define G4V9 1
#endif
#ifndef DD4HEP_USE_GEANT4_UNITS
  #define DD4HEP_USE_GEANT4_UNITS 1
#endif
#ifndef CMSSW_GIT_HASH
  #define CMSSW_GIT_HASH "CMSSW_12_5_2_patch1"
#endif
#ifndef PROJECT_NAME
  #define PROJECT_NAME "CMSSW"
#endif
#ifndef PROJECT_VERSION
  #define PROJECT_VERSION "CMSSW_12_5_2_patch1"
#endif
#ifndef CMSSW_REFLEX_DICT
  #define CMSSW_REFLEX_DICT 1
#endif

#define _BACKWARD_BACKWARD_WARNING_H
// Inline headers
#ifdef __CINT_
#pragma link off all globals;
#pragma link off all classes;
#pragma link off all functions;
#pragma link C++ nestedclasses;
#pragma link C++ class ValidHit + ;
#pragma link C++ class vector < ValidHit> + ;
#endif /* __CINT__ */

#include "Validation/HGCalValidation/interface/ValidHit.h"
#include "DataFormats/Common/interface/AssociationVector.h"
#include "DataFormats/Common/interface/AssociationMap.h"

#undef  _BACKWARD_BACKWARD_WARNING_H
)DICTPAYLOAD";
    static const char* classesHeaders[] = {
"ValidHit", payloadCode, "@",
"edm::Wrapper<std::vector<ValidHit> >", payloadCode, "@",
"edm::Wrapper<vector<ValidHit> >", payloadCode, "@",
nullptr
};
    static bool isInitialized = false;
    if (!isInitialized) {
      TROOT::RegisterModule("ValidationHGCalValidation_xr",
        headers, includePaths, payloadCode, fwdDeclCode,
        TriggerDictionaryInitialization_ValidationHGCalValidation_xr_Impl, {}, classesHeaders, /*hasCxxModule*/false);
      isInitialized = true;
    }
  }
  static struct DictInit {
    DictInit() {
      TriggerDictionaryInitialization_ValidationHGCalValidation_xr_Impl();
    }
  } __TheDictionaryInitializer;
}
void TriggerDictionaryInitialization_ValidationHGCalValidation_xr() {
  TriggerDictionaryInitialization_ValidationHGCalValidation_xr_Impl();
}
