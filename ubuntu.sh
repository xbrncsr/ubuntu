#!/bin/bash

# Função para mostrar o menu
mostrar_menu() {
  clear  
  echo "+---------------------------------------------+"
  echo "|       SELECIONE UMA OPÇÃO:                  |"
  echo "|   1. Atualizar o sistema                    |"
  echo "|   2. Installar Flatpak                      |"
  echo "|   3. Instalar Ubuntu Restricted Extras      |"
  echo "|   4. Instalar Google Chrome                 |"
  echo "|   5. Disable Keyring Popup                  |"
  echo "|   6. Install Steam                          |"
  echo "|   7. Instalar Git                           |"
  echo "|   8. Instalar Virt-Manager                  |"
  echo "|   9. Instalar VirtualBox                    |"
  echo "|   10. Installar TLP Battery                 |"
  echo "|   q. Sair                                   |"
  echo "+---------------------------------------------+"

}

# Loop principal
while true; do
  mostrar_menu

  # Ler a escolha do usuário
  read -p "DIGITE O NÚMERO DA OPÇÃO DESEJADA: " choice

  case $choice in
    1)
      # Opção 1: Atualizar o sistema
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/update_system.sh -O -)"
      ;;
    2)
      # Opção 2: Instalar Ubuntu Restricted Extras
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/update_system.sh -O -)"
      ;;
    3)
      # Opção 2: Instalar Fontes Microsoft, Htop, IPcalc, Gparted, Neofetch, FFmpeg e Habilitar x86
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_fonts_microsoft.sh -O -)"
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_htop.sh -O -)"
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_ipcalc.sh -O -)"
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_gparted.sh -O -)"
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_neofetch.sh -O -)"
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_ffmpeg.sh -O -)"
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/enable_x86.sh -O -)"
      ;;
    4)
      # Opção 2: Instalar Git
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_git.sh -O -)"
      
      ;;
    5)
      # Opção 2: Instalar Virt-Manager
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_virt_manager.sh -O -)"
      
      ;;
    6)
      # Opção 2: Instalar VirtualBox
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_virtualbox.sh -O -)"
      
      ;;
    7)
      # Opção 2: Instalar Google Chrome
      bash -c "$(wget https://raw.githubusercontent.com/cesarbrunoms/linux/main/ubuntu/scripts/script_files/install_google_chrome.sh -O -)"
      
      ;;
    8)
      # Opção 3: Sair do script
      break
      ;;
    *)
      # Opção inválida
      echo "=====================> [ OPÇÃO INVÁLIDA, TENTE NOVAMENTE! ]"
      ;;
  esac

  # Pausa para o usuário ler a mensagem antes de limpar a tela
  read -p "=====================> [ PRESSIONE ENTER PARA CONTINUAR...! ]"

done