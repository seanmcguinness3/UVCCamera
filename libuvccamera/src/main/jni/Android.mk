#include $(call all-subdir-makefiles)
PROJ_PATH := $(call my-dir)
include $(CLEAR_VARS)
include $(PROJ_PATH)/UVCCamera/Android.mk
include $(PROJ_PATH)/libjpeg-turbo-1.5.0/Android.mk
include $(PROJ_PATH)/libusb/android/jni/Android.mk
include $(PROJ_PATH)/libuvc/android/jni/Android.mk

CVROOT := C:/AndroidApps/UVCCamera/sdk/native/jni

OPENCV_INSTALL_MODULES:=on
OPENCV_LIB_TYPE:=STATIC
include $(CVROOT)/OpenCV.mk
LOCAL_MODULE += libuvccamera

LOCAL_CFLAGS += -std=c++11 -frtti -fexceptions -fopenmp -w
LOCAL_LDLIBS += -llog -L$(SYSROOT)/usr/lib
LOCAL_LDFLAGS += -fopenmp

LOCAL_SHARED_LIBRARIES := opencv_core opencv_imgcodecs

include $(BUILD_SHARED_LIBRARY)