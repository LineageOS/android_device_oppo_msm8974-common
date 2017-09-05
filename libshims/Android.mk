LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    camera_shim.cpp

LOCAL_SHARED_LIBRARIES := \
    libui \
    libbase \
    android.hidl.token@1.0-utils \
    android.hardware.graphics.bufferqueue@1.0 \
    libgui

LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 32

include $(BUILD_SHARED_LIBRARY)
