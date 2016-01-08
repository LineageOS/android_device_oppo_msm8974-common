ifeq ($(BOARD_VENDOR),oppo)
ifeq ($(TARGET_BOARD_PLATFORM),msm8974)
ifneq ($(filter find7 find7s n3,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles)

endif
endif
endif