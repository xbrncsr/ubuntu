#!/bin/bash

# Install X11VNC
sudo apt install -y x11vnc

# Config X11VNC
SERVICE_FILE="/etc/systemd/system/x11vnc.service"
sudo bash -c "cat > $SERVICE_FILE" <<EOF
[Unit]
Description=Start X11VNC at startup.
After=multi-user.target

[Service]
Type=simple
# Mude a variável "$USER" para o usuário atual!
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/$USER/.vnc/passwd -rfbport 5901 -shared

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable x11vnc.service

# Start the service immediately without needing to reboot
sudo systemctl start x11vnc.service
