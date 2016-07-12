/*
 * Copyright 2011, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "librsloader.h"

#include "ELFObject.h"
#include "ELFSectionSymTab.h"
#include "ELFSymbol.h"

#include "utils/serialize.h"

#define LOG_TAG "bcc"
#include "cutils/log.h"

#include <llvm/ADT/OwningPtr.h>

static inline RSExecRef wrap(ELFObject<32> *object) {
  return reinterpret_cast<RSExecRef>(object);
}

static inline ELFObject<32> *unwrap(RSExecRef object) {
  return reinterpret_cast<ELFObject<32> *>(object);
}

extern "C" RSExecRef
rsloaderCreateExec(unsigned char const *buf,
                   size_t buf_size,
                   void *(*find_symbol)(void *, char const *),
                   void *find_symbol_context) {

  ArchiveReaderLE AR(buf, buf_size);

  llvm::OwningPtr<ELFObject<32> > object(ELFObject<32>::read(AR));
  if (!object) {
    LOGE("Unable to load the ELF object.");
    return NULL;
  }

  //object->print();
  object->relocate(find_symbol, find_symbol_context);

  return wrap(object.take());
}

extern "C" void rsloaderDisposeExec(RSExecRef object) {
  delete unwrap(object);
}

extern "C" void *rsloaderGetSymbolAddress(RSExecRef object_,
                                          char const *name) {
  ELFObject<32> *object = unwrap(object_);

  ELFSectionSymTab<32> *symtab =
    static_cast<ELFSectionSymTab<32> *>(object->getSectionByName(".symtab"));

  if (!symtab) {
    return NULL;
  }

  ELFSymbol<32> *symbol = symtab->getByName(name);

  if (!symbol) {
    LOGE("Symbol not found: %s\n", name);
    return NULL;
  }

  return symbol->getAddress(false);
}

extern "C" size_t rsloaderGetSymbolSize(RSExecRef object_, char const *name) {
  ELFObject<32> *object = unwrap(object_);

  ELFSectionSymTab<32> *symtab =
    static_cast<ELFSectionSymTab<32> *>(object->getSectionByName(".symtab"));

  if (!symtab) {
    return NULL;
  }

  ELFSymbol<32> *symbol = symtab->getByName(name);

  if (!symbol) {
    LOGE("Symbol not found: %s\n", name);
    return NULL;
  }

  return (size_t)symbol->getSize();
}

extern "C" size_t rsloaderGetFuncCount(RSExecRef object) {
  ELFSectionSymTab<32> *symtab = static_cast<ELFSectionSymTab<32> *>(
    unwrap(object)->getSectionByName(".symtab"));

  if (!symtab) {
    return 0;
  }

  return symtab->getFuncCount();
}

extern "C" void rsloaderGetFuncNameList(RSExecRef object,
                                        size_t size,
                                        char const **list) {
  ELFSectionSymTab<32> *symtab = static_cast<ELFSectionSymTab<32> *>(
    unwrap(object)->getSectionByName(".symtab"));

  if (symtab) {
    symtab->getFuncNameList(size, list);
  }
}
