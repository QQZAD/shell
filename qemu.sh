#!/bin/bash
echo "https://git.qemu.org/git/qemu"
cd ${HOME}
if [ ! -f "qemu.tar" ]
then
	echo "在主目录下没有找到qemu.tar"
	exit
fi
tar -zxf qemu.tar
rm -rf qemu.tar
cd qemu
git pull
cd ..
tar -zcf qemu.tar qemu
rm -rf qemu