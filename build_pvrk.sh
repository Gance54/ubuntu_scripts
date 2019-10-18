set -e

export ARCH=arm
export KERNELDIR=/mnt/ssd/repo/kernel/omap
sgx_dir=${KERNELDIR}/modules/eurasia_km/eurasiacon/build/linux2/omap_android
export BUILD_PROP=${KERNELDIR}/modules/eurasia_km/build.prop
export CROSS_COMPILE=arm-eabi-
export KERNEL_CROSS_COMPILE=arm-eabi-
export TARGET_DEVICE=am57xevm
export PATH=/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin:$PATH

cd $sgx_dir
make clean
make -j4
