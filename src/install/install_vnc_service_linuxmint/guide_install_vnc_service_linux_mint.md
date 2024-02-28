# Install VNC Service Linux Mint 21.3
source: <https://tecadmin.net/setup-x11vnc-server-on-ubuntu-linuxmint/>

## LINK SCRIPT:
```bash
sudo sh -c "$(wget https://raw.githubusercontent.com/xbrncsr/linux/main/wiki/remote_access/vnc_service_linuxmint/install_vnc_service_linux_mint.sh -O -)"

# Senha VNC
x11vnc -storepasswd

# Mude a variável "$USER" para o usuário atual!
sudo nano /etc/systemd/system/x11vnc.service

```

## Install X11VNC
```bash
sudo apt install -y x11vnc

```

## Create Password for VNC Server
```bash
x11vnc -storepasswd

```

## Start the X11VNC Server
```bash
#x11vnc -usepw -display :0 

```

## Config X11VNC
```bash
sudo nano /etc/systemd/system/x11vnc.service

```

```bash
[Unit]
Description=Start X11VNC at startup.
After=multi-user.target
 
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/$USER/.vnc/passwd -rfbport 5901 -shared
 
[Install]
WantedBy=multi-user.target

```

* Replace **“YOURUSERNAME”** with your actual username.

## Next, reload the systemd manager configuration with this command:
```bash
sudo systemctl daemon-reload

```

## Now, enable the service to start on boot:
```bash
sudo systemctl enable x11vnc.service

```

## Finally, you can start the service immediately without needing to reboot:
```bash
sudo systemctl start x11vnc.service

```
