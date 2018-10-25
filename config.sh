#!/bin/bash

source ~/scripts/build.conf
source ~/scripts/prnt.sh

function check_target () {
if [[ " ${TARGET_LIST[@]} " =~ " $1 " ]]; then
    return 0
fi

return -1
}

function prnt_help () {
echo "=============================================================="
echo "    To set target for android use ./build_android.sh <target>"
echo "    To set target for kernel use ./build_kernel.sh <target>"
echo "    To set target for only export use ./config.sh <target>"
echo "    Applicable targets: ${TARGET_LIST[*]}"
echo " "
}

TARGET=$1

if [ $# -ne 1 ]; then
    prnt_help
    error "Parameters are invalid." 
fi

if [ $(check_target $TARGET) ]; then 
    prnt_help
    error "Target $TARGET is not valid."
fi

#gets value of associative array
value() {
    echo ${!1}
}

AOSPDIR=${ANDROID_PATH}/$(value $TARGET[android_path])
UBOOTDIR=${UBOOT_PATH}/$(value $TARGET[uboot_path])
export KERNELDIR=${KERNEL_PATH}/$(value $TARGET[kernel_path])
export PATH=$(value $TARGET[toolchain]):$PATH
export CROSS_COMPILE=$(value $TARGET[cross_compile])
export ARCH=$(value $TARGET[arch])
