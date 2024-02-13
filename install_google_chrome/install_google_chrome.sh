#!/bin/bash

# Install Google Chrome - Ubuntu

# Baixando
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Instalando
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Removendo pacote
rm google-chrome-stable_current_amd64.deb
