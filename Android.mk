ifeq ($(BOARD_WPA_SUPPLICANT_DRIVER),NL80211)
    include $(call all-subdir-makefiles)
endif
