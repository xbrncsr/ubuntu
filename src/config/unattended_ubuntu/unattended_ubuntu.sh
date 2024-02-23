#!/bin/bash

# source:
# https://www.linuxcapable.com/how-to-configure-unattended-upgrades-on-ubuntu-linux/
# https://youtu.be/o0z8UjU0AJs?si=TcX1mSedEC8hwFrw
# https://tonyteaches.tech/ubuntu-automatic-update-tutorial/

# Etapa 1: atualize o Ubuntu
sudo apt update
sudo apt upgrade -y


# Etapa 2: instalar o pacote de atualizações autônomas
sudo apt install -y unattended-upgrades
sudo apt install -y apt-config-auto-update

# Também é recomendável verificar se o pacote de atualizações
# autônomas está funcionando corretamente. Para fazer isso,
# abra o terminal e digite o seguinte comando:
sudo unattended-upgrades --dry-run --debug

# Status Unattended
sudo systemctl status unattended-upgrades

# Start Unattended
sudo systemctl start unattended-upgrades

# Stop Unattended
sudo systemctl stop unattended-upgrades

# Enable Unattended
sudo systemctl enable unattended-upgrades

# Disable Unattended
sudo systemctl disable unattended-upgrades

# Restart Unattended
sudo systemctl restart unattended-upgrades


# Seção 3: Configurar atualizações autônomas
# Editando o arquivo de configuração
## Configure Unattended Upgrades
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades

# Origens permitidas
Unattended-Upgrade::AutoFixInterruptedDpkg "true";

# (OPCIONAL) InstallOnShutdown
# Esta opção especifica se as atualizações devem ser
# instaladas no encerramento. Por padrão, esta opção
# está desabilitada. Para habilitar a instalação no
# desligamento, defina o valor como “true” conforme
# mostrado no exemplo abaixo:
Unattended-Upgrade::InstallOnShutdown "true";

# Remover pacotes de kernel não utilizados
# Esta opção especifica se os pacotes de kernel não
# utilizados devem ser removidos após uma atualização.
# Por padrão, está opção está ativada. Para desabilitar
# a remoção de pacotes de kernel não utilizados, defina
# o valor como “false” conforme mostrado no exemplo abaixo:
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";

# Remover novas dependências não utilizadas
# Esta configuração controla a remoção de novas dependências
# que o sistema não requer mais após atualizações de pacotes.
# Por padrão, esta configuração está habilitada e quaisquer
# novas dependências que não sejam mais necessárias serão
# automaticamente removidas do seu sistema. Para habilitar
# esta configuração, use o seguinte comando:
Unattended-Upgrade::Remove-New-Unused-Dependencies "true";

# Remover dependências não utilizadas
# Esta opção especifica se as dependências não utilizadas
# devem ser removidas após uma atualização. Por padrão,
# esta opção está desabilitada. Para permitir a remoção
# de dependências não utilizadas, defina o valor como “true”
# conforme mostrado no exemplo abaixo:
Unattended-Upgrade::Remove-Unused-Dependencies "true";

# Reinicialização automática
# Esta opção especifica se o sistema deve ser reinicializado
# automaticamente após uma atualização. Por padrão, esta opção
# está desabilitada. Para ativar a reinicialização automática,
# defina o valor como “true” conforme mostrado no exemplo abaixo:
Unattended-Upgrade::Automatic-Reboot "true";

# Tempo de reinicialização automática
# Esta opção especifica o horário em que o sistema deve reinicializar
# automaticamente após uma atualização. Por padrão, esta opção está
# definida como “02:00”. Para alterar o tempo de reinicialização,
# modifique o valor conforme mostrado no exemplo abaixo:
Unattended-Upgrade::Automatic-Reboot-Time "03:00";


# Seção 4: Agendando atualizações automáticas com um Cron Job
# Para agendar atualizações automáticas e autônomas em seu sistema Ubuntu,
# você pode usar um cron job. Um cron job é um agendador de tarefas baseado
# em tempo no Linux que permite executar comandos ou scripts automaticamente
# em horários ou intervalos especificados.
# Para criar um cron job para atualizações autônomas, siga as etapas abaixo:
# Abra o arquivo de configuração do crontab executando o seguinte comando:
sudo crontab -e

# Isso abrirá o arquivo crontab no editor nano. Adicione a seguinte linha ao final do arquivo:
0 0 * * * /usr/bin/unattended-upgrade -d



## Para aplicar as configurações
```bash
sudo dpkg-reconfigure -plow unattended-upgrades

```

```bash
sudo unattended-upgrades --dry-run --debug

```