#!/bin/bash

#
# SOURCE:
# <https://youtu.be/o0z8UjU0AJs?si=TcX1mSedEC8hwFrw>
# <https://tonyteaches.tech/ubuntu-automatic-update-tutorial/>
#

# Instala o pacote unattended-upgrades
sudo apt install -y unattended-upgrades update-notifier-common

# Atualiza a configuração do Unattended Upgrades
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades

# Certifique-se de que as seguintes linhas estejam presentes e descomentadas
sudo sed -i '/^\/\/Unattended-Upgrade::Remove-Unused-Kernel-Packages/s/^\/\///' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i '/^\/\/Unattended-Upgrade::Remove-New-Unused-Dependencies/s/^\/\///' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i '/^\/\/Unattended-Upgrade::Remove-Unused-Dependencies/s/^\/\///' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i '/^\/\/Unattended-Upgrade::Automatic-Reboot/s/^\/\///' /etc/apt/apt.conf.d/50unattended-upgrades

# Definir horário do reboot
sudo sed -i '/^\/\/Unattended-Upgrade::Automatic-Reboot-Time/s/^\/\///' /etc/apt/apt.conf.d/50unattended-upgrades

# Para aplicar as configurações
sudo dpkg-reconfigure -plow unattended-upgrades
sudo unattended-upgrades --dry-run --debug
