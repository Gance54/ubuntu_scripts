#!/bin/sh

source ~/scripts/config.sh $1
cd $UBOOTDIR
make am57xx_evm_defconfig
make -j4 || error "Build failed"
prnt_green "Congratulations! Your u-boot build was successful!"
