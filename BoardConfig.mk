#
# Copyright (C) 2025-2026 The TWRP Project
# Copyright (C) 2025-2026 Community contributions for Huawei MT6765 devices
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/huawei/y6b

# Allow building with incomplete sources (common for recovery-only trees)
ALLOW_MISSING_DEPENDENCIES := true

# Architecture (64-bit kernel is standard on MT6765 even if vendor is 32-bit)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := armeabi-v7a
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

TARGET_SUPPORTS_64_BIT_APPS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6765
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := mt6765
TARGET_BOARD_PLATFORM_GPU := mali-g52

# Kernel / Boot image (from your recovery.img extraction)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(LOCAL_PATH)/prebuilt/dtb.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_FORCE_PREBUILT_KERNEL := true

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000

# Most MT6765 devices use this cmdline – permissive helps TWRP boot without SELinux issues
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive

BOARD_KERNEL_IMAGE_NAME := Image   # change to Image.gz if your prebuilt is gzipped

# Partitions (from your recovery.img – ~45 MB)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 47185920
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 47185920

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs   # matches your fstab /data
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Use metadata partition (required for FBE decryption)
BOARD_USES_METADATA_PARTITION := true

# TWRP theme & basic flags
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# Brightness control (common paths on MTK – adjust later if needed)
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024

# Crypto / Decryption (critical for your fstab → FBEv2 + metadata)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := true
TW_NO_LEGACY_PROPS := true

# Internal storage fix (very common on Huawei/MTK – shows /data/media as /sdcard)
RECOVERY_SDCARD_ON_DATA := true

# MTP & ADB improvements
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_NEW_MINADBD := true
TW_HAS_MTP := true

# Other common TWRP fixes for MTK/Huawei
TW_FORCE_USE_SYSTEM_FSTAB := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
TW_NO_SCREEN_BLANK := false
TW_LOAD_VENDOR_MODULES := "novatek_ts_i2c"   # example touchscreen – add yours if needed after test boot

# Anti-rollback / build hack (prevents rejection on older bootloader)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 11.0   # or 12.0 – match or go slightly higher than stock

# Optional – reduces recovery size & suppresses warnings
PRODUCT_NO_DEBUG_BUILD := true
TARGET_RECOVERY_FORCE_FLASH_REPACK := true
#touch
TW_LOAD_VENDOR_MODULES := "goodix_ts fts_ts ili_tek novatek_ts_i2c"