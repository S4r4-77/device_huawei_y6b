#
# Copyright (C) 2025-2026 The TWRP Project
# Copyright (C) 2025-2026 Community contributions for Huawei MT6765 devices
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/huawei/y6b

# Allow building with minimal / missing dependencies
ALLOW_MISSING_DEPENDENCIES := true

# Architecture — 64-bit primary (very important!)
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

# Platform / SoC
TARGET_BOARD_PLATFORM := mt6765
TARGET_BOARD_PLATFORM_GPU := mali-g52

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(LOCAL_PATH)/prebuilt/dtb.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_FORCE_PREBUILT_KERNEL := true

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive

BOARD_KERNEL_IMAGE_NAME := Image
# If your kernel file is gzipped → change the next line to:
# BOARD_KERNEL_IMAGE_NAME := Image.gz

# Partition sizes (from your ~45MB recovery.img)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 47185920
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 47185920

# Filesystems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Very important for modern decryption
BOARD_USES_METADATA_PARTITION := true

# TWRP Theme & General Settings
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# Brightness control (most common MTK path)
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024

# Crypto / Decryption flags — very important for Android 10/11
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := true
TW_NO_LEGACY_PROPS := true

# Most important for Huawei/MTK — shows internal storage
RECOVERY_SDCARD_ON_DATA := true

# MTP / ADB improvements
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_NEW_MINADBD := true
TW_HAS_MTP := true

# Other useful MTK / Huawei flags
TW_FORCE_USE_SYSTEM_FSTAB := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
TW_NO_SCREEN_BLANK := false

# Try to load the most common MTK touch drivers
# → You can reduce this list after first boot + log check
TW_LOAD_VENDOR_MODULES := "goodix_ts fts_ts ili_tek novatek_ts_i2c focaltech_ts"

# Very important — anti-rollback & build bypass
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 11.0   # ← try 10.0 / 11.0 / 12.0 — depending on your stock

# Build size & warning optimizations
PRODUCT_NO_DEBUG_BUILD := true
TARGET_RECOVERY_FORCE_FLASH_REPACK := true
