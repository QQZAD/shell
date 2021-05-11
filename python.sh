#!/bin/bash
sudo apt-get install python3 python3-dev python3-pip -y
pip3 install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
pip3 install numpy matplotlib scipy -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
pip3 install autopep8 pep8 pycodestyle toml -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
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
