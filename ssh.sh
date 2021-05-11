#!/bin/bash
#./ssh.sh	安装必备软件包
#./ssh.sh s 1	作为服务器端启动
#./ssh.sh s 0	服务器端停止
#./ssh.sh c 1	作为客户端启动
#./ssh.sh c 0	客户端停止
server_user=${USER}     #服务器用户名
server_IP=172.27.17.148 #服务器IPv4地址
error=1
if [ -n "$1" ] && [ -n "$2" ]; then
	if [ $1 == "s" ] || [ $1 == "S" ]; then
		if [ $2 == "1" ]; then
			error=0
			sudo echo -e "\e[34m以服务器端启动：\e[0m"
			sudo echo -e "\e[31m[1]确保你和客户端共处一个局域网下\e[0m"
			sudo echo -e "\e[31m[2]若在虚拟机中需要修改网络为桥接模式\e[0m"
			read -p "若条件满足请按回车键继续..."
			sudo ufw allow ssh
			sudo dpkg-reconfigure openssh-server
			sudo service ssh start
			ps -e | grep ssh
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
			echo "服务器端用户名："
			echo $server_user
			echo "服务器端IPv4地址："
			#echo $server_IP
			ifconfig
		elif [ $2 == "0" ]; then
			error=0
			sudo echo -e "\e[34m服务器端停止\e[0m"
			sudo service ssh stop
			ps -e | grep ssh
		fi
	elif [ $1 == "c" ] || [ $1 == "C" ]; then
		if [ $2 == "1" ]; then
			error=0
			sudo echo -e "\e[34m以客户端启动：\e[0m"
			sudo echo -e "\e[31m[1]确保你和服务器端共处一个局域网下\e[0m"
			sudo echo -e "\e[31m[2]若在虚拟机中需要修改网络为桥接模式\e[0m"
			read -p "若条件满足请按回车键继续..."
			ssh $server_user@$server_IP
		elif [ $2 == "0" ]; then
			error=0
			sudo echo "在ssh终端中执行exit命令或者直接关闭ssh终端以停止客户端"
		fi
	fi
elif [ ! -n "$1" ] && [ ! -n "$2" ]; then
	error=0
	sudo apt-get install openssh-client -y
	sudo apt-get install openssh-server -y
fi
if [ $error == "1" ]; then
	echo "./ssh.sh	安装必备软件包"
	echo "./ssh.sh s 1	作为服务器端启动"
	echo "./ssh.sh s 0	服务器端停止"
	echo "./ssh.sh c 1	作为客户端启动"
	echo "./ssh.sh c 0	客户端停止"
	exit
fi
