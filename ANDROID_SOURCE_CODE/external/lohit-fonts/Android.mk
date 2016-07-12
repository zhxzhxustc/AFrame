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

# We have to use BUILD_PREBUILT instead of PRODUCT_COPY_FIES,
# to copy over the NOTICE file.

LOCAL_PATH := $(call my-dir)

extra_lohit_fonts :=
ifneq ($(SMALLER_FONT_FOOTPRINT),true)
extra_lohit_fonts := Lohit-Bengali.ttf Lohit-Tamil.ttf
endif

include $(CLEAR_VARS)
LOCAL_MODULE := Lohit-Devanagari.ttf
LOCAL_SRC_FILES := lohit-devanagari-ttf/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/fonts
LOCAL_REQUIRED_MODULES := $(extra_lohit_fonts)
extra_lohit_fonts :=
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := Lohit-Bengali.ttf
LOCAL_SRC_FILES := lohit-bengali-ttf/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/fonts
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := Lohit-Tamil.ttf
LOCAL_SRC_FILES := lohit-tamil-ttf/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/fonts
include $(BUILD_PREBUILT)
