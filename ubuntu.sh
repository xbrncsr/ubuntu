#!/bin/bash

# Função para mostrar o menu
mostrar_menu() {
  clear  
  echo "+---------------------------------------------+"
  echo "|       SELECIONE UMA OPÇÃO:                  |"
  echo "|   1. Atualizar o sistema                    |"
  echo "|   2. Installar Flatpak                      |"
  echo "|   3. Instalar Ubuntu Restricted Extras      |"
  echo "|   4. Instalar Kubuntu Restricted Extras     |"
  echo "|   5. Instalar Google Chrome                 |"
  echo "|   6. Disable Keyring Popup                  |"
  echo "|   7. Install Steam                          |"
  echo "|   8. Instalar Git                           |"
  echo "|   9. Instalar Virt-Manager                  |"
  echo "|   10. Instalar VirtualBox                   |"
  echo "|   11. Installar TLP Battery                 |"
  echo "|   12. Instalar Dropbox                      |"
  echo "|   13. Instalar VSCode - Snap                |"
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
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/config/ubuntu_system/update_system.sh -O -)"
      ;;
    2)
      # Opção 2. Installar Flatpak
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_flapak/install_flapak.sh -O -)"
      ;;
    3)
      # Opção 3. Instalar Ubuntu Restricted Extras
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_ubuntu_restricted_extras/install_ubuntu_restricted_extras.sh -O -)"
      ;;
    4)
      # Opção 4. Instalar Kubuntu Restricted Extras
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_kubuntu_restricted_extras/install_kubuntu_restricted_extras.sh -O -)"
      ;;
    5)
      # Opção 5. Instalar Google Chrome
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_google_chrome/install_google_chrome.sh -O -)"
      
      ;;
    6)
      # Opção 6. Disable Keyring Popup
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/config/disable_keyring_popup/disable_keyring_popup.sh -O -)"
      
      ;;
    7)
      # Opção 7. Install Steam
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_steam/install_steam.sh -O -)"
      
      ;;
    8)
      # Opção 8. Instalar Git
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_git/install_git_ubuntu.sh -O -)"
      
      ;;
    9)
      # Opção 9. Instalar Virt-Manager
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_virt_manager/install_virt_manager.sh -O -)"
      
      ;;
    10)
      # Opção 10. Instalar VirtualBox
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_virtualbox/install_virtualbox.sh -O -)"
      
      ;;
    11)
      # Opção 11. Installar TLP Battery
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_tlp_battery/install_tlp_battery.sh -O -)"
      
      ;;
    12)
      # Opção 11. Installar TLP Battery
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install/install_dropbox/install_dropbox.sh -O -)"
      
      ;;
    q)
      # Opção q: Sair do script
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