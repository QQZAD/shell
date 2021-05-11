#!/bin/bash
option=1
# 1 to install, 0 to uninstall
if [ -n "$1" ]; then
	if [ $1 -eq "1" ]; then
		option=1
	else
		option=0
	fi
fi
if [ $option -eq 1 ]; then
	sudo echo "安装bing..."
	touch bing.desktop
	echo "#!/usr/bin/env xdg-open" >>bing.desktop
	echo "[Desktop Entry]" >>bing.desktop
	echo "Version=1.0" >>bing.desktop
	echo "Terminal=false" >>bing.desktop
	echo "Type=Link" >>bing.desktop
	echo "Name=Bing" >>bing.desktop
	echo "URL=https://cn.bing.com/" >>bing.desktop
	echo "Icon=${HOME}/shell/icon/bing.jpg" >>bing.desktop
	sudo cp bing.desktop ${HOME}/桌面
	sudo mv bing.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/bing.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/bing.desktop
else
	sudo echo "卸载bing..."
	sudo rm -rf ${HOME}/bing.desktop
	sudo rm -rf ${HOME}/桌面/bing.desktop
fi
