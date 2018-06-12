 #!/bin/bash 

source ~/scripts/config.sh
test -z "$AOSP_ROOT_PATH" && error "AOSP_ROOT_PATH was not set"
cd $AOSP_ROOT_PATH
source build/envsetup.sh && lunch am57xevm_full-userdebug || error "Something went wrong. check AOSP_ROOT_PATH"
make -j16 || error "Android build failed"
prnt_green "Congratulations! Your Androud build was successful!"
exit 0
