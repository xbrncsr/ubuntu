#!/bin/bash

# Install SSH Service - Linux Mint
sudo apt install -y openssh-server

# Start SSH Service
sudo systemctl start ssh

# Enable SSH Service
sudo systemctl enable ssh

# Use sed to modify sshd_config
sudo sed -i 's/#\?PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart SSH Service
sudo systemctl restart ssh

# Status SSH Service
sudo systemctl status ssh

# (optional) - Allow SSH traffic on firewall
sudo ufw allow 22
