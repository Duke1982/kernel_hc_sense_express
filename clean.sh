#!/bin/bash

rm output/tools/boot.img-kernel
rm output/tools/out/ramdisk-new.gz
rm output/files/system/lib/modules/qce.ko
rm output/files/system/lib/modules/sequans_sdio.ko
rm output/files/system/lib/modules/qcrypto.ko
rm output/files/system/lib/modules/qcedev.ko
rm output/files/system/lib/modules/wimaxdbg.ko
rm output/files/system/lib/modules/bcm4329.ko
rm output/files/system/lib/modules/scsi_wait_scan.ko
rm output/files/system/lib/modules/wimaxuart.ko
rm output/files/boot.img
rm output/tools/boot_new.img
cd output
rm *.zip
cd ..
make clean mrproper
