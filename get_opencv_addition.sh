#!/bin/bash
echo "清注意：该脚本必须在VPN连接下执行！"
sudo apt-get install wget -y
sudo apt-get install zip -y
if [ -d "opencv_addition" ]
then
	sudo rm -rf opencv_addition
fi
mkdir opencv_addition
cd opencv_addition

# opencv/3rdparty/ippicv/ippicv.cmake
IPPICV_COMMIT=a56b6ac6f030c312b2dce17430eef13aed9af274
OPENCV_ICV_NAME=ippicv_2020_lnx_intel64_20191018_general.tgz
wget -t 0 https://raw.githubusercontent.com/opencv/opencv_3rdparty/$IPPICV_COMMIT/ippicv/$OPENCV_ICV_NAME

# opencv_contrib/modules/face/CMakeLists.txt
__commit_hash=8afa57abc8229d611c4937165d20e2a2d9fc5a12
wget -t 0 https://raw.githubusercontent.com/opencv/opencv_3rdparty/${__commit_hash}/face_landmark_model.dat

# opencv_contrib/modules/xfeatures2d/cmake/download_boostdesc.cmake
mkdir download_boostdesc
cd download_boostdesc
OPENCV_3RDPARTY_COMMIT1=34e4206aef44d50e6bbcd0ab06354b52e7466d26
name_BGM=boostdesc_bgm.i
name_BGM_BI=boostdesc_bgm_bi.i
name_BGM_HD=boostdesc_bgm_hd.i
name_BINBOOST_064=boostdesc_binboost_064.i
name_BINBOOST_128=boostdesc_binboost_128.i
name_BINBOOST_256=boostdesc_binboost_256.i
name_LBGM=boostdesc_lbgm.i
name1=($name_BGM $name_BGM_BI $name_BGM_HD $name_BINBOOST_064 $name_BINBOOST_128 $name_BINBOOST_256 $name_LBGM)
for i in {0..6}
do
	wget -t 0 https://raw.githubusercontent.com/opencv/opencv_3rdparty/$OPENCV_3RDPARTY_COMMIT1/${name1[i]}
done
cd ..

# opencv_contrib/modules/xfeatures2d/cmake/download_vgg.cmake
mkdir download_vgg
cd download_vgg
OPENCV_3RDPARTY_COMMIT2=fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d
name_VGG_48=vgg_generated_48.i
name_VGG_64=vgg_generated_64.i
name_VGG_80=vgg_generated_80.i
name_VGG_120=vgg_generated_120.i
name2=($name_VGG_48 $name_VGG_64 $name_VGG_80 $name_VGG_120)
for i in {0..3}
do
	wget -t 0 https://raw.githubusercontent.com/opencv/opencv_3rdparty/$OPENCV_3RDPARTY_COMMIT2/${name2[i]}
done
cd ..

cd ..
zip -q -r opencv_addition.zip opencv_addition
rm -rf opencv_addition
echo "已经成功生成opencv_addition.zip"
