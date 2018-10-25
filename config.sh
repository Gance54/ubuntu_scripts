#!/bin/bash

source ~/scripts/build.conf

#default target
TARGET=am57xevm

#Setup section starts
#------------------------------------------------------------------

#Android setup
REPO_PATH=/mnt/hdd/repo
ANDROIDDIR=${REPO_PATH}/android
AOSP_ROOT_PATH=${ANDROIDDIR}/o-mr1-core-dev

#Directory for images
FLASHING_BINARIES=${REPO_PATH}/flashing_binaries

#kernel and u-boot setup
KERNELDIR=${REPO_PATH}/kernel/kernel_32
UBOOTDIR=${REPO_PATH}/u-boot/u-boot_${TARGET}

export PATH=/opt/gcc-linaro-7.2.1-2017.11-x86_64_arm-eabi/bin:$PATH
export CROSS_COMPILE=arm-eabi-
export ARCH=arm

#------------------------------------------------------------------
#Setup section ends

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

function prnt_yellow () {
echo "${yellow}${1}${reset}"
}

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

if [ -z $1 ]
    then
        prnt_yellow "Target was not set. Using default target=${TARGET}"
	prnt_help
fi



#export AOSP_ROOT_PATH=${ANDROIDDIR}/o-ti-master-beagle
#export TARGET=beagle_x15

