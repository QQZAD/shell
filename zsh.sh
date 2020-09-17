#!/bin/bash
# 1 to install, 0 to uninstall
# https://ohmyz.sh/#install
if [ -n "$1" ]
then
    if [ $1 -eq "1" ]
    then
        sudo echo "配置zsh..."
        read -p "按回车键继续..."
        # gedit ~/.zshrc
        # sed -i "s#ZSH_THEME=\"robbyrussell\"#ZSH_THEME=\"agnoster\"#g" ~/.zshrc
        if [ $(grep -c "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" ~/.zshrc) -eq 0 ]
        then
            echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
        fi
        if [ $(grep -c "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ~/.zshrc) -eq 0 ]
        then
            echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
        fi
    else
        sudo echo "卸载zsh..."
        read -p "按回车键继续..."
        # whereis zsh
        # zsh: /usr/share/zsh
        sudo apt-get remove --purge zsh powerline fonts-powerline zsh-theme-powerlevel9k zsh-syntax-highlighting -y
        sudo apt-get autoremove
        chmod +x ${HOME}/.oh-my-zsh/tools/uninstall.sh
        ${HOME}/.oh-my-zsh/tools/uninstall.sh
        rm -rf ${HOME}/.oh-my-zsh
    fi
else
    sudo echo "安装zsh..."
    read -p "安装完成后将自动重启，之后打开终端输入2回车，运行./zsh.sh 1..."
    sudo apt-get install zsh powerline fonts-powerline zsh-theme-powerlevel9k zsh-syntax-highlighting -y
    zsh --version
    chsh -s `which zsh`
    sudo reboot
    echo "安装完成后将自动重启，重启后运行./zsh.sh 1"
    # https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    # ./install.sh
fi