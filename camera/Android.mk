ifneq ($(filter bacon find7,$(TARGET_DEVICE)),)
include $(call all-subdir-makefiles)
endif
