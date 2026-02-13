#
# Copyright (C) 2025-2026 The Android Open Source Project
# Copyright (C) 2025-2026 TWRP project and community contributions
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/huawei/y6b

# Inherit common AOSP recovery stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from the common TWRP configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier
PRODUCT_DEVICE := y6b
PRODUCT_NAME := twrp_y6b
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Y6b
PRODUCT_MANUFACTURER := huawei

PRODUCT_CHARACTERISTICS := phone

# Architecture (must match BoardConfig.mk)
TARGET_SUPPORTS_64_BIT_APPS := true

# Recovery image specific
PRODUCT_PACKAGES += \
    twrp \
    init.recovery.mt6765.rc \
    recovery \
    fastbootd

# These are very useful / commonly needed in TWRP
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.example \
    android.hardware.secure_element@1.2-service \
    android.hardware.usb@1.3-service-mediatek \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.keymaster@4.1-service

# MTK-specific blobs (often needed for proper bring-up)
PRODUCT_PACKAGES += \
    libmtkcutils \
    libmtkruntime \
    libmtkshim \
    mtk_pq \
    mtk_mlcutil

# TWRP needs these to work correctly on many MTK devices
PRODUCT_PACKAGES += \
    resize.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    e2fsck \
    mke2fs \
    tune2fs \
    make_f2fs \
    fsck.erofs \
    extract.erofs \
    mkfs.erofs

# Copy recovery-specific files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/init.recovery.mt6765.rc:recovery/root/init.recovery.mt6765.rc \
    $(LOCAL_PATH)/twrp.fstab:recovery/root/system/etc/twrp.fstab

# If you use a custom recovery init script
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/init.recovery.rc:recovery/root/init.recovery.rc

# Suppress some build warnings (optional but common in TWRP builds)
PRODUCT_BROKEN_VERIFY_ELF := true
PRODUCT_NO_DEBUG_BUILD := true

# Reduce size of recovery image (optional)
PRODUCT_USES_FULL_TREBLE := false
PRODUCT_USES_VNDK_OVERRIDE := false

# This is important – many MTK devices need this to avoid crashes
TARGET_RECOVERY_FORCE_FLASH_REPACK := true

# We usually don't want full AOSP packages in recovery
PRODUCT_PACKAGES -= \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.supplicant@1.0-impl \
    wificond

# Optional: if you want ADB root by default in TWRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.adb.root=1 \
    ro.secure=0 \
    ro.adb.secure=0 \
    service.adb.root=1