#!/bin/bash
source ~/scripts/config.sh
test -d "$FLASHING_BINARIES" || error "Set flashing binaries path"

set -e
        
#fastboot erase environment
#fastboot flash xloader $FLASHING_BINARIES/MLO
#fastboot flash bootloader $FLASHING_BINARIES/u-boot.img
#fastboot flash cache $FLASHING_BINARIES/cache.img
#fastboot flash boot $FLASHING_BINARIES/boot_fit.img
#fastboot flash recovery $FLASHING_BINARIES/recovery.img
fastboot flash system $FLASHING_BINARIES/system.img
#fastboot flash userdata $FLASHING_BINARIES/userdata.img
fastboot flash vendor $FLASHING_BINARIES/vendor.img
