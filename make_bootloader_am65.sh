#!/bin/bash

set -e

~/scripts/build_atf.sh $* 
~/scripts/build_sysfw.sh $*
~/scripts/build_optee.sh $*
~/scripts/build_uboot_r5.sh $*
~/scripts/build_uboot_a53.sh $*

source ~/scripts/config.sh $*
cd $FLASHING_BINARIES

dd if=/dev/zero of=bootloader.img bs=1M count=8
/sbin/mkfs.vfat bootloader.img
mcopy -i bootloader.img tispl.bin ::tispl.bin
mcopy -i bootloader.img u-boot.img ::u-boot.img
mcopy -i bootloader.img sysfw.itb ::sysfw.itb
