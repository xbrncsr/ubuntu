#!/bin/bash

#
sudo apt install -y virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack

#
# Resolve erro na VM após update kernel na máquina hospedeira
# sudo dpkg-reconfigure virtualbox-dkms
# sudo modprobe vboxdrv
# sudo apt install linux-headers-`uname -r`
# sudo usermod -a -G vboxusers $USER
#
