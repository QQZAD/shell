#!/bin/bash
option=1
# 1 to install, 0 to uninstall
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
	sudo echo "安装google chrome..."
	name=google-chrome-stable_current_amd64.deb
	if [ ! -f "./$name" ]
	then
		echo "正在从网络获取$name"
		wget --no-check-certificate https://dl.google.com/linux/direct/$name
	else
		echo "已经获取本地$name"
	fi
	sudo dpkg -i $name
	sudo apt-get -y install -f
	echo "google-chrome-stable --version"
	google-chrome-stable --version
	echo
	echo -e "\e[32m如果安装过程出现错误请再次运行./chrome.sh 1\e[0m"

else
	sudo echo "卸载google chrome..."
	sudo dpkg --purge google-chrome-stable
	echo
	echo -e "\e[32m如果卸载过程出现错误请运行./chrome.sh 1后再卸载\e[0m"
fi
