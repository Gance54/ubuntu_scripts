# !/bin/bash
#export KERNELDIR=/mnt/hdd/repo/kernel/kernel_64
#export ANDROID_ROOT=/mnt/hdd/repo/android/o-mr1-release
#export OUT_DIR=/mnt/hdd/repo/android/o-mr1-release/out
#export CROSS_COMPILE_SECONDARY=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
#export CROSS_COMPILE=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#export KERNEL_CROSS_COMPILE=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#export EXCLUDED_APIS="composerhal,camerahal,unittests,sensorhal"
#export ARCH=arm64
#export TARGET_DEVICE=am65xevm
#export JAVA_HOME=${ANDROID_ROOT}/prebuilts/jdk/jdk8/linux-x86
#export PATH=${ANDROID_ROOT}/prebuilts/jdk/jdk8/linux-x86/bin:$PATH
#export DDK_ROOT=/mnt/hdd/repo/TI_ss/SGX
#export USER_DIR=${DDK_ROOT}/eurasia/eurasiacon/build/linux2/omap_android
#export KERNEL_DIR=${DDK_ROOT}/eurasia_km/eurasiacon/build/linux2/omap_android
#cd ${USER_DIR}
#make clean
#make -j10
#cd ${DDK_ROOT}

#cp /mnt/hdd/repo/android/o-mr1-core-dev-64/vendor/ti/dra7xx/sgx_km/eurasia_km/eurasiacon/binary2_omap_android_release/target_armv7-a/kbuild/pvrsrvkm.ko /mnt/hdd/repo/android/q-master/device/ti/beagle_x15-kernel/pvrsrvkm.ko
#adb root
#adb shell mount -o rw,remount /vendor
#adb shell rmmod pvrsrvkm 
#adb push /mnt/hdd/repo/android/o-mr1-core-dev-64/vendor/ti/dra7xx/sgx_km/eurasia_km/eurasiacon/binary2_omap_android_release/target_armv7-a/kbuild/pvrsrvkm.ko /vendor/lib/modules/pvrsrvkm.ko 
#adb shell insmod /vendor/lib/modules/pvrsrvkm.ko

#-----------clang 32 bit-------------- start
export KERNELDIR=/mnt/ssd/repo/kernel/omap
export ANDROID_ROOT=/mnt/ssd/repo/android/q-master
export OUT_DIR=${ANDROID_ROOT}/out
export PATH=${ANDROID_ROOT}/prebuilts/clang/host/linux-x86/clang-r353983c/bin:$PATH
export PATH=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH
export CROSS_COMPILE=arm-linux-androideabi-
export KERNEL_CROSS_COMPILE=arm-linux-androideabi-
export EXCLUDED_APIS="composerhal,camerahal,unittests,sensorhal"
export ARCH=arm
export TARGET_DEVICE=beagle_x15
export PATH=${ANDROID_ROOT}/prebuilts/jdk/jdk8/linux-x86/bin:$PATH
export DDK_ROOT=/mnt/ssd/repo/TI_ss/SGX
export USER_DIR=${DDK_ROOT}/eurasia/eurasiacon/build/linux2/omap_android
export KERNEL_DIR=${DDK_ROOT}/eurasia_km/eurasiacon/build/linux2/omap_android

export USE_CLANG=1

cd ${USER_DIR}
make CC=clang LD=clang++ clean
rm -rf eurasiacon/binary2_omap_android_release/ ../eurasia_km/eurasiacon/binary2_omap_android_release/
make CC=clang LD=clang++ -j4
cd ${DDK_ROOT}

#-----------clang 32 bit-------------- stop

#export KERNELDIR=/mnt/ssd/repo/kernel/kernel_64
#export ANDROID_ROOT=/mnt/ssd/repo/android/p-ti-release
#export OUT_DIR=/mnt/ssd/repo/android/p-ti-release/out
#export CROSS_COMPILE=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#export CROSS_COMPILE_SECONDARY=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
#export KERNEL_CROSS_COMPILE=${ANDROID_ROOT}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#export EXCLUDED_APIS="composerhal,camerahal,unittests,sensorhal"
#export TARGET_DEVICE=am65xevm
#export ARCH=arm64
#export DISCIMAGE=/srv/rfs/am65xx
#export SYSROOT=${DISCIMAGE}
#export JAVA_HOME=${ANDROID_ROOT}/prebuilts/jdk/jdk8/linux-x86
#export PATH=${ANDROID_ROOT}/prebuilts/jdk/jdk8/linux-x86/bin:$PATH
#export DDK_ROOT=/mnt/ssd/repo/TI_ss/SGX
#export USER_DIR=${DDK_ROOT}/eurasia/eurasiacon/build/linux2/omap_android
#export KERNEL_DIR=${DDK_ROOT}/eurasia_km/eurasiacon/build/linux2/omap_android
#cd ${USER_DIR}
#make clean
#make -j10
#cd ${KERNEL_DIR}
#make clean
#make -j10
