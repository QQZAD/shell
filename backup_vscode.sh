#!/bin/bash
# https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip
# ${HOME}/.vscode/
# vscode.zip
# vscdoe/settings.json
# vscdoe/argv.json
# vscdoe/extensions/...
# vscdoe/TTF/FiraCode-Bold.ttf
# vscdoe/TTF/FiraCode-Light.ttf
# vscdoe/TTF/FiraCode-Medium.ttf
# vscdoe/TTF/FiraCode-Regular.ttf
# vscdoe/TTF/FiraCode-Retina.ttf

if [ -d "vscode/" ]; then
	sudo chown ${USER}: -R vscode/
	sudo rm -rf vscode/
fi
sudo mkdir vscode/
sudo cp ${HOME}/.config/Code/User/settings.json vscode/settings.json
sudo cp ${HOME}/.vscode/argv.json vscode/argv.json
sudo cp -r ${HOME}/.vscode/extensions vscode/
sudo chown ${USER}: -R vscode
wget --no-check-certificate https://mirror.tuna.tsinghua.edu.cn/pkgsrc/packages/NetBSD/sandpoint/8.0/All/FiraCode-2.tgz -O vscode/FiraCode-2.tgz
mkdir vscode/FiraCode-2
tar -zxf vscode/FiraCode-2.tgz -C vscode/FiraCode-2/
mv vscode/FiraCode-2/share/fonts/X11/TTF vscode/
sudo rm -rf vscode/FiraCode-2
sudo rm -rf vscode/FiraCode-2.tgz
zip -q -r vscode.zip vscode/
sudo rm -rf vscode/
echo
echo "已成功备份vscode的设置、字体和扩展等，保存在vscode.zip中！"
