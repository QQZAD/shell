#!/bin/bash
# 在Ubuntu和Windows双系统中存在时间显示不正确的问题，该脚本旨在解决该问题
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
echo "已经成功同步时间"
