#!/bin/bash

# Easy way to run script:
# su
# apt install curl && bash <(curl -L -s https://github.com/T3hUb3rK1tten/homelab/raw/master/homelab-setup.sh)

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt update
apt -y install curl sudo openssh-server debian-goodies

rm -Rf /home/michael/.ssh
mkdir /home/michael/.ssh
curl -L -o /home/michael/.ssh/authorized_keys https://github.com/T3hUb3rK1tten/homelab/raw/master/authorized_keys
chown -R michael:michael /home/michael/.ssh
chmod -R 700 /home/michael/.ssh
chmod 600 /home/michael/.ssh/authorized_keys

curl -L -o /etc/sudoers.d/michael-sudo https://github.com/T3hUb3rK1tten/homelab/raw/master/michael-sudo
chmod 440 /etc/sudoers.d/michael-sudo

curl -L -o /etc/ssh/sshd_config https://github.com/T3hUb3rK1tten/homelab/raw/master/sshd_config
chmod 644 /etc/ssh/sshd_config
service sshd reload
service ssh reload
