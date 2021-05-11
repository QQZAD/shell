#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
SET=1
# 1 for aliyun, 2 for tsinghua
if [ -n "$1" ]; then
    if [ $1 -eq "1" ]; then
        option=1
    else
        option=0
    fi
fi
if [ $option -eq 1 ]; then
    if [ $SET -eq 1 ]; then
        DESCRIBE="阿里源"
        MIRRORS=http://mirrors.aliyun.com/ubuntu/

    elif [ $SET -eq 2 ]; then
        DESCRIBE="清华源"
        MIRRORS=https://mirrors.tuna.tsinghua.edu.cn/ubuntu/
    fi
    echo "正在利用${DESCRIBE}更新sources.list..."
    if [ ! -d "/etc/apt/sources_backup" ]; then
        sudo mkdir /etc/apt/sources_backup
        sudo mv /etc/apt/sources.list /etc/apt/sources_backup
    fi
    touch ~/sources.list
    release_num=$(lsb_release -r --short)
    case "$release_num" in
    "20.04")
        cat >~/sources.list <<END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb $MIRRORS focal main restricted universe multiverse
# deb-src $MIRRORS focal main restricted universe multiverse
deb $MIRRORS focal-updates main restricted universe multiverse
# deb-src $MIRRORS focal-updates main restricted universe multiverse
deb $MIRRORS focal-backports main restricted universe multiverse
# deb-src $MIRRORS focal-backports main restricted universe multiverse
deb $MIRRORS focal-security main restricted universe multiverse
# deb-src $MIRRORS focal-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb $MIRRORS focal-proposed main restricted universe multiverse
# deb-src $MIRRORS focal-proposed main restricted universe multiverse
END_TEXT
        ;;
    "18.04")
        cat >~/sources.list <<END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb $MIRRORS bionic main restricted universe multiverse
# deb-src $MIRRORS bionic main restricted universe multiverse
deb $MIRRORS bionic-updates main restricted universe multiverse
# deb-src $MIRRORS bionic-updates main restricted universe multiverse
deb $MIRRORS bionic-backports main restricted universe multiverse
# deb-src $MIRRORS bionic-backports main restricted universe multiverse
deb $MIRRORS bionic-security main restricted universe multiverse
# deb-src $MIRRORS bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb $MIRRORS bionic-proposed main restricted universe multiverse
# deb-src $MIRRORS bionic-proposed main restricted universe multiverse
END_TEXT
        ;;
    "16.04")
        cat >~/sources.list <<END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb $MIRRORS xenial main restricted universe multiverse
# deb-src $MIRRORS xenial main restricted universe multiverse
deb $MIRRORS xenial-updates main restricted universe multiverse
# deb-src $MIRRORS xenial-updates main restricted universe multiverse
deb $MIRRORS xenial-backports main restricted universe multiverse
# deb-src $MIRRORS xenial-backports main restricted universe multiverse
deb $MIRRORS xenial-security main restricted universe multiverse
# deb-src $MIRRORS xenial-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb $MIRRORS xenial-proposed main restricted universe multiverse
# deb-src $MIRRORS xenial-proposed main restricted universe multiverse
END_TEXT
        ;;
    "14.04")
        cat >~/sources.list <<END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb $MIRRORS trusty main restricted universe multiverse
# deb-src $MIRRORS trusty main restricted universe multiverse
deb $MIRRORS trusty-updates main restricted universe multiverse
# deb-src $MIRRORS trusty-updates main restricted universe multiverse
deb $MIRRORS trusty-backports main restricted universe multiverse
# deb-src $MIRRORS trusty-backports main restricted universe multiverse
deb $MIRRORS trusty-security main restricted universe multiverse
# deb-src $MIRRORS trusty-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb $MIRRORS trusty-proposed main restricted universe multiverse
# deb-src $MIRRORS trusty-proposed main restricted universe multiverse
END_TEXT
        ;;
    *)
        echo "不支持的系统版本"
        exit
        ;;
    esac
    sudo mv ~/sources.list /etc/apt/sources.list
    sudo chown root: /etc/apt/sources.list
    echo "通过命令cd /etc/apt/;ls;vim sources.list查看"
    echo "已经将原始sources.list备份至/etc/apt/sources_backup"
    echo "推荐国内镜像网站："
    echo "https://developer.aliyun.com/mirror/"
    echo "https://mirrors.tuna.tsinghua.edu.cn/"
    echo "http://mirrors.163.com/"
    sudo apt-get update
else
    if [ -f "/etc/apt/sources_backup/sources.list" ]; then
        if [ -f "/etc/apt/sources.list" ]; then
            sudo rm -rf /etc/apt/sources.list
        fi
        sudo mv /etc/apt/sources_backup/sources.list /etc/apt/sources.list
        sudo rm -rf /etc/apt/sources_backup
        echo "已经恢复原始sources.list"
        echo "通过命令cd /etc/apt/;ls;vim sources.list查看"
        sudo apt-get update
    fi
fi
