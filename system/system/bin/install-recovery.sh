#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:26822672:339c6f8fcef0ab97a801410af4bc14e217212139; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:20586512:3bd10eac03f76e85e77f41da7e5ae4b03d4edbf6 \
          --target EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:26822672:339c6f8fcef0ab97a801410af4bc14e217212139 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
