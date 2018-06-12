 #!/bin/bash 
source ~/scripts/config.sh

test -d "$AOSP_ROOT_PATH" || error "Set AOSP_ROOT_PATH"
test -d "$FLASHING_BINARIES" || error "Set flashing binaries path"
test -z "$OUT_DIR_COMMON_BASE" && local_out=$AOSP_ROOT_PATH/out || local_out=$OUT_DIR_COMMON_BASE/android

cp $local_out/target/product/am57xevm/boot_fit.img $FLASHING_BINARIES
cp $local_out/target/product/am57xevm/cache.img $FLASHING_BINARIES
cp $local_out/target/product/am57xevm/recovery.img $FLASHING_BINARIES
cp $local_out/target/product/am57xevm/system.img $FLASHING_BINARIES
cp $local_out/target/product/am57xevm/userdata.img $FLASHING_BINARIES
cp $local_out/target/product/am57xevm/vendor.img $FLASHING_BINARIES
