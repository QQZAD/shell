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
	sudo echo "安装wechat..."
	touch wechat.desktop
	echo "#!/usr/bin/env xdg-open" >>wechat.desktop
	echo "[Desktop Entry]" >>wechat.desktop
	echo "Version=1.0" >>wechat.desktop
	echo "Terminal=false" >>wechat.desktop
	echo "Type=Link" >>wechat.desktop
	echo "Name=微信网页版" >>wechat.desktop
	echo "URL=https://wx.qq.com" >>wechat.desktop
	echo "Icon=${HOME}/shell/icon/wechat.jpg" >>wechat.desktop
	sudo cp wechat.desktop ${HOME}/桌面
	sudo mv wechat.desktop ${HOME}
	sudo chown ${USER}: -R ${HOME}/wechat.desktop
	sudo chown ${USER}: -R ${HOME}/桌面/wechat.desktop
else
	sudo echo "卸载wechat..."
	sudo rm -rf ${HOME}/wechat.desktop
	sudo rm -rf ${HOME}/桌面/wechat.desktop
fi
