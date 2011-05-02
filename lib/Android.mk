#
# Copyright (C) 2008 The Android Open Source Project
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
#

LOCAL_PATH := $(call my-dir)

# To force sizeof(enum) = 4
ifeq ($(TARGET_ARCH),arm)
L_CFLAGS += -mabi=aapcs-linux
endif

# To ignore possible wrong network configurations
L_CFLAGS += -DWPA_IGNORE_CONFIG_ERRORS

# OpenSSL is configured without engines on Android
L_CFLAGS += -DOPENSSL_NO_ENGINE

INCLUDES = $(LOCAL_PATH)
INCLUDES += $(LOCAL_PATH)/../include
INCLUDES += bionic/libc/include
INCLUDES += bionic/libc/arch-x86/include
INCLUDES += bionic/libc/kernel/common
INCLUDES += bionic/libc/kernel/arch-x86
INCLUDES += bionic/libm/include
INCLUDES += external/openssl/include

LIBNL_OBJ = addr.c
LIBNL_OBJ += attr.c
LIBNL_OBJ += cache.c
LIBNL_OBJ += cache_mngr.c
LIBNL_OBJ += cache_mngt.c
LIBNL_OBJ += data.c
LIBNL_OBJ += doc.c
LIBNL_OBJ += family.c
LIBNL_OBJ += handlers.c
LIBNL_OBJ += msg.c
LIBNL_OBJ += nl.c
LIBNL_OBJ += object.c
LIBNL_OBJ += socket.c
LIBNL_OBJ += utils.c

GENL_OBJ = genl/genl.c
GENL_OBJ += genl/ctrl.c
GENL_OBJ += genl/mngt.c
GENL_OBJ += genl/family.c

ifdef CONFIG_ANDROID_LOG
L_CFLAGS += -DCONFIG_ANDROID_LOG
endif

include $(CLEAR_VARS)
LOCAL_MODULE = libnl
LOCAL_MODULE_TAGS := debug
LOCAL_CFLAGS = $(L_CFLAGS)
LOCAL_SRC_FILES = $(LIBNL_OBJ) $(GENL_OBJ)
LOCAL_C_INCLUDES = $(INCLUDES)
include $(BUILD_SHARED_LIBRARY)
