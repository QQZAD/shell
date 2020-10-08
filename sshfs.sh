#!/bin/bash
#./sshfs.sh	安装必备软件包
#./sshfs.sh s 1	作为服务器端启动
#./sshfs.sh s 0	服务器端停止
#./sshfs.sh c 1	作为客户端启动
#./sshfs.sh c 0	客户端停止
server_NIC=wlp2s0 #服务器网卡名
server_user=zad #服务器用户名
dir=share #共享目录名
server_IP=172.27.55.126 #服务器IPv4地址
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
            sudo echo -e "\e[31m[3]在sshfs.sh中正确设置服务器网卡名、服务器用户名、共享目录名\e[0m"
            read -p "若条件满足请按回车键继续..."
            sudo ufw allow ssh
            sudo service ssh start
            if [ ! -d "${HOME}/$dir" ]
            then
                mkdir ${HOME}/$dir
            fi
            inet=$(ifconfig|grep -A 1 "$server_NIC")
            OLD_IFS="$IFS"
            IFS=" "
            inets=($inet)
            IFS="$OLD_IFS"
            let "i=0"
            for var in ${inets[@]}
            do
                if [ $var == "inet" ]
                then
                    break
                fi
                let "i=i+1"
            done
            let "i=i+1"
            server_IP=${inets[$i]}
            echo "服务器端的IPv4地址："
            echo $server_IP
            sudo echo -e "\e[31m[4]在sshfs.sh中正确设置服务器IPv4地址\e[0m"
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
