#!/bin/bash

source /mnt/ssd/repo/scripts/config.sh $*

cd $KERNELDIR 
./ti_config_fragments/defconfig_builder.sh -t $(value $TARGET[kernelconf])
make $(value $TARGET[kernelconf])_defconfig || error "Make defconfig failed"
make $(value $TARGET[modules]) || error "Build failed"

prnt_green "Congratulations! Your Kernel build was successful!"
