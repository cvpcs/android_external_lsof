LOCAL_PATH := $(call my-dir)

# build static library
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	ckkv.c cvfs.c dvch.c fino.c isfn.c lkud.c pdvn.c prfp.c \
	ptti.c rdev.c regex.c rmnt.c rnam.c rnch.c rnmh.c snpf.c

LOCAL_MODULE := liblsof
LOCAL_MODULE_TAGS:= eng

LOCAL_C_INCLUDES := external/lsof/lib

LOCAL_CFLAGS := -Os -g -W -Wall \
        -DLINUXV=26032 \
        -D__BIONIC__ \
        -DHASIPv6 \
        -D_FILE_OFFSET_BITS=32 \
        -DHAS_STRFTIME \
        -DLSOF_VSTR=\"2.6.32-androidlol\"

LOCAL_PRELINK_MODULE := false

include $(BUILD_STATIC_LIBRARY)
