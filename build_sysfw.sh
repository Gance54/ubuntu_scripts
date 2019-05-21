#!/bin/bash

source ~/scripts/config.sh $*
export ARCH=arm
export CROSS_COMPILE="ccache arm-eabi-"

cd $SYSFWDIR
make || error "Build sysfw failed. $SYSFWDIR"

test -f sysfw.itb || error "There is not sysfw.itb file! Error happened"

cp sysfw.itb $FLASHING_BINARIES

prnt_green "Congratulations! Your sysfw build was successful!"
