#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://www.teamviewer.cn/cn/download/linux/
platform=0
#0表示Linux，1表示Raspbian Pi
if [ -n "$1" ]; then
    if [ $1 -eq "1" ]
    then
        option=1
    else
        option=0
    fi
fi
if [ $option -eq 1 ]
then
    sudo echo "安装teamviewer..."
    if [ $platform -eq 0 ]
    then
        name=teamviewer_15.10.5_amd64.deb
    elif [ $platform -eq 1 ]
    then
        name=teamviewer-host_15.10.5_armhf.deb
    fi
    if [ ! -f "./$name" ]
    then
        echo "正在从网络获取$name"
        wget --no-check-certificate https://dl.teamviewer.cn/download/linux/version_15x/$name
    else
        echo "已经获取本地$name"
    fi
    sudo dpkg -i $name
    sudo apt-get -y install -f
    echo "teamviewer --version"
    teamviewer --version
    echo
    echo -e "\e[32m如果安装过程出现错误请再次运行./teamviewer.sh 1\e[0m"
else
    sudo echo "卸载teamviewer..."
    sudo dpkg --purge teamviewer
    sudo apt-get autoremove -y
    echo
    echo -e "\e[32m如果卸载过程出现错误请运行./teamviewer.sh 1后再卸载\e[0m"
fi
