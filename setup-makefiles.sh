#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
#

set -e

INITIAL_COPYRIGHT_YEAR=2014

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

DEVICE_VENDOR=$VENDOR
VENDOR_COMMON=oppo

# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON" "$VENDOR_COMMON" "$LINEAGE_ROOT" true

# Copyright headers and common guards
write_headers "bacon find7 n3"

write_makefiles "$MY_DIR"/proprietary-files.txt

# Blobs for TWRP data decryption
cat << EOF >> "$BOARDMK"
ifeq (\$(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += vendor/$VENDOR_COMMON/$DEVICE_COMMON/proprietary
endif
EOF

write_footers

# Reinitialize the helper for device
setup_vendor "$DEVICE" "$DEVICE_VENDOR" "$LINEAGE_ROOT"

# Copyright headers and guards
write_headers

write_makefiles "$MY_DIR"/device-proprietary-files.txt
write_makefiles "$MY_DIR"/../../$DEVICE_VENDOR/$DEVICE/device-proprietary-files.txt

# Finish
write_footers
