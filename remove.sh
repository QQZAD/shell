#!/bin/bash
# 卸载无用的软件包
echo "卸载firefox..."
dpkg --get-selections|grep firefox
echo "sudo apt-get remove --purge"
