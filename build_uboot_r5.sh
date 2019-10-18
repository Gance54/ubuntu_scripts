#!/bin/bash

source /mnt/ssd/repo/scripts/config.sh $*
export ARCH=arm
export CROSS_COMPILE=$CROSS_COMPILE32

cd $UBOOTDIR

make O=$(value $TARGET[uboot_out_dir_r5]) distclean
make O=$(value $TARGET[uboot_out_dir_r5]) $(value $TARGET[ubootconfig_r5])
make O=$(value $TARGET[uboot_out_dir_r5]) -j4 || error "Build u-boot_r5 failed"

test -f $(value $TARGET[uboot_out_dir_r5])/tiboot3.bin || error "Can not find $(value $TARGET[uboot_out_dir_r5])/tiboot3.bin!"

cp $(value $TARGET[uboot_out_dir_r5])/tiboot3.bin $FLASHING_BINARIES

prnt_green "Congratulations! Your u-boot_r5 build was successful!"
