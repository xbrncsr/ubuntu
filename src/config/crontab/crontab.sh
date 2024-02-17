#!/bin/bash

# Crontab
sudo sed -i '$ a\30 10 * * * root sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y' /etc/crontab
