#!/bin/bash

#
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager && sudo usermod -a -G libvirt $USER

#
# (On VM) Guest Agent integration and performance
# sudo apt install -y qemu-guest-agent
#