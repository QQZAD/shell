#!/bin/bash
Cur_Dir=$(pwd)
ver=8.44
ver2=10.36

if [ ! -f "./pcre-$ver.tar.gz" ]; then
	echo "正在从网络获取pcre-$ver.tar.gz"
	wget https://ftp.pcre.org/pub/pcre/pcre-$ver.tar.gz
else
	echo "已经获取本地pcre-$ver.tar.gz"
fi
tar -zxvf pcre-$ver.tar.gz
cd pcre-$ver
sudo ./configure
sudo make
sudo make install
cd $Cur_Dir
sudo rm -rf pcre-$ver

if [ ! -f "./pcre2-$ver2.tar.gz" ]; then
	echo "正在从网络获取pcre2-$ver2.tar.gz"
	wget https://ftp.pcre.org/pub/pcre/pcre2-$ver2.tar.gz
else
	echo "已经获取本地pcre2-$ver2.tar.gz"
fi
tar -zxvf pcre2-$ver2.tar.gz
cd pcre2-$ver2
sudo ./configure
sudo make
sudo make install
cd $Cur_Dir
sudo rm -rf pcre2-$ver2
echo
echo -e "\e[32mpcre-config --version\e[0m"
pcre-config --version
echo -e "\e[32mpcre2-config --version\e[0m"
pcre2-config --version
