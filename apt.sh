#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
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
	echo "正在利用清华源更新sources.list..."
	if [ ! -d "/etc/apt/sources_backup" ]
	then
		sudo mkdir /etc/apt/sources_backup
		sudo mv /etc/apt/sources.list /etc/apt/sources_backup
		sudo chown ${USER}: -R /etc/apt/sources_backup
	fi
	sudo touch /etc/apt/sources.list
	sudo chown ${USER}: -R /etc/apt/sources.list
	release_num=$(lsb_release -r --short)
	case "$release_num" in
	    "18.04")
cat > /etc/apt/sources.list << END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
END_TEXT
	    ;;
	    "16.04")
cat > /etc/apt/sources.list << END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
END_TEXT
	    ;;
	    "14.04")
cat > /etc/apt/sources.list << END_TEXT
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse
END_TEXT
	    ;;
	    *)
		exit
	    ;;
	esac
	echo "已经将原始sources.list备份至/etc/apt/sources_backup"
	echo "推荐国内镜像网站："
	echo "https://developer.aliyun.com/mirror/"
	echo "https://mirrors.tuna.tsinghua.edu.cn/"
	echo "http://mirrors.163.com/"
else
	if [ -f "/etc/apt/sources_backup/sources.list" ]
	then
		sudo chown ${USER}: -R /etc/apt/sources_backup
		if [ -f "/etc/apt/sources.list" ]
		then
			sudo rm -rf /etc/apt/sources.list
		fi
		sudo mv /etc/apt/sources_backup/sources.list /etc/apt/sources.list
		sudo chown ${USER}: -R /etc/apt/sources.list
		sudo rm -rf /etc/apt/sources_backup
		echo "已经恢复原始sources.list"
	fi
fi
