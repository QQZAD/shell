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
	sudo echo "安装baidu..."
	touch baidu.desktop
	echo "#!/usr/bin/env xdg-open">> baidu.desktop
	echo "[Desktop Entry]">> baidu.desktop
	echo "Version=1.0">> baidu.desktop
	echo "Terminal=false">> baidu.desktop
	echo "Type=Link">> baidu.desktop
	echo "Name=百度">> baidu.desktop
	echo "URL=https://www.baidu.com/">> baidu.desktop
	echo "Icon=${HOME}/shell/icon/baidu.jpg">> baidu.desktop
	sudo cp baidu.desktop ${HOME}/桌面
	sudo mv baidu.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/baidu.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/baidu.desktop
else
	sudo echo "卸载baidu..."
	sudo rm -rf ${HOME}/baidu.desktop
	sudo rm -rf ${HOME}/桌面/baidu.desktop
fi
