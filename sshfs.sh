#!/bin/bash
#./sshfs.sh	安装必备软件包
#./sshfs.sh s 1	作为服务器端启动
#./sshfs.sh s 0	服务器端停止
#./sshfs.sh c 1	作为客户端启动
#./sshfs.sh c 0	客户端停止
server_user=zad #服务器用户名
server_IP=172.17.0.1 #服务器IPv4地址
dir=share #共享目录
error=1
if [ -n "$1" ] && [ -n "$2" ]
then
	if [ $1 == "s" ] || [ $1 == "S" ]
	then
		if [ $2 == "1" ]
		then
			error=0
			sudo echo -e "\e[34m以服务器端启动：\e[0m"
			sudo echo -e "\e[31m[1]确保你和客户端共处一个局域网下\e[0m"
			sudo echo -e "\e[31m[2]若在虚拟机中需要修改网络为桥接模式\e[0m"
			read -p "若条件满足请按回车键继续..."
			sudo ufw allow ssh
			sudo service ssh start
			if [ ! -d "${HOME}/$dir" ]
			then
				mkdir ${HOME}/$dir
			fi
			inet=$(ifconfig|grep -E "broadcast|广播")
			OLD_IFS="$IFS"
			IFS=" "
			inets_=($inet)
			IFS="$OLD_IFS"
			OLD_IFS="$IFS"
			IFS=":"
			inets=(${inets_[1]})
			IFS="$OLD_IFS"
			if [ ${inets[0]} == "地址" ]
			then
				server_IP=${inets[1]}
			else
				server_IP=${inets[0]}
			fi
			echo "服务器端的IPv4地址："
			echo $server_IP	
		elif [ $2 == "0" ]
		then
			error=0
			sudo echo -e "\e[34m服务器端停止\e[0m"
			sudo service ssh stop
		fi
	elif [ $1 == "c" ] || [ $1 == "C" ]
	then
		if [ $2 == "1" ]
		then
			error=0
			sudo echo -e "\e[34m以客户端启动：\e[0m"
			sudo echo -e "\e[31m[1]确保你和服务器端共处一个局域网下\e[0m"
			sudo echo -e "\e[31m[2]若在虚拟机中需要修改网络为桥接模式\e[0m"
			read -p "若条件满足请按回车键继续..."
			if [ ! -d "${HOME}/$dir" ]
			then
				mkdir ${HOME}/$dir
			fi
			sshfs $server_user@$server_IP:/home/$server_user/$dir ${HOME}/$dir
		elif [ $2 == "0" ]
		then
			error=0
			sudo echo -e "\e[34m客户端停止\e[0m"
			sudo umount -f ${HOME}/$dir
			sudo rm -rf ${HOME}/$dir
		fi
	fi
elif [ ! -n "$1" ] && [ ! -n "$2" ]
then
	error=0
	sudo apt-get install openssh-client -y
	sudo apt-get install openssh-server -y
	sudo apt-get install sshfs -y
fi
if [ $error == "1" ]
then
	echo "./sshfs.sh	安装必备软件包"
	echo "./sshfs.sh s 1	作为服务器端启动"
	echo "./sshfs.sh s 0	服务器端停止"
	echo "./sshfs.sh c 1	作为客户端启动"
	echo "./sshfs.sh c 0	客户端停止"
	exit
fi
