#!/bin/bash

#
# SOURCE
# https://youtu.be/yRSElRlp7TQ?si=_N5gjys1tYrpsO7B
# https://mutschler.dev/linux/ubuntu-btrfs-20-04/
#

# Step 1: Boot the install, check UEFI mode and open an interactive root shell
mount | grep efivars

sudo -i

# Step 2: Prepare partitions manually
# Create partition table and layout
lsblk
parted /dev/vda
 mklabel gpt
 mkpart primary 1MiB 513MiB
 mkpart primary 513MiB 4609MiB
 mkpart primary 4609MiB 100%
 print

 # Create luks1 partition
 cryptsetup luksFormat --type=luks1 /dev/vda3
 cryptsetup luksOpen /dev/vda3 cryptdata

 ls /dev/mapper/
 # control  cryptdata

 # Create filesystems for root and EFI System partitions
 mkfs.fat -F32 /dev/vda1

 