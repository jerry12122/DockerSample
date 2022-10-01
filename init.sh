#!/bin/bash

#基本設定
SSH_PORT=22
USER=ubuntu
TZ=Asia/Taipei
PASSWORD=password

# 安裝套件
apt update
apt install -y git wget curl net-tools vim openssh-server docker.io tmux iputils-ping

# 設定時區
DEBIAN_FRONTEND=noninteractive TZ=$TZ apt-get -y install tzdata
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata 

# 允許密碼登入
echo "$user:password" | chpasswd
sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service sshd restart

# 設定防火牆
ufw allow $SSH_PORT
echo "y" | ufw enable

# 安裝docker-compose
wget https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | sed -E 's/.*"([^"]+)".*/\1/')/docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
docker-compose up -d

# 建立docker網路
docker create network static --subnet 172.20.0.0/24

