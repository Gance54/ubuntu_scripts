#!/bin/bash 

source ~/scripts/config.sh

test -d "$KERNELDIR" || error "Please set KERNELDIR"
test -z "$CROSS_COMPILE" && error "Please check CROSS_COMPILE"
test -z "$ARCH" && error "Please check ARCH"

cd $KERNELDIR
./ti_config_fragments/defconfig_builder.sh -t ti_sdk_am57x_android_release 
make ti_sdk_am57x_android_release_defconfig || error "Make defconfig failed"
make -j4 zImage dtbs modules || error "Build failed"

prnt_green "Congratulations! Your Kernel build was successful!"
exit 0

