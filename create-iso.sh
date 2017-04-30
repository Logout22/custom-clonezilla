#!/bin/bash
set -o errexit
set -o nounset

cd "$(dirname "$0")"
unzip clonezilla-live-2.5.0-25-i686.zip -d clonezilla-iso
cp syslinux/isolinux.cfg clonezilla-iso/syslinux/isolinux.cfg
cd clonezilla-iso
mkisofs -A 'Clonezilla live CD' -f -r -hide-joliet-trans-tbl -J -l -b syslinux/isolinux.bin -c syslinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../clonezilla.iso ./
