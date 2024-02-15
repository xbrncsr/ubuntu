#!/bin/bash

# SOURCE:
# https://youtu.be/i8HDHAX1RJc?si=WKPikVPrPRlhr2-n
# https://mutschler.dev/linux/pop-os-btrfs-22-04/

#
# Instalar Pop OS normalmente para obter o layout das partições de disco.
# Ou se preferir use o gparted para modificar as partições a seu gosto.

# Para examinar o layout das partições logo após a instalação basta abrir o gparted.

# ==== VERIFICANDO STATUS DA PRIMEIRA INSTALAÇÃO ====
# Para verificar a partição criptografada
sudo cryptsetup luksDump /dev/sda3
sudo cryptsetup luksOpen /dev/sda3 cryptdata
ls /dev/mapper
sudo pvs

# Fechando tudo
sudo cryptsetup luksClose /dev/mapper/data-root
sudo cryptsetup luksClose /dev/mapper/cryptdata
ls /dev/mapper

# ===================== NÃO REINICIE O LIVE CD

# ===================== O vídeo mesmo começa 10:40min

# (OPCIONAL)caso tenha criptografado o disco
cryptsetup luksOpen /dev/sda3 cryptdata

# ===================== 01
# Verificar status
ls /dev/mapper
# Monte o sistema de arquivos raiz de nível superior btrfs com compactação zstd
mount -o subvolid=5,defaults,compress=zstd:1,discard=async /dev/mapper/data-root /mnt

# ===================== 02
# verificar status
btrfs subvolume list /mnt
# Criando btrfs subvolumes @ and @home
btrfs subvolume create /mnt/@
cd /mnt
ls | grep -v @ | xargs mv -t @
ls -a /mnt

btrfs subvolume create /mnt/@home
mv /mnt/@/home/* /mnt/@home/
ls -a /mnt/@/home
ls -a /mnt/@home

btrfs subvolume list /mnt

# ===================== 03
# Changes to fstab
sed -i 's/btrfs  defaults/btrfs  defaults,subvol=@,compress=zstd:1,discard=async/' /mnt/@/etc/fstab
echo "UUID=$(blkid -s UUID -o value /dev/mapper/data-root)  /home  btrfs  defaults,subvol=@home,compress=zstd:1,discard=async   0 0" >> /mnt/@/etc/fstab

# (OPCIONAL) Changes to crypttab
sed -i 's/luks/luks,discard/' /mnt/@/etc/crypttab
cat /mnt/@/etc/crypttab
# cryptdata UUID=52d31097-e125-46f0-a139-85087e1b5565 none luks,discard
# cryptswap UUID=8cd56bf1-1a43-49c3-98b0-835b658b54fc /dev/urandom swap,plain,offset=1024,cipher=aes-xts-plain64,size=512

# ===================== 04
# Adjust configuration of kernelstub
nano /mnt/@/etc/kernelstub/configuration
# logo abaixo de: "splash", <== não esqueça da virgula após "splash"
# acrescente: "rootflags=subvol=@"

# ===================== 05
# Adjust configuration of systemd bootloader
# Troque: sda1
mount /dev/sda1 /mnt/@/boot/efi
sed -i 's/splash/splash rootflags=subvol=@/' /mnt/@/boot/efi/loader/entries/Pop_OS-current.conf
cat /mnt/@/boot/efi/loader/entries/Pop_OS-current.conf

# ===================== 06
# Create a chroot environment and update initramfs
cd /
umount -l /mnt
mount -o subvol=@,defaults,compress=zstd:1,discard=async /dev/mapper/data-root /mnt
ls /mnt

# Then the following commands will put us into our system using chroot (taken from System76’s help post on how to Repair the Bootloader):
for i in /dev /dev/pts /proc /sys /run; do mount -B $i /mnt$i; done
chroot /mnt

# We are now inside the new system, so let’s check whether our fstab mounts everything correctly:
mount -av

# Looks good! Now we need to update the initramfs to make it aware of our changes to the kernelstub:
update-initramfs -c -k all

# ===================== Reboot o live cd

# Verifique se esta tudo ok
sudo mount -av
sudo mount -v | grep /dev/mapper
sudo swapon
sudo btrfs subvolume list /

# Ativar o trim para SSD
sudo systemctl enable fstrim.timer

