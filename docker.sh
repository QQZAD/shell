#!/bin/bash
# Install Docker Engine on Ubuntu
# https://docs.docker.com/engine/install/ubuntu/
# https://developer.aliyun.com/mirror/docker-ce/
sudo apt-get remove docker docker-engine docker.io containerd runc
# Install using the repository

sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu/ \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

if [ ! -f "/etc/docker/daemon.json" ]
then
    sudo touch /etc/docker/daemon.json
fi

sudo sh -c 'echo "{\"registry-mirrors\": [\"http://hub-mirror.c.163.com\"]}"> /etc/docker/daemon.json'

systemctl restart docker

docker -v
sudo docker run hello-world