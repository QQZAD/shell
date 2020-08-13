#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://im.qq.com/linuxqq/download.html
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
	sudo echo "安装qq..."
	sudo apt install libgtk2.0-0
	name=linuxqq_2.0.0-b2-1082_amd64.deb
	if [ ! -f "./$name" ]
	then
		echo "正在从网络获取$name"
		wget --no-check-certificate "http://111.62.242.50/dlied1.qq.com/qqweb/LinuxQQ_1/$name?mkey=5e9fba6f6f3cca9b&f=cfc4&cip=111.60.236.110&proto=http" -O $name
	else
		echo "已经获取本地$name"
	fi
	sudo dpkg -i $name
	sudo apt-get -y install -f
	echo "如果版本更新后登录出现闪退情况，运行rm -rf ~/.config/tencent-qq/[你的QQ号]后重新登录。"
else
	sudo echo "卸载qq..."
	sudo dpkg -r linuxqq
	sudo dpkg --purge linuxqq
fi
