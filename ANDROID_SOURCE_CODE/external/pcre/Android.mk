# Copyright (C) 2010 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE:= libpcre

intermediatesSrc := $(call intermediates-dir-for,STATIC_LIBRARIES,libpcre,HOST,)/pcre/src
intermediatesInc := $(call intermediates-dir-for,STATIC_LIBRARIES,libpcre,HOST,)/pcre/include

pcre_generated_header1 := $(intermediatesInc)/pcre.h
$(pcre_generated_header1): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/pcre.h.generic
$(pcre_generated_header1): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(pcre_generated_header1): $(LOCAL_PATH)/pcre.h.generic
	$(transform-generated-source)

pcre_generated_header2 := $(intermediatesInc)/config.h
$(pcre_generated_header2): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/config.h.android
$(pcre_generated_header2): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(pcre_generated_header2): $(LOCAL_PATH)/config.h.android
	$(transform-generated-source)

GEN := $(intermediatesSrc)/pcre_chartables.c
$(GEN): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/pcre_chartables.c.dist
$(GEN): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(GEN): $(LOCAL_PATH)/pcre_chartables.c.dist
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
$(GEN) : $(pcre_generated_header1) $(pcre_generated_header2)

LOCAL_C_INCLUDES += $(intermediatesInc)

PCRE_SRC_FILES := \
    pcre_compile.c \
    pcre_config.c \
    pcre_dfa_exec.c \
    pcre_exec.c \
    pcre_fullinfo.c \
    pcre_get.c \
    pcre_globals.c \
    pcre_info.c \
    pcre_newline.c \
    pcre_maketables.c \
    pcre_ord2utf8.c \
    pcre_refcount.c \
    pcre_study.c \
    pcre_tables.c \
    pcre_try_flipped.c \
    pcre_ucd.c \
    pcre_valid_utf8.c \
    pcre_version.c \
    pcre_xclass.c

# For the host
# ========================================================
LOCAL_SRC_FILES := $(PCRE_SRC_FILES)

LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -DHAVE_CONFIG_H
LOCAL_CFLAGS += -fPIC
include $(BUILD_HOST_STATIC_LIBRARY)

# Now we build pcrecpp
include $(CLEAR_VARS)

LOCAL_MODULE:= libpcrecpp
pcrecppIntermediatesInc := $(call intermediates-dir-for,STATIC_LIBRARIES,libpcrecpp,HOST,)/pcrecpp/include

pcre_cpp_generated_header1 := $(pcrecppIntermediatesInc)/pcre_stringpiece.h
$(pcre_cpp_generated_header1): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/pcre_stringpiece.h.android
$(pcre_cpp_generated_header1): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(pcre_cpp_generated_header1): $(LOCAL_PATH)/pcre_stringpiece.h.android
	$(transform-generated-source)

pcre_cpp_generated_header2 := $(pcrecppIntermediatesInc)/pcrecpparg.h
$(pcre_cpp_generated_header2): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/pcrecpparg.h.android
$(pcre_cpp_generated_header2): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(pcre_cpp_generated_header2): $(LOCAL_PATH)/pcrecpparg.h.android
$(pcre_cpp_generated_header2): $(pcre_generated_header1)
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(pcre_cpp_generated_header1) $(pcre_cpp_generated_header2) $(pcre_generated_header1)

LOCAL_C_INCLUDES += $(intermediatesInc)
LOCAL_C_INCLUDES += $(pcrecppIntermediatesInc)

LOCAL_CPP_EXTENSION := .cc

PCRE_CPP_SRC_FILES := \
	pcrecpp.cc \
        pcre_scanner.cc \
        pcre_stringpiece.cc

LOCAL_SRC_FILES := $(PCRE_CPP_SRC_FILES)

LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -fPIC
include $(BUILD_HOST_STATIC_LIBRARY)
