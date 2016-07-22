#ifneq ($(TARGET_BOARD_PLATFORM),msm8960
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
# ---------------------------------------------------------------------------------
#            Common definitons
# ---------------------------------------------------------------------------------
LOCAL_SRC_FILES:=                       \
        DashPlayer.cpp                  \
        DashPlayerDriver.cpp            \
        DashPlayerRenderer.cpp          \
        DashPlayerStats.cpp             \
        DashPlayerDecoder.cpp           \
        DashPacketSource.cpp            \
        DashFactory.cpp                 \
        DashCodec.cpp

LOCAL_SHARED_LIBRARIES :=       \
    libbinder                   \
    libcamera_client            \
    libcutils                   \
    libdl                       \
    libgui                      \
    libmedia                    \
    libstagefright              \
    libstagefright_foundation   \
    libstagefright_omx          \
    libutils                    \
    libui                       \

LOCAL_STATIC_LIBRARIES :=       \
    libstagefright_nuplayer     \
    libstagefright_rtsp         \

LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/av/media/libstagefright/timedtext           \
	$(TOP)/frameworks/native-caf/include/media/hardware               \
	$(TOP)/frameworks/native-caf/include/media/openmax                \
	$(TOP)/frameworks/av-caf/media/libstagefright/httplive            \
	$(TOP)/frameworks/av-caf/media/libmediaplayerservice/nuplayer     \
	$(TOP)/frameworks/av-caf/media/libmediaplayerservice              \
	$(TOP)/frameworks/av-caf/media/libstagefright/include             \
	$(TOP)/frameworks/av-caf/media/libstagefright/mpeg2ts             \
	$(TOP)/frameworks/av-caf/media/libstagefright/rtsp                \
	$(TOP)/hardware/qcom/media-caf-msm8960/mm-core/inc                        \

ifeq ($(PLATFORM_SDK_VERSION), 18)
ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 18 ))" )))
  LOCAL_CFLAGS += -DANDROID_JB_MR2
endif

LOCAL_MODULE:= libdashplayer

LOCAL_MODULE_TAGS := eng

include $(BUILD_SHARED_LIBRARY)
endif
