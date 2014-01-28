#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_USES_GENERIC_AUDIO := false
USE_CAMERA_STUB := false
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
TARGET_OTA_ASSERT_DEVICE := me301t,tf300t

# Camera options
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# inherit from the proprietary version
-include vendor/asus/me301t/BoardConfigVendor.mk

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := cardhu
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := tegra

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

NEED_WORKAROUND_CORTEX_A9_745320 := true

# Boot/Recovery image settings  
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE :=

# Video settings
BOARD_EGL_CFG := device/asus/me301t/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/asus/me301t/bluetooth/vnd_me301t.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/asus/me301t/bluetooth

# Support for dock battery
TARGET_HAS_DOCK_BATTERY := false

# Misc flags
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd_34/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/bcm4334/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/bcm4334/fw_bcmdhd_apsta.bin"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29850022707
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/asus/me301t
TARGET_KERNEL_CONFIG := me301t_cm10_defconfig

# Prebuilt Kernel Fallback
#TARGET_PREBUILT_KERNEL := device/asus/me301t/kernel

# Custom Tools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/asus/me301t/releasetools/me301t_ota_from_target_files

# SELinux policies
BOARD_SEPOLICY_DIRS := \
    device/asus/me301t/sepolicy

BOARD_SEPOLICY_UNION := \
    file_contexts \
    genfs_contexts \
    app.te \
    btmacreader.te \
    device.te \
    drmserver.te \
    init_shell.te \
    file.te \
    rild.te \
    sensors_config.te \
    shell.te \
    surfaceflinger.te \
    system.te \
    zygote.te

# CMHW
BOARD_HARDWARE_CLASS := device/asus/me301t/cmhw/

# Recovery Options
BOARD_CUSTOM_BOOTIMG_MK := device/asus/me301t/recovery/recovery.mk
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_INITRC := device/asus/me301t/recovery/init.rc
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_RECOVERY_FSTAB := device/asus/me301t/ramdisk/fstab.cardhu


#TWRP
DEVICE_RESOLUTION := 1280x800
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TW_INCLUDE_JB_CRYPTO := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"

TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p8"
TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "journal_async_commit,data=writeback,nodelalloc"
TW_CRYPTO_FS_OPTIONS := "data=ordered,delalloc"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TWRP_CUSTOM_KEYBOARD := ../../../device/asus/tf300t/recovery/hardwarekeyboard.cpp
