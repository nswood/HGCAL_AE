// Do NOT change. Changes will be lost next time file is generated

#define R__DICTIONARY_FILENAME tmpdIslc7_amd64_gcc10dIsrcdIDataFormatsdIForwardDetIddIsrcdIDataFormatsForwardDetIddIadIDataFormatsForwardDetId_xr
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

#include "TBuffer.h"
#include "TVirtualObject.h"
#include <vector>
#include "TSchemaHelper.h"


// Header files passed as explicit arguments
#include "src/DataFormats/ForwardDetId/src/classes.h"

// Header files passed via #pragma extra_include

// The generated code does not explicitly qualify STL entities
namespace std {} using namespace std;

namespace ROOT {
   static TClass *HGCEEDetId_Dictionary();
   static void HGCEEDetId_TClassManip(TClass*);
   static void *new_HGCEEDetId(void *p = 0);
   static void *newArray_HGCEEDetId(Long_t size, void *p);
   static void delete_HGCEEDetId(void *p);
   static void deleteArray_HGCEEDetId(void *p);
   static void destruct_HGCEEDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HGCEEDetId*)
   {
      ::HGCEEDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HGCEEDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HGCEEDetId", 13, "DataFormats/ForwardDetId/interface/HGCEEDetId.h", 8,
                  typeid(::HGCEEDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HGCEEDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HGCEEDetId) );
      instance.SetNew(&new_HGCEEDetId);
      instance.SetNewArray(&newArray_HGCEEDetId);
      instance.SetDelete(&delete_HGCEEDetId);
      instance.SetDeleteArray(&deleteArray_HGCEEDetId);
      instance.SetDestructor(&destruct_HGCEEDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HGCEEDetId*)
   {
      return GenerateInitInstanceLocal((::HGCEEDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HGCEEDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HGCEEDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HGCEEDetId*)0x0)->GetClass();
      HGCEEDetId_TClassManip(theClass);
   return theClass;
   }

   static void HGCEEDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HGCHEDetId_Dictionary();
   static void HGCHEDetId_TClassManip(TClass*);
   static void *new_HGCHEDetId(void *p = 0);
   static void *newArray_HGCHEDetId(Long_t size, void *p);
   static void delete_HGCHEDetId(void *p);
   static void deleteArray_HGCHEDetId(void *p);
   static void destruct_HGCHEDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HGCHEDetId*)
   {
      ::HGCHEDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HGCHEDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HGCHEDetId", 13, "DataFormats/ForwardDetId/interface/HGCHEDetId.h", 8,
                  typeid(::HGCHEDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HGCHEDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HGCHEDetId) );
      instance.SetNew(&new_HGCHEDetId);
      instance.SetNewArray(&newArray_HGCHEDetId);
      instance.SetDelete(&delete_HGCHEDetId);
      instance.SetDeleteArray(&deleteArray_HGCHEDetId);
      instance.SetDestructor(&destruct_HGCHEDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HGCHEDetId*)
   {
      return GenerateInitInstanceLocal((::HGCHEDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HGCHEDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HGCHEDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HGCHEDetId*)0x0)->GetClass();
      HGCHEDetId_TClassManip(theClass);
   return theClass;
   }

   static void HGCHEDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HGCalDetId_Dictionary();
   static void HGCalDetId_TClassManip(TClass*);
   static void *new_HGCalDetId(void *p = 0);
   static void *newArray_HGCalDetId(Long_t size, void *p);
   static void delete_HGCalDetId(void *p);
   static void deleteArray_HGCalDetId(void *p);
   static void destruct_HGCalDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HGCalDetId*)
   {
      ::HGCalDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HGCalDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HGCalDetId", 14, "DataFormats/ForwardDetId/interface/HGCalDetId.h", 8,
                  typeid(::HGCalDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HGCalDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HGCalDetId) );
      instance.SetNew(&new_HGCalDetId);
      instance.SetNewArray(&newArray_HGCalDetId);
      instance.SetDelete(&delete_HGCalDetId);
      instance.SetDeleteArray(&deleteArray_HGCalDetId);
      instance.SetDestructor(&destruct_HGCalDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HGCalDetId*)
   {
      return GenerateInitInstanceLocal((::HGCalDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HGCalDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HGCalDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HGCalDetId*)0x0)->GetClass();
      HGCalDetId_TClassManip(theClass);
   return theClass;
   }

   static void HGCalDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HGCSiliconDetId_Dictionary();
   static void HGCSiliconDetId_TClassManip(TClass*);
   static void *new_HGCSiliconDetId(void *p = 0);
   static void *newArray_HGCSiliconDetId(Long_t size, void *p);
   static void delete_HGCSiliconDetId(void *p);
   static void deleteArray_HGCSiliconDetId(void *p);
   static void destruct_HGCSiliconDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HGCSiliconDetId*)
   {
      ::HGCSiliconDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HGCSiliconDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HGCSiliconDetId", 15, "DataFormats/ForwardDetId/interface/HGCSiliconDetId.h", 22,
                  typeid(::HGCSiliconDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HGCSiliconDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HGCSiliconDetId) );
      instance.SetNew(&new_HGCSiliconDetId);
      instance.SetNewArray(&newArray_HGCSiliconDetId);
      instance.SetDelete(&delete_HGCSiliconDetId);
      instance.SetDeleteArray(&deleteArray_HGCSiliconDetId);
      instance.SetDestructor(&destruct_HGCSiliconDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HGCSiliconDetId*)
   {
      return GenerateInitInstanceLocal((::HGCSiliconDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HGCSiliconDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HGCSiliconDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HGCSiliconDetId*)0x0)->GetClass();
      HGCSiliconDetId_TClassManip(theClass);
   return theClass;
   }

   static void HGCSiliconDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HGCScintillatorDetId_Dictionary();
   static void HGCScintillatorDetId_TClassManip(TClass*);
   static void *new_HGCScintillatorDetId(void *p = 0);
   static void *newArray_HGCScintillatorDetId(Long_t size, void *p);
   static void delete_HGCScintillatorDetId(void *p);
   static void deleteArray_HGCScintillatorDetId(void *p);
   static void destruct_HGCScintillatorDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HGCScintillatorDetId*)
   {
      ::HGCScintillatorDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HGCScintillatorDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HGCScintillatorDetId", 15, "DataFormats/ForwardDetId/interface/HGCScintillatorDetId.h", 23,
                  typeid(::HGCScintillatorDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HGCScintillatorDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HGCScintillatorDetId) );
      instance.SetNew(&new_HGCScintillatorDetId);
      instance.SetNewArray(&newArray_HGCScintillatorDetId);
      instance.SetDelete(&delete_HGCScintillatorDetId);
      instance.SetDeleteArray(&deleteArray_HGCScintillatorDetId);
      instance.SetDestructor(&destruct_HGCScintillatorDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HGCScintillatorDetId*)
   {
      return GenerateInitInstanceLocal((::HGCScintillatorDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HGCScintillatorDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HGCScintillatorDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HGCScintillatorDetId*)0x0)->GetClass();
      HGCScintillatorDetId_TClassManip(theClass);
   return theClass;
   }

   static void HGCScintillatorDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HGCTriggerDetId_Dictionary();
   static void HGCTriggerDetId_TClassManip(TClass*);
   static void *new_HGCTriggerDetId(void *p = 0);
   static void *newArray_HGCTriggerDetId(Long_t size, void *p);
   static void delete_HGCTriggerDetId(void *p);
   static void deleteArray_HGCTriggerDetId(void *p);
   static void destruct_HGCTriggerDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HGCTriggerDetId*)
   {
      ::HGCTriggerDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HGCTriggerDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HGCTriggerDetId", 11, "DataFormats/ForwardDetId/interface/HGCTriggerDetId.h", 8,
                  typeid(::HGCTriggerDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HGCTriggerDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HGCTriggerDetId) );
      instance.SetNew(&new_HGCTriggerDetId);
      instance.SetNewArray(&newArray_HGCTriggerDetId);
      instance.SetDelete(&delete_HGCTriggerDetId);
      instance.SetDeleteArray(&deleteArray_HGCTriggerDetId);
      instance.SetDestructor(&destruct_HGCTriggerDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HGCTriggerDetId*)
   {
      return GenerateInitInstanceLocal((::HGCTriggerDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HGCTriggerDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HGCTriggerDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HGCTriggerDetId*)0x0)->GetClass();
      HGCTriggerDetId_TClassManip(theClass);
   return theClass;
   }

   static void HGCTriggerDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *FastTimeDetId_Dictionary();
   static void FastTimeDetId_TClassManip(TClass*);
   static void *new_FastTimeDetId(void *p = 0);
   static void *newArray_FastTimeDetId(Long_t size, void *p);
   static void delete_FastTimeDetId(void *p);
   static void deleteArray_FastTimeDetId(void *p);
   static void destruct_FastTimeDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::FastTimeDetId*)
   {
      ::FastTimeDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::FastTimeDetId));
      static ::ROOT::TGenericClassInfo 
         instance("FastTimeDetId", 14, "DataFormats/ForwardDetId/interface/FastTimeDetId.h", 8,
                  typeid(::FastTimeDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &FastTimeDetId_Dictionary, isa_proxy, 12,
                  sizeof(::FastTimeDetId) );
      instance.SetNew(&new_FastTimeDetId);
      instance.SetNewArray(&newArray_FastTimeDetId);
      instance.SetDelete(&delete_FastTimeDetId);
      instance.SetDeleteArray(&deleteArray_FastTimeDetId);
      instance.SetDestructor(&destruct_FastTimeDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::FastTimeDetId*)
   {
      return GenerateInitInstanceLocal((::FastTimeDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::FastTimeDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *FastTimeDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::FastTimeDetId*)0x0)->GetClass();
      FastTimeDetId_TClassManip(theClass);
   return theClass;
   }

   static void FastTimeDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *MTDDetId_Dictionary();
   static void MTDDetId_TClassManip(TClass*);
   static void *new_MTDDetId(void *p = 0);
   static void *newArray_MTDDetId(Long_t size, void *p);
   static void delete_MTDDetId(void *p);
   static void deleteArray_MTDDetId(void *p);
   static void destruct_MTDDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::MTDDetId*)
   {
      ::MTDDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::MTDDetId));
      static ::ROOT::TGenericClassInfo 
         instance("MTDDetId", 3, "DataFormats/ForwardDetId/interface/MTDDetId.h", 21,
                  typeid(::MTDDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &MTDDetId_Dictionary, isa_proxy, 12,
                  sizeof(::MTDDetId) );
      instance.SetNew(&new_MTDDetId);
      instance.SetNewArray(&newArray_MTDDetId);
      instance.SetDelete(&delete_MTDDetId);
      instance.SetDeleteArray(&deleteArray_MTDDetId);
      instance.SetDestructor(&destruct_MTDDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::MTDDetId*)
   {
      return GenerateInitInstanceLocal((::MTDDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::MTDDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *MTDDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::MTDDetId*)0x0)->GetClass();
      MTDDetId_TClassManip(theClass);
   return theClass;
   }

   static void MTDDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *BTLDetId_Dictionary();
   static void BTLDetId_TClassManip(TClass*);
   static void *new_BTLDetId(void *p = 0);
   static void *newArray_BTLDetId(Long_t size, void *p);
   static void delete_BTLDetId(void *p);
   static void deleteArray_BTLDetId(void *p);
   static void destruct_BTLDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::BTLDetId*)
   {
      ::BTLDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::BTLDetId));
      static ::ROOT::TGenericClassInfo 
         instance("BTLDetId", 3, "DataFormats/ForwardDetId/interface/BTLDetId.h", 18,
                  typeid(::BTLDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &BTLDetId_Dictionary, isa_proxy, 12,
                  sizeof(::BTLDetId) );
      instance.SetNew(&new_BTLDetId);
      instance.SetNewArray(&newArray_BTLDetId);
      instance.SetDelete(&delete_BTLDetId);
      instance.SetDeleteArray(&deleteArray_BTLDetId);
      instance.SetDestructor(&destruct_BTLDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::BTLDetId*)
   {
      return GenerateInitInstanceLocal((::BTLDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::BTLDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *BTLDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::BTLDetId*)0x0)->GetClass();
      BTLDetId_TClassManip(theClass);
   return theClass;
   }

   static void BTLDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *ETLDetId_Dictionary();
   static void ETLDetId_TClassManip(TClass*);
   static void *new_ETLDetId(void *p = 0);
   static void *newArray_ETLDetId(Long_t size, void *p);
   static void delete_ETLDetId(void *p);
   static void deleteArray_ETLDetId(void *p);
   static void destruct_ETLDetId(void *p);

   // Schema evolution read functions
   static void read_ETLDetId_0( char* target, TVirtualObject *oldObj )
   {
      //--- Automatically generated variables ---
      ETLDetId* newObj = (ETLDetId*)target;
      // Supress warning message.
      (void)oldObj;

      (void)newObj;

      //--- User's code ---
     
       ETLDetId tmp(newObj->newForm(newObj->rawId()));
        *newObj=tmp;
    
   }

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::ETLDetId*)
   {
      ::ETLDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::ETLDetId));
      static ::ROOT::TGenericClassInfo 
         instance("ETLDetId", 4, "DataFormats/ForwardDetId/interface/ETLDetId.h", 15,
                  typeid(::ETLDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &ETLDetId_Dictionary, isa_proxy, 12,
                  sizeof(::ETLDetId) );
      instance.SetNew(&new_ETLDetId);
      instance.SetNewArray(&newArray_ETLDetId);
      instance.SetDelete(&delete_ETLDetId);
      instance.SetDeleteArray(&deleteArray_ETLDetId);
      instance.SetDestructor(&destruct_ETLDetId);

      ::ROOT::Internal::TSchemaHelper* rule;

      // the io read rules
      std::vector<::ROOT::Internal::TSchemaHelper> readrules(1);
      rule = &readrules[0];
      rule->fSourceClass = "ETLDetId";
      rule->fTarget      = "";
      rule->fSource      = "";
      rule->fFunctionPtr = (void *)TFunc2void( read_ETLDetId_0);
      rule->fCode        = "\n       ETLDetId tmp(newObj->newForm(newObj->rawId()));\n        *newObj=tmp;\n    ";
      rule->fVersion     = "[-3]";
      instance.SetReadRules( readrules );
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::ETLDetId*)
   {
      return GenerateInitInstanceLocal((::ETLDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::ETLDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *ETLDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::ETLDetId*)0x0)->GetClass();
      ETLDetId_TClassManip(theClass);
   return theClass;
   }

   static void ETLDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HFNoseDetId_Dictionary();
   static void HFNoseDetId_TClassManip(TClass*);
   static void *new_HFNoseDetId(void *p = 0);
   static void *newArray_HFNoseDetId(Long_t size, void *p);
   static void delete_HFNoseDetId(void *p);
   static void deleteArray_HFNoseDetId(void *p);
   static void destruct_HFNoseDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HFNoseDetId*)
   {
      ::HFNoseDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HFNoseDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HFNoseDetId", 0, "DataFormats/ForwardDetId/interface/HFNoseDetId.h", 22,
                  typeid(::HFNoseDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HFNoseDetId_Dictionary, isa_proxy, 12,
                  sizeof(::HFNoseDetId) );
      instance.SetNew(&new_HFNoseDetId);
      instance.SetNewArray(&newArray_HFNoseDetId);
      instance.SetDelete(&delete_HFNoseDetId);
      instance.SetDeleteArray(&deleteArray_HFNoseDetId);
      instance.SetDestructor(&destruct_HFNoseDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HFNoseDetId*)
   {
      return GenerateInitInstanceLocal((::HFNoseDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HFNoseDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HFNoseDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HFNoseDetId*)0x0)->GetClass();
      HFNoseDetId_TClassManip(theClass);
   return theClass;
   }

   static void HFNoseDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *HFNoseTriggerDetId_Dictionary();
   static void HFNoseTriggerDetId_TClassManip(TClass*);
   static void *new_HFNoseTriggerDetId(void *p = 0);
   static void *newArray_HFNoseTriggerDetId(Long_t size, void *p);
   static void delete_HFNoseTriggerDetId(void *p);
   static void deleteArray_HFNoseTriggerDetId(void *p);
   static void destruct_HFNoseTriggerDetId(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::HFNoseTriggerDetId*)
   {
      ::HFNoseTriggerDetId *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::HFNoseTriggerDetId));
      static ::ROOT::TGenericClassInfo 
         instance("HFNoseTriggerDetId", "DataFormats/ForwardDetId/interface/HFNoseTriggerDetId.h", 26,
                  typeid(::HFNoseTriggerDetId), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &HFNoseTriggerDetId_Dictionary, isa_proxy, 4,
                  sizeof(::HFNoseTriggerDetId) );
      instance.SetNew(&new_HFNoseTriggerDetId);
      instance.SetNewArray(&newArray_HFNoseTriggerDetId);
      instance.SetDelete(&delete_HFNoseTriggerDetId);
      instance.SetDeleteArray(&deleteArray_HFNoseTriggerDetId);
      instance.SetDestructor(&destruct_HFNoseTriggerDetId);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::HFNoseTriggerDetId*)
   {
      return GenerateInitInstanceLocal((::HFNoseTriggerDetId*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_DICT_(Init) = GenerateInitInstanceLocal((const ::HFNoseTriggerDetId*)0x0); R__UseDummy(_R__UNIQUE_DICT_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *HFNoseTriggerDetId_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::HFNoseTriggerDetId*)0x0)->GetClass();
      HFNoseTriggerDetId_TClassManip(theClass);
   return theClass;
   }

   static void HFNoseTriggerDetId_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_HGCEEDetId(void *p) {
      return  p ? new(p) ::HGCEEDetId : new ::HGCEEDetId;
   }
   static void *newArray_HGCEEDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HGCEEDetId[nElements] : new ::HGCEEDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HGCEEDetId(void *p) {
      delete ((::HGCEEDetId*)p);
   }
   static void deleteArray_HGCEEDetId(void *p) {
      delete [] ((::HGCEEDetId*)p);
   }
   static void destruct_HGCEEDetId(void *p) {
      typedef ::HGCEEDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HGCEEDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HGCHEDetId(void *p) {
      return  p ? new(p) ::HGCHEDetId : new ::HGCHEDetId;
   }
   static void *newArray_HGCHEDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HGCHEDetId[nElements] : new ::HGCHEDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HGCHEDetId(void *p) {
      delete ((::HGCHEDetId*)p);
   }
   static void deleteArray_HGCHEDetId(void *p) {
      delete [] ((::HGCHEDetId*)p);
   }
   static void destruct_HGCHEDetId(void *p) {
      typedef ::HGCHEDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HGCHEDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HGCalDetId(void *p) {
      return  p ? new(p) ::HGCalDetId : new ::HGCalDetId;
   }
   static void *newArray_HGCalDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HGCalDetId[nElements] : new ::HGCalDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HGCalDetId(void *p) {
      delete ((::HGCalDetId*)p);
   }
   static void deleteArray_HGCalDetId(void *p) {
      delete [] ((::HGCalDetId*)p);
   }
   static void destruct_HGCalDetId(void *p) {
      typedef ::HGCalDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HGCalDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HGCSiliconDetId(void *p) {
      return  p ? new(p) ::HGCSiliconDetId : new ::HGCSiliconDetId;
   }
   static void *newArray_HGCSiliconDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HGCSiliconDetId[nElements] : new ::HGCSiliconDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HGCSiliconDetId(void *p) {
      delete ((::HGCSiliconDetId*)p);
   }
   static void deleteArray_HGCSiliconDetId(void *p) {
      delete [] ((::HGCSiliconDetId*)p);
   }
   static void destruct_HGCSiliconDetId(void *p) {
      typedef ::HGCSiliconDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HGCSiliconDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HGCScintillatorDetId(void *p) {
      return  p ? new(p) ::HGCScintillatorDetId : new ::HGCScintillatorDetId;
   }
   static void *newArray_HGCScintillatorDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HGCScintillatorDetId[nElements] : new ::HGCScintillatorDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HGCScintillatorDetId(void *p) {
      delete ((::HGCScintillatorDetId*)p);
   }
   static void deleteArray_HGCScintillatorDetId(void *p) {
      delete [] ((::HGCScintillatorDetId*)p);
   }
   static void destruct_HGCScintillatorDetId(void *p) {
      typedef ::HGCScintillatorDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HGCScintillatorDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HGCTriggerDetId(void *p) {
      return  p ? new(p) ::HGCTriggerDetId : new ::HGCTriggerDetId;
   }
   static void *newArray_HGCTriggerDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HGCTriggerDetId[nElements] : new ::HGCTriggerDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HGCTriggerDetId(void *p) {
      delete ((::HGCTriggerDetId*)p);
   }
   static void deleteArray_HGCTriggerDetId(void *p) {
      delete [] ((::HGCTriggerDetId*)p);
   }
   static void destruct_HGCTriggerDetId(void *p) {
      typedef ::HGCTriggerDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HGCTriggerDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_FastTimeDetId(void *p) {
      return  p ? new(p) ::FastTimeDetId : new ::FastTimeDetId;
   }
   static void *newArray_FastTimeDetId(Long_t nElements, void *p) {
      return p ? new(p) ::FastTimeDetId[nElements] : new ::FastTimeDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_FastTimeDetId(void *p) {
      delete ((::FastTimeDetId*)p);
   }
   static void deleteArray_FastTimeDetId(void *p) {
      delete [] ((::FastTimeDetId*)p);
   }
   static void destruct_FastTimeDetId(void *p) {
      typedef ::FastTimeDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::FastTimeDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_MTDDetId(void *p) {
      return  p ? new(p) ::MTDDetId : new ::MTDDetId;
   }
   static void *newArray_MTDDetId(Long_t nElements, void *p) {
      return p ? new(p) ::MTDDetId[nElements] : new ::MTDDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_MTDDetId(void *p) {
      delete ((::MTDDetId*)p);
   }
   static void deleteArray_MTDDetId(void *p) {
      delete [] ((::MTDDetId*)p);
   }
   static void destruct_MTDDetId(void *p) {
      typedef ::MTDDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::MTDDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_BTLDetId(void *p) {
      return  p ? new(p) ::BTLDetId : new ::BTLDetId;
   }
   static void *newArray_BTLDetId(Long_t nElements, void *p) {
      return p ? new(p) ::BTLDetId[nElements] : new ::BTLDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_BTLDetId(void *p) {
      delete ((::BTLDetId*)p);
   }
   static void deleteArray_BTLDetId(void *p) {
      delete [] ((::BTLDetId*)p);
   }
   static void destruct_BTLDetId(void *p) {
      typedef ::BTLDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::BTLDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_ETLDetId(void *p) {
      return  p ? new(p) ::ETLDetId : new ::ETLDetId;
   }
   static void *newArray_ETLDetId(Long_t nElements, void *p) {
      return p ? new(p) ::ETLDetId[nElements] : new ::ETLDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_ETLDetId(void *p) {
      delete ((::ETLDetId*)p);
   }
   static void deleteArray_ETLDetId(void *p) {
      delete [] ((::ETLDetId*)p);
   }
   static void destruct_ETLDetId(void *p) {
      typedef ::ETLDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::ETLDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HFNoseDetId(void *p) {
      return  p ? new(p) ::HFNoseDetId : new ::HFNoseDetId;
   }
   static void *newArray_HFNoseDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HFNoseDetId[nElements] : new ::HFNoseDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HFNoseDetId(void *p) {
      delete ((::HFNoseDetId*)p);
   }
   static void deleteArray_HFNoseDetId(void *p) {
      delete [] ((::HFNoseDetId*)p);
   }
   static void destruct_HFNoseDetId(void *p) {
      typedef ::HFNoseDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HFNoseDetId

namespace ROOT {
   // Wrappers around operator new
   static void *new_HFNoseTriggerDetId(void *p) {
      return  p ? new(p) ::HFNoseTriggerDetId : new ::HFNoseTriggerDetId;
   }
   static void *newArray_HFNoseTriggerDetId(Long_t nElements, void *p) {
      return p ? new(p) ::HFNoseTriggerDetId[nElements] : new ::HFNoseTriggerDetId[nElements];
   }
   // Wrapper around operator delete
   static void delete_HFNoseTriggerDetId(void *p) {
      delete ((::HFNoseTriggerDetId*)p);
   }
   static void deleteArray_HFNoseTriggerDetId(void *p) {
      delete [] ((::HFNoseTriggerDetId*)p);
   }
   static void destruct_HFNoseTriggerDetId(void *p) {
      typedef ::HFNoseTriggerDetId current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::HFNoseTriggerDetId

namespace {
  void TriggerDictionaryInitialization_DataFormatsForwardDetId_xr_Impl() {
    static const char* headers[] = {
"0",
0
    };
    static const char* includePaths[] = {
"/uscms_data/d3/nswood/Notebooks/AE_Dev/models/CMSSW_12_5_2_patch1/src",
"/uscms_data/d3/nswood/Notebooks/AE_Dev/models/CMSSW_12_5_2_patch1/poison",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/cms/cmssw-patch/CMSSW_12_5_2_patch1/src",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/pcre/8.43-28d54724578a9006cf0dca75629374e3/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/bz2lib/1.0.6-86270889250d9cb8193d1963706a39cb/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/libuuid/2.34-fe91b21b8e54a48f2d45894d9da65f14/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/xz/5.2.5-d6fed2038c4e8d6e04531d1adba59f37/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/zlib/1.2.11-71514f01d2850dfd0bcd391557259a58/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/fmt/8.0.1-b8a6534feba2e3dac314eff5040afd69/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/md5/1.0.0-0440f43b57c5656322f7cd7a65f85771/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/external/tinyxml2/6.2.0-b4ef6e4242045ed0c243ef457f5b32a5/include",
"/cvmfs/cms.cern.ch/slc7_amd64_gcc10/lcg/root/6.24.07-a31cbfc28a0c92b3c007615905b5b9b2/include/",
"/uscms_data/d3/nswood/Notebooks/AE_Dev/models/CMSSW_12_5_2_patch1/",
0
    };
    static const char* fwdDeclCode = R"DICTFWDDCLS(
#line 1 "DataFormatsForwardDetId_xr dictionary forward declarations' payload"
#pragma clang diagnostic ignored "-Wkeyword-compat"
#pragma clang diagnostic ignored "-Wignored-attributes"
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
extern int __Cling_AutoLoading_Map;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HGCEEDetId.h")))  HGCEEDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HGCHEDetId.h")))  HGCHEDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HGCalDetId.h")))  HGCalDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HGCSiliconDetId.h")))  HGCSiliconDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HGCScintillatorDetId.h")))  HGCScintillatorDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HGCTriggerDetId.h")))  HGCTriggerDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/FastTimeDetId.h")))  FastTimeDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/MTDDetId.h")))  MTDDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/BTLDetId.h")))  BTLDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/ETLDetId.h")))  ETLDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HFNoseDetId.h")))  HFNoseDetId;
class __attribute__((annotate("$clingAutoload$DataFormats/ForwardDetId/interface/HFNoseTriggerDetId.h")))  HFNoseTriggerDetId;
)DICTFWDDCLS";
    static const char* payloadCode = R"DICTPAYLOAD(
#line 1 "DataFormatsForwardDetId_xr dictionary payload"

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
#include "DataFormats/ForwardDetId/interface/HGCEEDetId.h"
#include "DataFormats/ForwardDetId/interface/HGCHEDetId.h"
#include "DataFormats/ForwardDetId/interface/HGCalDetId.h"
#include "DataFormats/ForwardDetId/interface/HGCSiliconDetId.h"
#include "DataFormats/ForwardDetId/interface/HGCScintillatorDetId.h"
#include "DataFormats/ForwardDetId/interface/HGCTriggerDetId.h"
#include "DataFormats/ForwardDetId/interface/FastTimeDetId.h"
#include "DataFormats/ForwardDetId/interface/MTDDetId.h"
#include "DataFormats/ForwardDetId/interface/BTLDetId.h"
#include "DataFormats/ForwardDetId/interface/ETLDetId.h"
#include "DataFormats/ForwardDetId/interface/HFNoseDetId.h"
#include "DataFormats/ForwardDetId/interface/HFNoseTriggerDetId.h"

#undef  _BACKWARD_BACKWARD_WARNING_H
)DICTPAYLOAD";
    static const char* classesHeaders[] = {
"BTLDetId", payloadCode, "@",
"ETLDetId", payloadCode, "@",
"FastTimeDetId", payloadCode, "@",
"HFNoseDetId", payloadCode, "@",
"HFNoseTriggerDetId", payloadCode, "@",
"HGCEEDetId", payloadCode, "@",
"HGCHEDetId", payloadCode, "@",
"HGCScintillatorDetId", payloadCode, "@",
"HGCSiliconDetId", payloadCode, "@",
"HGCTriggerDetId", payloadCode, "@",
"HGCalDetId", payloadCode, "@",
"MTDDetId", payloadCode, "@",
nullptr
};
    static bool isInitialized = false;
    if (!isInitialized) {
      TROOT::RegisterModule("DataFormatsForwardDetId_xr",
        headers, includePaths, payloadCode, fwdDeclCode,
        TriggerDictionaryInitialization_DataFormatsForwardDetId_xr_Impl, {}, classesHeaders, /*hasCxxModule*/false);
      isInitialized = true;
    }
  }
  static struct DictInit {
    DictInit() {
      TriggerDictionaryInitialization_DataFormatsForwardDetId_xr_Impl();
    }
  } __TheDictionaryInitializer;
}
void TriggerDictionaryInitialization_DataFormatsForwardDetId_xr() {
  TriggerDictionaryInitialization_DataFormatsForwardDetId_xr_Impl();
}
