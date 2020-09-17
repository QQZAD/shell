#!/bin/bash
# https://ohmyz.sh/#install
if [ -n "$1" ]
then
    if [ $1 -eq "1" ]
    then
        sudo echo "配置zsh..."
        read -p "按回车键继续..."
        # gedit ~/.zshrc
        sed -i "s#ZSH_THEME=\"robbyrussell\"#ZSH_THEME=\"agnoster\"#g" ~/.zshrc
        if [ $(grep -c "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" ~/.zshrc) -eq 0 ]
        then
            echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
        fi
        if [ $(grep -c "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ~/.zshrc) -eq 0 ]
        then
            echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
        fi
        echo "1.编辑-首选项-文本-[打勾]自定义字体-Meslo LG S DZ for Powerline Regular-11"
        echo "2.编辑-首选项-颜色-[去勾]使用系统主题的颜色-内置方案-深色的Solarized"
        echo "3.重新打开终端"
    else
        sudo echo "卸载zsh..."
        read -p "按回车键继续..."
        # whereis zsh
        # zsh: /usr/share/zsh
        if [ -d "${HOME}/.oh-my-zsh" ]
        then
            chmod +x ${HOME}/.oh-my-zsh/tools/uninstall.sh
            ${HOME}/.oh-my-zsh/tools/uninstall.sh
        fi
        sudo apt-get remove --purge zsh fonts-powerline zsh-theme-powerlevel9k zsh-syntax-highlighting -y
        sudo apt-get autoremove
        rm -rf ${HOME}/.oh-my-zsh
        sudo rm -rf /etc/zsh
    fi
else
    sudo echo "安装zsh..."
    if [ ! -f "powerline-fonts.zip" ]
    then
        echo "在shell/中没有找到powerline-fonts.zip"
        exit
    fi
    read -p "安装完成后手动重启，之后运行./zsh.sh 1"
    unzip powerline-fonts.zip
    cd powerline-fonts
    sudo ./install.sh
    cd ..
    rm -rf powerline-fonts
    sudo apt-get install zsh fonts-powerline zsh-theme-powerlevel9k zsh-syntax-highlighting -y
    zsh --version
    # https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    ./install.sh
fi