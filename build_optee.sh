#!/bin/bash

source /mnt/ssd/repo/scripts/config.sh $*
unset ARCH

cd $OPTEEDIR

make CFG_CORE_MBEDTLS_MPI=n || error "Build OPTEE failed"
prnt_green "Congratulations! Your OPTEE build was successful!"
