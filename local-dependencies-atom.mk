include $(CLEAR_VARS)
LOCAL_MODULE := json
LOCAL_EXPORT_C_INCLUDES := $(shell pkg-config --cflags json-c)
LOCAL_EXPORT_LDLIBS := $(shell pkg-config --libs json-c)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := curl
LOCAL_EXPORT_C_INCLUDES := $(shell pkg-config --cflags libcurl)
LOCAL_EXPORT_LDLIBS := $(shell pkg-config --libs libcurl)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := uthash
include $(BUILD_PREBUILT)
