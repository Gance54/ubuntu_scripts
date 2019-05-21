#!/bin/bash

source ~/scripts/config.sh $*
unset ARCH

cd $OPTEEDIR

make || error "Build OPTEE failed"
prnt_green "Congratulations! Your OPTEE build was successful!"
