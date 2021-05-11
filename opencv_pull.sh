#!/bin/bash
DIR=${HOME}/Opencv
if [ ! -f "$DIR/opencv.tar" ]; then
	echo "$DIR/opencv.tar不存在！"
	exit
fi
if [ ! -f "$DIR/opencv_contrib.tar" ]; then
	echo "$DIR/opencv_contrib.tar不存在！"
	exit
fi
if [ ! -f "$DIR/opencv_extra.tar" ]; then
	echo "$DIR/opencv_extra.tar不存在！"
	exit
fi
cd $DIR
echo "tar -xf opencv.tar"
tar -xf opencv.tar
rm -rf 'opencv.tar'
echo "tar -xf opencv_contrib.tar"
tar -xf opencv_contrib.tar
rm -rf 'opencv_contrib.tar'
echo "tar -xf opencv_extra.tar"
tar -xf opencv_extra.tar
rm -rf 'opencv_extra.tar'
echo "cd opencv;git pull"
cd opencv
git pull
git pull
git pull
cd ..
echo "cd opencv_contrib;git pull"
cd opencv_contrib
git pull
git pull
git pull
cd ..
echo "cd opencv_extra;git pull"
cd opencv_extra
git pull
git pull
git pull
cd ..
echo "tar -zcf 'opencv.tar' 'opencv'"
tar -zcf 'opencv.tar' 'opencv'
rm -rf 'opencv'
echo "tar -zcf 'opencv_contrib.tar' 'opencv_contrib'"
tar -zcf 'opencv_contrib.tar' 'opencv_contrib'
rm -rf 'opencv_contrib'
echo "tar -zcf 'opencv_extra.tar' 'opencv_extra'"
tar -zcf 'opencv_extra.tar' 'opencv_extra'
rm -rf 'opencv_extra'
