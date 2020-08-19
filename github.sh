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
	sudo echo "安装GitHub..."
	touch github.desktop
	echo "#!/usr/bin/env xdg-open">> github.desktop
	echo "[Desktop Entry]">> github.desktop
	echo "Version=1.0">> github.desktop
	echo "Terminal=false">> github.desktop
	echo "Type=Link">> github.desktop
	echo "Name=GitHub">> github.desktop
	echo "URL=https://github.com/">> github.desktop
	echo "Icon=${HOME}/shell/icon/github.jpg">> github.desktop
	sudo cp github.desktop ${HOME}/桌面
	sudo mv github.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/github.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/github.desktop
else
	sudo echo "卸载GitHub..."
	sudo rm -rf ${HOME}/github.desktop
	sudo rm -rf ${HOME}/桌面/github.desktop
fi
