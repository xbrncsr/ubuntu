#linux #ubuntu

&nbsp;

SOURCE: <https://youtu.be/1ENAmcUst1Q?si=9ggtvTTp1-JW5aYE>

## LINK SCRIPT:
```bash
sudo sh -c "$(wget https://raw.githubusercontent.com/xbrncsr/linux/main/wiki/remote_access/ssh_service_ubuntu/install_ssh_service_ubuntu.sh -O -)"

```


## Install SSH Service - Ubuntu / Linux Mint
```bash
sudo apt install -y openssh-server

```

* Start and Enable the SSH Service
```bash
sudo systemctl start sshd
sudo systemctl enable sshd

```

* Allow root user to access via SSH
```bash
sudo nano /etc/ssh/sshd_config

```

* Modify the line
```bash
#PermitRootLogin prohibit-password
PermitRootLogin yes

```

* Restart SSH Service
```bash
sudo systemctl restart ssh

```

* Status SSH Service
```bash
sudo systemctl status ssh

```

* (optional) - Allow SSH traffic on firewall
```bash
sudo ufw allow 22

```

## Access SSH Server
```bash
ssh user@ip

```