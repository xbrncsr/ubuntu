#!/bin/bash

# Função para mostrar o menu
mostrar_menu() {
  clear  
  echo "+---------------------------------------------+"
  echo "|       SELECIONE UMA OPÇÃO:                  |"
  echo "|   1. Atualizar o Sistema                    |"
  echo "|   2. Instalar Bitwarden - Snap              |"
  echo "|   3. Instalar Shotcut - Snap                |"
  echo "|   4. Instalar Spotify - Snap                |"
  echo "|   5. Instalar Telegram - Snap               |"
  echo "|   6. Instalar VLC - Snap                    |"
  echo "|   7. Instalar VSCode - Snap                 |"
  echo "|   8. Instalar WinBox - Snap                 |"
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
      # Opção 2. Installar Bitwarden
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_bitwarden_snap/install_bitwarden_snap.sh -O -)"
      ;;
    3)
      # Opção 3. Instalar Shotcut
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_shotcut_snap/install_shotcut_snap.sh -O -)"
      ;;
    4)
      # Opção 4. Instalar Spotify
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_spotify_snap/install_spotify_snap.sh -O -)"
      ;;
    5)
      # Opção 5. Instalar Telegram
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_telegram_snap/install_telegram_snap.sh -O -)"
      
      ;;
    6)
      # Opção 6. Instalar VLC
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_vlc_snaps/install_vlc_snaps.sh -O -)"
      
      ;;
    7)
      # Opção 7. Install VSCode
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_vscode_snap/install_vscode_snap.sh -O -)"
      
      ;;
    8)
      # Opção 8. Instalar WinBox
      bash -c "$(wget https://raw.githubusercontent.com/xbrncsr/ubuntu/main/src/install_apps_snaps/install_winbox_snap/install_winbox_snap.sh -O -)"
      
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