#!/bin/bash

source ~/scripts/config.sh $*

ZIMAGE=$KERNELDIR/arch/arm/boot/zImage
DTB=$KERNELDIR/arch/arm/boot/dts/ti/am57xx-beagle-x15-revc.dtb am57xx-evm-common.dtbo am57xx-evm-reva3.dtbo

if [ $(value $TARGET[prebuilt_kernel]) == true ]; then
    [[ -f $ZIMAGE ]] || error "No zImage found -> $ZIMAGE"
#    [[ -f $DTB ]] || error "No dtb found -> $DTB"
    echo ""
    read -r -p "You are going to pull kernel images from $KERNELDIR to replace prebuilt. Are you sure [y/N] " response
    response=${response,,}    # tolower
    if [[ "$response" =~ ^(yes|y)$ ]]; then
        cp $ZIMAGE $AOSPDIR/$(value $TARGET[aosp_kernel_path])
        cp $DTB $AOSPDIR/$(value $TARGET[aosp_kernel_path])
        echo "Copied..."
    else
        echo "Already existing kernel images from $(value $TARGET[aosp_kernel_path]) will be used\n"
    fi
fi

cd $AOSPDIR

source build/envsetup.sh && lunch $(value $TARGET[lunch]) || error "Something went wrong. check AOSPDIR"
make -j4 || error "Android build failed"
#make bootfitimage || error "Boot_fit build failed"
prnt_green "Congratulations! Your Androud build was successful for target $(value $TARGET[target]) in $AOSPDIR!"
