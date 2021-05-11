#!/bin/bash
#./vnc.sh 1	安装必备软件包
#./vnc.sh 0	卸载必备软件包
#./vnc.sh s 1	作为服务器端启动
#./vnc.sh s 0	服务器端停止
#./vnc.sh c	运行客户端
server_user=zad         #服务器用户名
server_IP=192.168.0.104 #服务器IPv4地址
server_passwd=123       #服务器VNC密码
error=1
platform=1
#0表示Linux，1表示Raspbian Pi
if [ -n "$1" ] && [ -n "$2" ]; then
	if [ $1 == "s" ] || [ $1 == "S" ]; then
		if [ $2 == "1" ]; then
			error=0
			sudo echo -e "\e[34m以服务器端启动：\e[0m"
			sudo echo -e "\e[31m[1]确保你和客户端共处一个局域网下\e[0m"
			sudo echo -e "\e[31m[2]若在虚拟机中需要修改网络为桥接模式\e[0m"
			read -p "若条件满足请按回车键继续..."
			inet=$(ifconfig | grep -E "broadcast|广播")
			OLD_IFS="$IFS"
			IFS=" "
			inets_=($inet)
			IFS="$OLD_IFS"
			OLD_IFS="$IFS"
			IFS=":"
			inets=(${inets_[1]})
			IFS="$OLD_IFS"
			if [ ${inets[0]} == "地址" ]; then
				server_IP=${inets[1]}
			else
				server_IP=${inets[0]}
			fi
			echo "服务器端的IPv4地址："
			echo $server_IP
			sudo ufw disable
			sudo x11vnc -forever -shared -rfbauth ${HOME}/.vnc/passwd -ncache 25
			sudo ufw enable
		elif [ $2 == "0" ]; then
			error=0
			sudo echo -e "\e[34m服务器端停止\e[0m"
			echo "在终端执行Ctrl+C以停止VNC服务"
		fi
	fi
elif [ -n "$1" ] && [ ! -n "$2" ]; then
	if [ $1 == "1" ]; then
		error=0
		sudo apt-get install x11vnc -y
		x11vnc -storepasswd
		# https://www.realvnc.com/download/viewer/linux/
		if [ $platform -eq 0 ]; then
			VNC_Viewer=VNC-Viewer-6.20.113-Linux-x64.deb
		elif [ $platform -eq 1 ]; then
			VNC_Viewer=VNC-Viewer-6.20.113-Linux-ARM.deb
		fi
		if [ ! -f "$VNC_Viewer" ]; then
			wget --no-check-certificate https://www.realvnc.com/download/file/viewer.files/$VNC_Viewer
		fi
		sudo dpkg -i $VNC_Viewer
		sudo apt-get -y install -f
	elif [ $1 == "0" ]; then
		error=0
		sudo apt-get --purge remove x11vnc -y
		sudo dpkg --purge realvnc-vnc-viewer
		sudo apt autoremove -y
	elif [ $1 == "c" ] || [ $1 == "C" ]; then
		error=0
		sudo echo "服务器的VNC密码："
		echo $server_passwd
		vncviewer $server_IP
	fi
fi
if [ $error == "1" ]; then
	echo "./vnc.sh 1	安装必备软件包"
	echo "./vnc.sh 0	安装必备软件包"
	echo "./vnc.sh s 1	作为服务器端启动"
	echo "./vnc.sh s 0	服务器端停止"
	echo "./vnc.sh c	运行客户端"
	exit
fi
