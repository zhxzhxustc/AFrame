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

#ifndef FLUSH_CPU_CACHE_H
#define FLUSH_CPU_CACHE_H

#ifdef __arm__

// Note: Though we wish to use the gcc builtin function __clear_cache to
// invalidate the instruction cache; however, the toolchain of Android
// has not supported it properly.  We are going to use cacheflush system
// call to invalidate the instruction cache.
//
// As a side note, Dalvik VM use the same system call to invalidate the
// instruction as well.

#include <unistd.h>

#define FLUSH_CPU_CACHE(BEGIN, END) \
  cacheflush(((long)(BEGIN)), ((long)(END)), 0)

#elif defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_)

#include <sys/cachectl.h>
#define FLUSH_CPU_CACHE(BEGIN, END) \
  _flush_cache(reinterpret_cast<char*>(BEGIN), END-BEGIN+1, BCACHE);

#else

#define FLUSH_CPU_CACHE(BEGIN, END) do { } while (0)

#endif

#endif // FLUSH_CPU_CACHE_H
