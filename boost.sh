#!/bin/bash
echo "https://www.boost.org/"
echo "https://www.boost.org/doc/libs/1_74_0/doc/html/thread.html"
read -p "按回车键继续..."
name=boost_1_74_0
if [ ! -f "$name.tar.gz" ]
then
    echo "在shell/中没有找到$name.tar.gz文件"
    exit
fi
tar -zxf $name.tar.gz
cd $name
./bootstrap.sh
sudo ./b2 install
sudo ldconfig
sudo rm -rf $name