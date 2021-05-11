#!/bin/bash
echo "Ubuntu MATE"
echo "正在利用阿里源更新sources.list..."
if [ ! -d "/etc/apt/sources_backup" ]; then
    sudo mkdir /etc/apt/sources_backup
    sudo mv /etc/apt/sources.list /etc/apt/sources_backup
    sudo chown ${USER}: -R /etc/apt/sources_backup
fi
sudo touch /etc/apt/sources.list
sudo chown ${USER}: -R /etc/apt/sources.list
release_num=$(lsb_release -r --short)
case "$release_num" in
"16.04")
    cat >/etc/apt/sources.list <<END_TEXT
deb http://mirrors.aliyun.com/ubuntu-ports/ xenial main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu-ports/ xenial-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu-ports/ xenial-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu-ports/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic-backports main restricted universe multiverse
END_TEXT
    ;;
"18.04")
    cat >/etc/apt/sources.list <<END_TEXT
deb http://mirrors.aliyun.com/ubuntu-ports/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu-ports/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu-ports/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu-ports/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu-ports/ bionic-backports main restricted universe multiverse
END_TEXT
    ;;
*)
    exit
    ;;
esac
echo "已经将原始sources.list备份至/etc/apt/sources_backup"
sudo apt-get update
sudo apt-get install vim -y
sudo apt-get install git -y
echo "设置ssh服务开机自动启动"
echo "在Raspberry Pi终端中输入sudo raspi-config"
echo "Interfacing Options->SSH->Yes"
echo "sudo service ssh start"
echo "sudo service ssh stop"
echo "sudo service ssh status"
sudo apt install python-pip
./pip.sh
pip install pyCrypto
