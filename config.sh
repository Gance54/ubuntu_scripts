 #!/bin/bash 
export KERNELDIR=~/dev/linux
export OUT_DIR_COMMON_BASE=~/dev/android_out
export AOSP_ROOT_PATH=~/dev/android
export PATH=/opt/gcc-linaro-7.2.1-2017.11-x86_64_arm-eabi/bin:$PATH
export CROSS_COMPILE=arm-eabi-
export ARCH=arm
export FLASHING_BINARIES=~/dev/flashing_binaries

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function prnt_red () {
echo "${red}${1}${reset}"
}

function prnt_green () {
echo "${green}${1}${reset}"
}

function error () {
prnt_red "$1"
exit 1
}


