#!/bin/bash
echo "服务器安装Ubuntu18会出现错误"
echo "服务器断电维护"
echo "sudo ifconfig enp0s31f6 up"
echo "sudo dhclient -r -v enp0s31f6 && rm /var/lib/dhcp/dhclient.* ;sudo dhclient -v enp0s31f6"
