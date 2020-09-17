#!/bin/bash
# https://ohmyz.sh/#install
sudo apt-get install zsh -y
echo "编辑-首选项-未命名-命令-运行自定义命令而不是Shell-自定义命令/bin/zsh"
rm -rf ${HOME}/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"