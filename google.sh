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
	sudo echo "安装google..."
	touch google.desktop
	echo "#!/usr/bin/env xdg-open">> google.desktop
	echo "[Desktop Entry]">> google.desktop
	echo "Version=1.0">> google.desktop
	echo "Terminal=false">> google.desktop
	echo "Type=Link">> google.desktop
	echo "Name=Google">> google.desktop
	echo "URL=https://www.google.com/">> google.desktop
	echo "Icon=${HOME}/shell/icon/google.jpg">> google.desktop
	sudo cp google.desktop ${HOME}/桌面
	sudo mv google.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/google.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/google.desktop
else
	sudo echo "卸载google..."
	sudo rm -rf ${HOME}/google.desktop
	sudo rm -rf ${HOME}/桌面/google.desktop
fi
