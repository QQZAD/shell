#!/bin/bash
sudo apt-get install python3 python3-dev python3-pip -y
pip3 install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
pip3 install numpy -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
pip3 install matplotlib -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
pip3 install scipy -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
if [ ! -f "wincorefonts.zip" ]
then
    echo "在shell/中没有找到wincorefonts.zip文件，将不会安装字体"
else
    echo "正在安装Windows系统目录C:\Windows\Fonts中扩展名为.ttf或.TTF的字体"
    sudo apt-get install unzip
    sudo apt-get install fontconfig
    if [ ! -d "wincorefonts/" ]
    then
        unzip wincorefonts.zip
    fi
    if [ -d "/usr/share/fonts/truetype/wincorefonts/" ]
    then
        sudo rm -rf /usr/share/fonts/truetype/wincorefonts/
    fi
    sudo mv wincorefonts/ /usr/share/fonts/truetype/
    echo "fc-cache -f"
    fc-cache -f
    sudo rm -rf ${HOME}/.cache/matplotlib
    echo "已经成功安装以下字体"
    ls /usr/share/fonts/truetype/wincorefonts/
fi
echo
echo "python2代码开头一般添加"
echo "#!/usr/bin/python"
echo "# -*- coding:utf-8 -*-"
echo "python3代码开头一般添加"
echo "#!/usr/bin/python3"
echo "# -*- coding:utf-8 -*-"
echo "main函数"
echo "if __name__=='__main__':"
echo
echo "[问题1]"
echo "AttributeError: module 'tensorflow._api.v2.config' has no attribute 'experimental_list_devices'"
echo "打开site-packages\keras\backend\tensorflow_backend.py"
echo "将"
echo "_LOCAL_DEVICES = tf.config.experimental_list_devices()"
echo "修改为"
echo "devices = tf.config.list_logical_devices()"
echo "_LOCAL_DEVICES = [x.name for x in devices]"
