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
	sudo echo "安装feishu..."
	touch feishu.desktop
	echo "#!/usr/bin/env xdg-open">> feishu.desktop
	echo "[Desktop Entry]">> feishu.desktop
	echo "Version=1.0">> feishu.desktop
	echo "Terminal=false">> feishu.desktop
	echo "Type=Link">> feishu.desktop
	echo "Name=飞书">> feishu.desktop
	echo "URL=https://www.feishu.cn/">> feishu.desktop
	echo "Icon=${HOME}/shell/icon/feishu.jpg">> feishu.desktop
	sudo cp feishu.desktop ${HOME}/桌面
	sudo mv feishu.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/feishu.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/feishu.desktop
else
	sudo echo "卸载feishu..."
	sudo rm -rf ${HOME}/feishu.desktop
	sudo rm -rf ${HOME}/桌面/feishu.desktop
fi
