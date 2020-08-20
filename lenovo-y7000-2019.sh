#!/bin/bash
echo "在Windows中关闭Bios设置的快速启动：Windows设置 → 系统 → 电池与睡眠 → 其他电源设置 → 选择电源按钮的功能 → 更改当前不可更改的设置"
echo "重启电脑，在开机界面多按几次F2，直到进入Bios"
echo "方向键移动到Security，再移动到Secure Boot上，点击回车键，选择Disabled，回车键"
echo "方向键移动到configuration，将Graphic Device的选项改为Switchable Graphic"
echo "方向键移动到Boot，将USB Boot改为Enabled"
echo "方向键移动到configuration → storage → controller Mode改为AHCL，然后按F10保存退出"
echo "重启时在开机界面多按几次F12，直到进入Bios，选择U盘启动项"
# 在Ubuntu和Windows双系统中存在时间显示不正确的问题，该脚本旨在解决该问题
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
echo "已经成功同步时间"