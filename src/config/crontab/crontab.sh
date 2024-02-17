#!/bin/bash

#
# Status Crontab
# /etc/init.d/cron status

# Editando Crontab
# sudo nano /etc/crontab

# $a: Indica ao sed para inserir na ultima linha.
sudo sed -i '$a 35  15  *   *   *   root    sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y' /etc/crontab