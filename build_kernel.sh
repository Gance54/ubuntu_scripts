#!/bin/bash

source ~/scripts/config.sh $*

cd $KERNELDIR
./ti_config_fragments/defconfig_builder.sh -t $(value $TARGET[kernelconf]) 
make $(value $TARGET[kernelconf])_defconfig || error "Make defconfig failed"
make -j4 $(value $TARGET[modules]) || error "Build failed"

prnt_green "Congratulations! Your Kernel build was successful!"
