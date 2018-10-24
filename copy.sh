 #!/bin/bash 
source ~/scripts/config.sh

test -d "$AOSP_ROOT_PATH" || error "Set AOSP_ROOT_PATH"
test -d "$FLASHING_BINARIES" || error "Set flashing binaries path"
test -z "$OUT_DIR_COMMON_BASE" && local_out=$AOSP_ROOT_PATH/out || local_out=$OUT_DIR_COMMON_BASE/android

echo "Cpying from --->>> $local_out/target/product/$TARGET..."
cp $local_out/target/product/$TARGET/boot_fit.img $FLASHING_BINARIES
#cp $local_out/target/product/$TARGET/cache.img $FLASHING_BINARIES
cp $local_out/target/product/$TARGET/recovery.img $FLASHING_BINARIES
cp $local_out/target/product/$TARGET/system.img $FLASHING_BINARIES
cp $local_out/target/product/$TARGET/userdata.img $FLASHING_BINARIES
cp $local_out/target/product/$TARGET/vendor.img $FLASHING_BINARIES
