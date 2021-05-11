#!/bin/bash
DIR=${HOME}/Qemu
if [ ! -f "$DIR/qemu.tar" ]; then
	echo "$DIR/qemu.tar不存在！"
	exit
fi
if [ ! -f "$DIR/meson.tar" ]; then
	echo "$DIR/meson.tar不存在！"
	exit
fi
if [ ! -f "$DIR/u-boot.tar" ]; then
	echo "$DIR/u-boot.tar不存在！"
	exit
fi
cd $DIR
echo "tar -xf qemu.tar"
tar -xf qemu.tar
rm -rf 'qemu.tar'
echo "tar -xf meson.tar"
tar -xf meson.tar
rm -rf 'meson.tar'
echo "tar -xf u-boot.tar"
tar -xf u-boot.tar
rm -rf 'u-boot.tar'
echo "cd qemu;git pull"
cd qemu
git pull
git pull
git pull
cd ..
echo "cd meson;git pull"
cd meson
git pull
git pull
git pull
cd ..
echo "cd u-boot;git pull"
cd u-boot
git pull
git pull
git pull
cd ..
echo "tar -zcf 'qemu.tar' 'qemu'"
tar -zcf 'qemu.tar' 'qemu'
rm -rf 'qemu'
echo "tar -zcf 'meson.tar' 'meson'"
tar -zcf 'meson.tar' 'meson'
rm -rf 'meson'
echo "tar -zcf 'u-boot.tar' 'u-boot'"
tar -zcf 'u-boot.tar' 'u-boot'
rm -rf 'u-boot'
