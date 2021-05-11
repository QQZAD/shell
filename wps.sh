#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://www.wps.cn/product/wpslinux
if [ -n "$1" ]; then
    if [ $1 -eq "1" ]; then
        option=1
    else
        option=0
    fi
fi
if [ $option -eq 1 ]; then
    sudo echo "安装wps..."
    name=wps-office_11.1.0.10161_amd64.deb
    address=10161/$name
    if [ ! -f "./$name" ]; then
        echo "正在从网络获取$name"
        wget --no-check-certificate https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/$address
    else
        echo "已经获取本地$name"
    fi
    sudo dpkg -i $name
    sudo apt-get -y install -f
    sudo apt-get install git -y
    git clone https://github.com/iamdh4/ttf-wps-fonts.git
    sudo "ttf-wps-fonts/install.sh"
    sudo rm -rf ttf-wps-fonts
    if [ -d "${HOME}/桌面" ]; then
        sudo chmod +x ${HOME}/桌面/wps-office-prometheus.desktop
    else
        sudo chmod +x ${HOME}/Desktop/wps-office-prometheus.desktop
    fi
    sudo chown ${USER}: -R ${HOME}
    echo
    echo -e "\e[32m如果安装过程出现错误请再次运行./wps.sh 1\e[0m"
else
    sudo echo "卸载wps..."
    sudo dpkg --purge wps-office
    sudo apt-get autoremove -y
    if [ -d "/usr/share/fonts/wps-fonts" ]; then
        sudo rm -rf /usr/share/fonts/wps-fonts
    fi
    echo
    echo -e "\e[32m如果卸载过程出现错误请运行./wps.sh 1后再卸载\e[0m"
fi
