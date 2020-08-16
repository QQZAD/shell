#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://code.visualstudio.com/docs/?dv=linux64_deb
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
    sudo echo "安装vscode..."
    name=code_1.48.0-1597304990_amd64.deb
    address=db40434f562994116e5b21c24015a2e40b2504e6/$name
    if [ ! -f "./$name" ]
    then
        echo "正在从网络获取$name"
        wget --no-check-certificate https://vscode.cdn.azure.cn/stable/$address
    else
        echo "已经获取本地$name"
    fi
    sudo dpkg -i $name
    sudo apt-get -y install -f
    echo "code --version"
    code --version
    echo
    echo -e "\e[32m如果安装过程出现错误请再次运行./vscode.sh 1\e[0m"
else
    sudo echo "卸载vscode..."
    sudo dpkg --purge code
    echo
    echo -e "\e[32m如果卸载过程出现错误请运行./vscode.sh 1后再卸载\e[0m"
fi