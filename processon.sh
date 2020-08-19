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
	sudo echo "安装ProcessOn..."
	touch processon.desktop
	echo "#!/usr/bin/env xdg-open">> processon.desktop
	echo "[Desktop Entry]">> processon.desktop
	echo "Version=1.0">> processon.desktop
	echo "Terminal=false">> processon.desktop
	echo "Type=Link">> processon.desktop
	echo "Name=ProcessOn">> processon.desktop
	echo "URL=https://www.processon.com/">> processon.desktop
	echo "Icon=${HOME}/shell/icon/processon.jpg">> processon.desktop
	sudo cp processon.desktop ${HOME}/桌面
	sudo mv processon.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/processon.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/processon.desktop
else
	sudo echo "卸载ProcessOn..."
	sudo rm -rf ${HOME}/processon.desktop
	sudo rm -rf ${HOME}/桌面/processon.desktop
fi
