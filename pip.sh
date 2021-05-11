#!/bin/bash

#scr
url1=http://mirrors.aliyun.com/pypi/simple/
url2=https://pypi.tuna.tsinghua.edu.cn/simple/
url3=http://pypi.douban.com/simple/

if [ ! -d "${HOME}/.pip" ]; then
    sudo mkdir ${HOME}/.pip
    echo "成功创建.pip文件夹"
else
    echo "已经找到.pip文件夹"
fi

if [ -f "${HOME}/.pip/pip.conf" ]; then
    sudo rm -rf ${HOME}/.pip/pip.conf
fi
sudo touch ${HOME}/.pip/pip.conf
sudo chown ${USER}: -R ${HOME}/.pip/

sudo apt-get install curl

read -p "是否测试国内源的下载速度？y/n：" answer
case $answer in
y)
    curl -o /dev/null -s -w "1.阿里云	下载速度:"%{speed_download}"\n" "$url1"
    curl -o /dev/null -s -w "2.清华大学	下载速度:"%{speed_download}"\n" "$url2"
    curl -o /dev/null -s -w "3.豆瓣		下载速度:"%{speed_download}"\n" "$url3"
    ;;
n)
    echo "1.阿里云"
    echo "2.清华大学"
    echo "3.豆瓣"
    ;;
*)
    echo "输入错误,已跳过速度测试"
    echo "1.阿里云"
    echo "2.清华大学"
    echo "3.豆瓣"
    ;;
esac

read -p "为pip/pip3选择国内源：" num
case $num in
1)
    echo "[global]" >>${HOME}/.pip/pip.conf
    echo "index-url = $url1" >>${HOME}/.pip/pip.conf
    echo "[install]" >>${HOME}/.pip/pip.conf
    echo "trusted-host = mirrors.aliyun.com" >>${HOME}/.pip/pip.conf
    echo "已选择阿里云"
    ;;
2)
    echo "[global]" >>${HOME}/.pip/pip.conf
    echo "index-url = $url2" >>${HOME}/.pip/pip.conf
    echo "[install]" >>${HOME}/.pip/pip.conf
    echo "trusted-host = pypi.tuna.tsinghua.edu.cn" >>${HOME}/.pip/pip.conf
    echo "已选择清华大学"
    ;;
3)
    echo "[global]" >>${HOME}/.pip/pip.conf
    echo "index-url = $url3" >>${HOME}/.pip/pip.conf
    echo "[install]" >>${HOME}/.pip/pip.conf
    echo "trusted-host = pypi.douban.com" >>${HOME}/.pip/pip.conf
    echo "已选择豆瓣"
    ;;
*)
    echo "输入错误,已选择默认源1"
    echo "[global]" >>${HOME}/.pip/pip.conf
    echo "index-url = $url1" >>${HOME}/.pip/pip.conf
    echo "[install]" >>${HOME}/.pip/pip.conf
    echo "trusted-host = mirrors.aliyun.com" >>${HOME}/.pip/pip.conf
    ;;
esac
echo "成功创建pip.conf"
