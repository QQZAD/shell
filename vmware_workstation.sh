#!/bin/bash
version=16
echo "正在检查VMware Workstation $version的配置"
mokutil --test-key ${HOME}/.vmware/VMWARE$version.der
read -p "按回车键继续..."
sudo vmware-modconfig --console --install-all
cd ${HOME}/.vmware
openssl req -new -x509 -newkey rsa:2048 -keyout VMWARE$version.priv -outform DER -out VMWARE$version.der -nodes -days 36500 -subj "/CN=VMWARE/"
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE$version.priv ./VMWARE$version.der $(modinfo -n vmmon)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE$version.priv ./VMWARE$version.der $(modinfo -n vmnet)
tail $(modinfo -n vmmon) | grep "Module signature appended"
echo "密码123456"
echo "输入密码后系统将重启"
sudo mokutil --import VMWARE$version.der
reboot