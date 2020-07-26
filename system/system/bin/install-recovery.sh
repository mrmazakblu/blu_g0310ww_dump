#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:c44f45a6841a68658483b745e750446a91d2ccf6; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:eabf6821f8d5dbb979459c64d4b3bf7d039ed012 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:c44f45a6841a68658483b745e750446a91d2ccf6 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
