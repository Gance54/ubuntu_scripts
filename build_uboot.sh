#!/bin/bash

source ~/scripts/config.sh $*
cd $UBOOTDIR
make $(value $TARGET[ubootconfig])
make -j4 || error "Build failed"
prnt_green "Congratulations! Your u-boot build was successful!"
