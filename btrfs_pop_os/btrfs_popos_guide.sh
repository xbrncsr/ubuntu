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

