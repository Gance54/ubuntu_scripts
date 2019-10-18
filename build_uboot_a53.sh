#!/bin/bash

source /mnt/ssd/repo/scripts/config.sh $*
export ARCH=arm
export ATF=$ATFDIR/build/k3/generic/release/bl31.bin
export TEE=$OPTEEDIR/out/arm-plat-k3/core/tee-pager.bin

test -f $ATF || error "File $ATF does not exist. Please, build ATF before building u-boot!"
test -f $TEE || error "File $TEE does not exist. Please, build OP-TEE before building u-boot!"

cd $UBOOTDIR

make O=$(value $TARGET[uboot_out_dir_a53]) distclean
make O=$(value $TARGET[uboot_out_dir_a53]) $(value $TARGET[ubootconfig_a53])
make O=$(value $TARGET[uboot_out_dir_a53])  || error "Build boot_a53 failed"

test -f $(value $TARGET[uboot_out_dir_a53])/tispl.bin || error "Can not find $(value $TARGET[uboot_out_dir_a53])/tispl.bin!"
test -f $(value $TARGET[uboot_out_dir_a53])/u-boot.img || error "Can not find $(value $TARGET[uboot_out_dir_a53])/u-boot.img!"

cp $(value $TARGET[uboot_out_dir_a53])/tispl.bin $FLASHING_BINARIES
cp $(value $TARGET[uboot_out_dir_a53])/u-boot.img $FLASHING_BINARIES

prnt_green "Congratulations! Your u-boot_a53 build was successful!"
