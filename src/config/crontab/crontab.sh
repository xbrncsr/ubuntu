#!/bin/bash

#
# ========== STATUS CRONTAB
# /etc/init.d/cron status
#


#
# ========== EXEMPLO MANUAL EDITANDO CRONTAB
# sudo nano /etc/crontab
# 35  15  *   *   *   root    sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y
#
# ========== OU COM SCRIPT
# 35  15  *   *   *   root    /home/user/documents/scripts/auto_update.sh
#
# ========== NÃO ESQUEÇA DAS PERMISSÕES DO SCRIPT
# chmod 777 auto_update.sh
#


#
# ========== EXEMPLO AUTOMATICO
# $a: Indica ao sed para inserir na ultima linha.
sudo sed -i '$a 10  16  *   *   *   root    sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo snap refresh && sudo reboot now' /etc/crontab