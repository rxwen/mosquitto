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
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := eng
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/lib

LOCAL_CFLAGS += -D__ANDROID__

LOCAL_SRC_FILES := \
	lib/logging_mosq.c \
	lib/memory_mosq.c \
	lib/messages_mosq.c \
	lib/mosquitto.c \
	lib/net_mosq.c \
	lib/read_handle.c \
	lib/read_handle_client.c \
	lib/read_handle_shared.c \
	lib/send_client_mosq.c \
	lib/send_mosq.c \
	lib/socks_mosq.c \
	lib/srv_mosq.c \
	lib/thread_mosq.c \
	lib/time_mosq.c \
	lib/tls_mosq.c \
	lib/util_mosq.c \
	lib/will_mosq.c

LOCAL_SHARED_LIBRARIES := \

LOCAL_MODULE := libmosquitto
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := mosquitto

LOCAL_SRC_FILES := \
	src/conf.c \
	src/context.c \
	src/database.c \
	src/lib_load.h \
	src/logging.c \
	src/loop.c \
	src/../lib/memory_mosq.c \
	src/mosquitto.c \
	src/net.c \
	src/../lib/net_mosq.c \
	src/persist.c \
	src/read_handle.c \
	src/read_handle_client.c \
	src/read_handle_server.c \
	src/../lib/read_handle_shared.c \
	src/subs.c \
	src/security.c \
	src/security_default.c \
	src/../lib/send_client_mosq.c \
	src/../lib/send_mosq.c \
	src/send_server.c \
	src/sys_tree.c \
	src/../lib/time_mosq.c \
	src/../lib/tls_mosq.c \
	src/../lib/util_mosq.c \
	src/websockets.c \
	src/../lib/will_mosq.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/src \
	$(LOCAL_PATH)/lib

LOCAL_CFLAGS += -DWITH_BROKER \
	-DVERSION="\"$(shell git describe)\"" \
	-D__ANDROID__ \
	-DTIMESTAMP="\"$(shell date)\""

LOCAL_LDLIBS += -ldl

LOCAL_SHARED_LIBRARIES := \
	libmosquitto

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := eng

include $(BUILD_EXECUTABLE)
