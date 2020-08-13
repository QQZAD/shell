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
	sudo echo "安装youdao..."
	touch youdao.desktop
	echo "#!/usr/bin/env xdg-open">> youdao.desktop
	echo "[Desktop Entry]">> youdao.desktop
	echo "Version=1.0">> youdao.desktop
	echo "Terminal=false">> youdao.desktop
	echo "Type=Link">> youdao.desktop
	echo "Name=有道翻译网页版">> youdao.desktop
	echo "URL=http://fanyi.youdao.com/">> youdao.desktop
	echo "Icon=${HOME}/shell/icon/youdao.jpg">> youdao.desktop
	sudo cp youdao.desktop ${HOME}/桌面
	sudo mv youdao.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/youdao.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/youdao.desktop
else
	sudo echo "卸载youdao..."
	sudo rm -rf ${HOME}/youdao.desktop
	sudo rm -rf ${HOME}/桌面/youdao.desktop
fi
