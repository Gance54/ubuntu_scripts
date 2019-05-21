#!/bin/bash

source ~/scripts/config.sh $*

cd $ATFDIR

make $(value $TARGET[atf_make]) || error "Build ATF failed. $ATFDIR, ${ATF_PATH}/$(value $TARGET[atf_path]), "

prnt_green "Congratulations! Your ATF build was successful!"
