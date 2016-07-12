#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#!/bin/bash

clang -integrated-as -std=c89 -c test.c -o test-tegra2.o -ccc-host-triple armv7-none-linux-gnueabi -mcpu=cortex-a9 -mfpu=vfp
clang -integrated-as -std=c89 -c test.c -o test-arm.o -ccc-host-triple armv7-none-linux-gnueabi
clang -integrated-as -std=c89 -c test.c -o test-x86_32.o -ccc-host-triple i686-none-linux
clang -integrated-as -std=c89 -c test.c -o test-x86_64.o -ccc-host-triple x86_64-none-linux

clang -integrated-as -std=c89 -c simple-test.c -o simple-test-arm.o -ccc-host-triple armv7-none-linux-gnueabi
clang -integrated-as -std=c89 -c simple-test.c -o simple-test-x86_32.o -ccc-host-triple i686-none-linux
clang -integrated-as -std=c89 -c simple-test.c -o simple-test-x86_64.o -ccc-host-triple x86_64-none-linux

clang -integrated-as -std=c89 -c rodata-test.c -o rodata-test-tegra2.o -ccc-host-triple armv7-none-linux-gnueabi -mcpu=cortex-a9 -mfpu=vfp
clang -integrated-as -std=c89 -c rodata-test.c -o rodata-test-arm.o -ccc-host-triple armv7-none-linux-gnueabi
clang -integrated-as -std=c89 -c rodata-test.c -o rodata-test-x86_32.o -ccc-host-triple i686-none-linux
clang -integrated-as -std=c89 -c rodata-test.c -o rodata-test-x86_64.o -ccc-host-triple x86_64-none-linux
