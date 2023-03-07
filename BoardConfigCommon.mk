#
# Copyright (C) 2020-2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMON_PATH := device/samsung/a50-common

## Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

## Inherit proprietary vendor configuartion
include vendor/samsung/a50-common/BoardConfigVendor.mk

## Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

## Architecture (Secondary)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

## Bluetooth
BOARD_HAVE_BLUETOOTH_SLSI := true

## Board
TARGET_BOARD_INFO_FILE := $(COMMON_PATH)/board-info.txt

## Boot Image
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_CUSTOM_BOOTIMG := true
BOARD_DTB_OFFSET := 0x00000000
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_SECOND_OFFSET := 0xf0000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += loop.max_part=7

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)

# Broken Build Rules
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_DUP_RULES := true

## Display
TARGET_SCREEN_DENSITY := 420
TARGET_USES_VULKAN := true

## DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_DTBO_CFG := $(COMMON_PATH)/configs/kernel/$(TARGET_DEVICE).cfg

## Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := system/product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true

# FOD
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(COMMON_PATH):libudfps_extension.a50

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x400000000LL

## Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/samsung/a50-common
TARGET_KERNEL_CONFIG := a50_defconfig

## Keymaster
TARGET_KEYMASTER_VARIANT := samsung

## Manifest
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml
ODM_MANIFEST_SKUS := hce hceese hcesim hcesimese disabled
ODM_MANIFEST_NFC_FILE := $(COMMON_PATH)/configs/nfc/odm_nfc_manifest.xml
ODM_MANIFEST_HCE_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_HCEESE_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_HCESIM_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_HCESIMESE_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_DISABLED_FILES := $(COMMON_PATH)/configs/nfc/odm_nfc_manifest_disabled.xml

## Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 57671680
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_DTBIMG_PARTITION_SIZE := 8388608
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67633152
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5557452800
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800

BOARD_ROOT_EXTRA_FOLDERS := efs

## Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := universal9610
TARGET_BOOTLOADER_BOARD_NAME := exynos9610
TARGET_SOC := exynos9610

## Properties
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

## Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/configs/init/fstab.exynos9610
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"

## Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_exynos9611
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

## RIL
ENABLE_VENDOR_RIL_SERVICE := true

## Security
VENDOR_SECURITY_PATCH := 2022-10-01

## SELinux
BOARD_SEPOLICY_TEE_FLAVOR := teegris
include device/custom/sepolicy/exynos/sepolicy.mk
include device/samsung_slsi/sepolicy/sepolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private

## Wi-Fi
BOARD_WLAN_DEVICE                := slsi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_slsi
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_slsi
#WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X

PRODUCT_CFI_INCLUDE_PATHS += hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib
