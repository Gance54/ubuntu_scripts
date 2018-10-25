#!/bin/bash

source ~/scripts/config.sh $*

cd $AOSPDIR
source build/envsetup.sh && lunch $(value $TARGET[lunch]) || error "Something went wrong. check AOSPDIR"
make -j4 || error "Android build failed"
prnt_green "Congratulations! Your Androud build was successful for target $(value $TARGET[target]) in $AOSPDIR!"
