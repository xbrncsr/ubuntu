#!/bin/bash

# Crontab
# $i: Indica ao sed para inserir a linha antes da última linha.
sudo sed -i '$i 25 10 * * * root sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y' /etc/crontab

