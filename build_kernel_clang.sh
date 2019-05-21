#!/bin/bash

source ~/scripts/config.sh $*

cd $KERNELDIR 
./ti_config_fragments/defconfig_builder.sh -t $(value $TARGET[kernelconf])
make $(value $TARGET[kernelconf])_defconfig || error "Make defconfig failed"

export PATH=/opt/aarch64-gcc-4.9/bin:$PATH
export PATH=/opt/clang-linux-x86/clang-r349610/bin:$PATH
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-android-
export ARCH=arm64

make -j4 CC=clang HOSTCC=clang $(value $TARGET[modules])
