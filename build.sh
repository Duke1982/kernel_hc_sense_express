#!/bin/bash

echo "****Start building****"
echo "****Cleaning****"

sh clean.sh

START=$(date +%s)
echo "****Building****"

export USE_CCACHE = 1
make express_defconfig
make -j16

echo "****Creating boot image****"
cp arch/arm/boot/zImage output/tools/boot.img-kernel
cp drivers/net/wimax/SQN/sequans_sdio.ko output/files/system/lib/modules/sequans_sdio.ko
cp drivers/net/wimax/wimaxdbg/wimaxdbg.ko output/files/system/lib/modules/wimaxdbg.ko
cp drivers/net/wireless/bcm4329_204/bcm4329.ko output/files/system/lib/modules/bcm4329.ko
cp drivers/scsi/scsi_wait_scan.ko output/files/system/lib/modules/scsi_wait_scan.ko
cp drivers/net/wimax/wimaxuart/wimaxuart.ko output/files/system/lib/modules/wimaxuart.ko
cd output/tools
./packboot
cd ..
cd ..
cp output/tools/boot_new.img output/files/boot.img
cd output/files
zip -q -r Jmz-Kernel-EXPRESS-$(date +%m%d%y).zip .
cd ..
cd ..
mv output/files/Jmz-Kernel-EXPRESS-$(date +%m%d%y).zip output/Jmz-Kernel-EXPRESS-$(date +%m%d%y).zip

echo "****Compile done****"
echo "****Kernel and modules are in output/****"
END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "Elapsed: "
[ $E_MIN != 0 ] && printf "%d min(s) " $E_MIN
printf "%d sec(s)\n" $E_SEC
read -n 1 -p "Press any key to continue"
