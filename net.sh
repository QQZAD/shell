#!/bin/bash
ifconfig
lspci|grep -i net
sudo /etc/init.d/networking restart
