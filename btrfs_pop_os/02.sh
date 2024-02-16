#!/bin/bash

#
# SOURCE
# https://youtu.be/yRSElRlp7TQ?si=_N5gjys1tYrpsO7B
# https://mutschler.dev/linux/ubuntu-btrfs-20-04/
#

# Step 1: Boot the install, check UEFI mode and open an interactive root shell
mount | grep efivars


# ========= SOBRE PARTICIONAMENTO PELO TERMINAL
# Step 2: Prepare partitions manually
# Create partition table and layout
lsblk
parted /dev/vda
mklabel gpt
mkpart primary 1MiB 600MiB
mkpart primary 600MiB 2048MiB
mkpart primary 2048MiB 100%
print


# ========= (OPCIONAL)SOBRE CRIPTOGRAFIA
# Create luks1 partition
cryptsetup luksFormat --type=luks1 /dev/vda3
cryptsetup luksOpen /dev/vda3 cryptdata
ls /dev/mapper/
# control  cryptdata


# ========= FORMATANDO PARTIÇÃO EFI
# Create filesystems for root and EFI System partitions
mkfs.fat -F32 /dev/vda1


# ========= Opções extras no @ e @home
nano /usr/lib/partman/mount.d/70btrfs
# line 24: options="${options:+$options,}subvol=@,ssd,noatime,space_cache,commit=120,compress=zstd"
# line 31: options="${options:+$options,}subvol=@home,ssd,noatime,space_cache,commit=120,compress=zstd"

nano /usr/lib/partman/fstab.d/btrfs
# line 30: pass=0
# line 31: home_options="${options:+$options,}subvol=@home,ssd,noatime,space_cache,commit=120,compress=zstd"
# line 32: options="${options:+$options,}subvol=@,ssd,noatime,space_cache,commit=120,compress=zstd"
# line 36: pass=0
# line 37: options="${options:+$options,}subvol=@home,ssd,noatime,space_cache,commit=120,compress=zstd"
# line 40: pass=0
# line 56: echo "$home_path" "$home_mp" btrfs "$home_options" 0 0


# ========= Instalar Ubuntu usando Ubiquity
ubiquity --no-bootloader


# ========= Post-Installation steps
# Create a chroot environment and enter your system
mount -o subvol=@,ssd,noatime,space_cache,commit=120,compress=zstd /dev/mapper/cryptdata /mnt
for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mnt$i; done
sudo cp /etc/resolv.conf /mnt/etc/
sudo chroot /mnt


