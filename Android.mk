LOCAL_PATH := $(call my-dir)

#########################################################################
# Build lsof (shared)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	dfile.c dmnt.c dnode.c dproc.c dsock.c dstore.c \
	arg.c main.c misc.c node.c print.c proc.c store.c usage.c \
	util.c

LOCAL_C_INCLUDES := \
	external/clearsilver/util/regex

LOCAL_CFLAGS := -Os -g -W -Wall \
	-DLINUXV=26032 \
	-D__BIONIC__ \
	-DHASIPv6 \
	-D_FILE_OFFSET_BITS=32 \
	-DHAS_STRFTIME \
	-DLSOF_VSTR=\"2.6.32-androidlol\"

LOCAL_MODULE := lsof
LOCAL_MODULE_TAGS := eng

LOCAL_STATIC_LIBRARIES := \
	liblsof \
	libc

include $(BUILD_EXECUTABLE)

#########################################################################
# Build lsof (static utility)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	dfile.c dmnt.c dnode.c dproc.c dsock.c dstore.c \
	arg.c main.c misc.c node.c print.c proc.c store.c usage.c \
	util.c

LOCAL_C_INCLUDES := \
	external/clearsilver/util/regex

LOCAL_CFLAGS := -Os -g -W -Wall \
	-DLINUXV=26032 \
	-D__BIONIC__ \
	-DHASIPv6 \
	-D_FILE_OFFSET_BITS=32 \
	-DHAS_STRFTIME \
	-DLSOF_VSTR=\"2.6.32-androidlol\"

LOCAL_MODULE := utility_lsof
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_STEM := lsof

LOCAL_STATIC_LIBRARIES := \
	liblsof \
	libc

LOCAL_FORCE_STATIC_EXECUTABLE := true

include $(BUILD_EXECUTABLE)

include $(call all-subdir-makefiles)
