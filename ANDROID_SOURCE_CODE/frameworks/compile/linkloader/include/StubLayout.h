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

#ifndef STUB_LAYOUT_H
#define STUB_LAYOUT_H

#include <stdlib.h>

class StubLayout {
private:
  unsigned char *table;
  size_t count;

public:
  StubLayout();

  void initStubTable(unsigned char *table, size_t count);
  void *allocateStub(void *addr = 0);

  size_t calcStubTableSize(size_t count) const;

private:
  void setStubAddress(void *stub, void *addr);

};

#endif // STUB_LAYOUT_H
