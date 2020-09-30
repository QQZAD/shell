#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://cidian.youdao.com/multi.html
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
    sudo echo "安装youdao..."
    name=youdao-dict_6.0.0-ubuntu-amd64.deb
    if [ ! -f "./$name" ]
    then
        echo "正在从网络获取$name"
        wget --no-check-certificate http://codown.youdao.com/cidian/linux/$name
    else
        echo "已经获取本地$name"
    fi
    sudo dpkg -i $name
    sudo apt-get -y install -f
    echo
    echo -e "\e[32m如果安装过程出现错误请再次运行./youdao.sh 1\e[0m"
else
    sudo echo "卸载youdao..."
    sudo dpkg --purge youdao-dict
    echo
    echo -e "\e[32m如果卸载过程出现错误请运行./youdao.sh 1后再卸载\e[0m"
fi
