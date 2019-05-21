#!/bin/bash
source ~/scripts/config.sh $1

test -z "$OUT_DIR_COMMON_BASE" && local_out=$AOSPDIR/out || local_out=$OUT_DIR_COMMON_BASE/android

echo "Cpying from --->>> $local_out/target/product/$(value $TARGET[target])..."
#cp $local_out/target/product/$(value $TARGET[target])/recovery.img $FLASHING_BINARIES

cp $local_out/target/product/$(value $TARGET[target])/boot_fit.img $FLASHING_BINARIES
cp $local_out/target/product/$(value $TARGET[target])/system.img $FLASHING_BINARIES
cp $local_out/target/product/$(value $TARGET[target])/userdata.img $FLASHING_BINARIES
cp $local_out/target/product/$(value $TARGET[target])/vendor.img $FLASHING_BINARIES
#cp $local_out/target/product/$(value $TARGET[target])/cache.img $FLASHING_BINARIES
