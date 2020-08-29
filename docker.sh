#!/bin/bash
# Install Docker Engine on Ubuntu
# https://docs.docker.com/engine/install/ubuntu/
# https://developer.aliyun.com/mirror/docker-ce/
error=1
if [ ! -n "$1" ]
then
    error=0
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
    
elif [ $1 == "1" ]
then
    error=0
    echo "https://docs.docker.com/get-started/"
    echo "https://docs.docker.com/samples/"
    echo "git clone https://github.com/docker/labs.git"
    echo
    echo "docker --help"
    echo
    echo "启动docker服务"
    echo "sudo service docker start"
    echo
    echo "关闭docker服务"
    echo "sudo service docker stop"
    echo "清除docker缓存"
    echo "sudo rm -rf /var/lib/docker"
    echo
    echo "重启docker服务"
    echo "sudo service docker restart"
    echo
    echo "自动清理"
    echo "sudo docker system prune"
    echo
    echo "查看本地镜像"
    echo "sudo docker images"
    echo
    echo "拉取镜像hello-world到本地"
    echo "sudo docker pull hello-world"
    echo
    echo "查找镜像httpd"
    echo "sudo docker search httpd"
    echo
    echo "从镜像hello-world创建名字为my的容器"
    echo "sudo docker run --name my hello-world"
    echo "-i表示交互式操作 -t表示终端 -d表示后台启动"
    echo "sudo docker run --name my -itd hello-world"
    echo
    echo "查看本地容器"
    echo "sudo docker ps -a"
    echo
    echo "查看正在运行的容器"
    echo "sudo docker ps"
    echo
    echo "重命名容器"
    echo "sudo docker rename [OLD NAMES] [NEW NAMES]"
    echo
    echo "运行容器"
    echo "sudo docker start [CONTAINER ID]/[NAMES]"
    echo
    echo "停止容器"
    echo "sudo docker stop [CONTAINER ID]/[NAMES]"
    echo
    echo "停止所有容器"
    echo "sudo docker stop \$(sudo docker ps -a -q)"
    echo
    echo "删除容器"
    echo "sudo docker rm [CONTAINER ID]/[NAMES]"
    echo
    echo "删除所有容器"
    echo "sudo docker rm \$(sudo docker ps -a -q)"
    echo
    echo "杀死所有正在运行的容器"
    echo "sudo docker kill \$(sudo docker ps -a -q)"
    echo
    echo "删除镜像hello-world"
    echo "sudo docker rmi hello-world"
    echo
    echo "删除所有镜像"
    echo "sudo docker rmi \$(sudo docker images -q)"
    echo
    echo "从Dockerfile文件创建新镜像"
    echo "docker build --help"
    echo "确保Dockerfile文件在当前目录下"
    echo "sudo docker build --tag name:tag ."
fi

if [ $error == "1" ]
then
    echo "./docker.sh	安装docker"
    echo "./docker.sh 1	docker教程"
    exit
fi