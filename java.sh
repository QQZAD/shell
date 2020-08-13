#!/bin/bash
option=1
# 1 to install, 0 to uninstall
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
	sudo echo "安装java..."
	sudo apt install default-jdk -y
	sudo apt install default-jre -y
	echo "java -version"
	java -version
	echo "javac -version"
	javac -version
	echo "简要说明："
	echo "[1]gedit filename.java"
	echo "[2]javac filename.java"
	echo "[3]java filename"
else
	sudo echo "卸载java..."
	sudo apt-get --purge remove default-jdk -y
	sudo apt-get --purge remove default-jre -y
	sudo apt autoremove -y
fi
