#!/bin/bash
source /mnt/ssd/repo/scripts/config.sh

UBOOT=${UBOOTDIR}
MYDROID=${AOSPDIR}
KERNEL=${KERNELDIR}
OUT=${FLASHING_BINARIES}/hs
SIGNEDOUT=${OUT}/signed
MKIMAGE=${UBOOT}/tools/mkimage
OPTEE=${MYDROID}/optee_os

cp ${UBOOT}/u-boot-spl_HS_X-LOADER ${OUT}
cp ${UBOOT}/u-boot_HS.img ${OUT}
cp ${MYDROID}/out/target/product/$(value $TARGET[target])/ramdisk.img ${OUT}
cp ${KERNEL}/arch/arm/boot/zImage ${OUT}
cp ${KERNEL}/arch/arm/boot/dts/ti/am57xx-beagle-x15-revc.dtb ${OUT}
cp ${KERNEL}/arch/arm/boot/dts/ti/am57xx-evm-common.dtbo ${OUT}
cp ${KERNEL}/arch/arm/boot/dts/ti/am57xx-evm-reva3.dtbo ${OUT}
cp ${MYDROID}/out/target/product/$(value $TARGET[target])/optee/arm-plat-ti-am57xx/core/tee.bin ${OUT}

cd ${OUT}

${TI_SECURE_DEV_PKG}/scripts/ift-image-sign.sh dra7xx zImage signed/zImage
${TI_SECURE_DEV_PKG}/scripts/ift-image-sign.sh dra7xx ramdisk.img signed/ramdisk.img
${TI_SECURE_DEV_PKG}/scripts/ift-image-sign.sh dra7xx tee.bin signed/tee.bin
${TI_SECURE_DEV_PKG}/scripts/ift-image-sign.sh dra7xx am57xx-beagle-x15-revc.dtb signed/am57xx-beagle-x15-revc.dtb
${TI_SECURE_DEV_PKG}/scripts/ift-image-sign.sh dra7xx am57xx-evm-common.dtbo signed/am57xx-evm-common.dtbo
${TI_SECURE_DEV_PKG}/scripts/ift-image-sign.sh dra7xx am57xx-evm-reva3.dtbo signed/am57xx-evm-reva3.dtbo

cd ${SIGNEDOUT}

$MKIMAGE -f beagle_x15.its boot.itb
cp boot.itb ${FLASHING_BINARIES}/boot_fit.img
