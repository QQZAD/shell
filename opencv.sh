#!/bin/bash
curr=$(pwd)
option=1
# 1 to install, 0 to uninstall
if [ -n "$1" ]; then
	if [ $1 -eq "1" ]
	then
		option=1
	else
		option=0
	fi
fi
if [ $option -eq 1 ]
then
	sudo echo "安装OpenCV..."
	parallel=4
	echo "并行编译可以加快编译的速度，逻辑任务线程数量默认设置为4，对于CPU性能更强且内存更大的机器可以设置为5-8等，注意内存不大的机器将该值设置较高可能会出现错误："
	echo "c++: internal compiler error: 已杀死 (program cc1plus)"
	while :
	do
		read -p "输入你期望的值（建议默认值）：" option
		if [ $option -lt 3 ]
		then
		 	echo "过小"
		else
			if [ $option -gt 8 ]
			then
				echo "过大"
			else
				break
			fi
		fi
	done
	# git clone https://github.com/opencv/opencv.git
	if [ ! -d "opencv" ] && [ ! -f "opencv.zip" ]
	then
		echo "没有找到opencv或opencv.zip，已结束"
		exit
	fi
	# git clone https://github.com/opencv/opencv_contrib.git
	if [ ! -f "opencv_contrib.zip" ]
	then
		echo "没有找到opencv_contrib.zip，已结束"
		exit
	fi
	# ./get_opencv_addition.sh
	if [ ! -f "opencv_addition.zip" ]
	then
		echo "没有找到opencv_addition.zip，已结束"
		exit
	fi
	# git clone https://github.com/opencv/opencv_extra.git
	if [ ! -f "opencv_extra.zip" ]
	then
		echo "没有找到opencv_extra.zip，已结束"
		exit
	fi
	sudo apt-get install pkg-config make cmake git -y
	sudo apt-get install build-essential -y
	sudo apt-get install libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev -y
	sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev -y
	sudo apt-get install libcanberra-gtk-module -y
	judge=$(grep -c "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" /etc/apt/sources.list)
	if [ $judge -eq "0" ]
	then
		sudo add-apt-repository "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse"
	fi	
	sudo apt-get install libjasper-dev -y
	if [ ! -d "opencv" ]
	then
		unzip opencv.zip
	fi
	unzip opencv_contrib.zip
	unzip opencv_addition.zip
	OPENCV_ICV_NAME=ippicv_2020_lnx_intel64_20191018_general.tgz
	cp opencv_addition/$OPENCV_ICV_NAME opencv/3rdparty/ippicv/$OPENCV_ICV_NAME
	cp opencv_addition/face_landmark_model.dat opencv_contrib/modules/face/face_landmark_model.dat
	cp -r opencv_addition/download_boostdesc opencv_contrib/
	cp -r opencv_addition/download_vgg opencv_contrib/
	rm -rf opencv_addition	
cat > opencv/3rdparty/ippicv/ippicv.cmake << END_TEXT
function(download_ippicv root_var)
  set(\${root_var} "" PARENT_SCOPE)

  # Commit SHA in the opencv_3rdparty repo
  set(IPPICV_COMMIT "a56b6ac6f030c312b2dce17430eef13aed9af274")
  # Define actual ICV versions
  if(APPLE)
    set(OPENCV_ICV_PLATFORM "macosx")
    set(OPENCV_ICV_PACKAGE_SUBDIR "ippicv_mac")
    set(OPENCV_ICV_NAME "ippicv_2020_mac_intel64_20191018_general.tgz")
    set(OPENCV_ICV_HASH "1c3d675c2a2395d094d523024896e01b")
  elseif((UNIX AND NOT ANDROID) OR (UNIX AND ANDROID_ABI MATCHES "x86"))
    set(OPENCV_ICV_PLATFORM "linux")
    set(OPENCV_ICV_PACKAGE_SUBDIR "ippicv_lnx")
    if(X86_64)
      set(OPENCV_ICV_NAME "ippicv_2020_lnx_intel64_20191018_general.tgz")
      set(OPENCV_ICV_HASH "7421de0095c7a39162ae13a6098782f9")
    else()
      set(OPENCV_ICV_NAME "ippicv_2020_lnx_ia32_20191018_general.tgz")
      set(OPENCV_ICV_HASH "ad189a940fb60eb71f291321322fe3e8")
    endif()
  elseif(WIN32 AND NOT ARM)
    set(OPENCV_ICV_PLATFORM "windows")
    set(OPENCV_ICV_PACKAGE_SUBDIR "ippicv_win")
    if(X86_64)
      set(OPENCV_ICV_NAME "ippicv_2020_win_intel64_20191018_general.zip")
      set(OPENCV_ICV_HASH "879741a7946b814455eee6c6ffde2984")
    else()
      set(OPENCV_ICV_NAME "ippicv_2020_win_ia32_20191018_general.zip")
      set(OPENCV_ICV_HASH "cd39bdf0c2e1cac9a61101dad7a2413e")
    endif()
  else()
    return()
  endif()

  set(THE_ROOT "\${OpenCV_BINARY_DIR}/3rdparty/ippicv")
  ocv_download(FILENAME \${OPENCV_ICV_NAME}
               HASH \${OPENCV_ICV_HASH}
               URL
                 "\${OPENCV_IPPICV_URL}"
                 "\$ENV{OPENCV_IPPICV_URL}"
                 "file://\${OpenCV_BINARY_DIR}/../3rdparty/ippicv/"
               DESTINATION_DIR "\${THE_ROOT}"
               ID IPPICV
               STATUS res
               UNPACK RELATIVE_URL)

  if(res)
    set(\${root_var} "\${THE_ROOT}/\${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE)
  endif()
endfunction()
END_TEXT
cat > opencv_contrib/modules/face/CMakeLists.txt << END_TEXT
set(the_description "Face recognition etc")
ocv_define_module(face opencv_core
    opencv_imgproc
    opencv_objdetect
    opencv_calib3d   # estimateAffinePartial2D() (trainFacemark)
    opencv_photo     # seamlessClone() (face_swap sample)
    WRAP python java
)
# NOTE: objdetect module is needed for one of the samples

set(__commit_hash "8afa57abc8229d611c4937165d20e2a2d9fc5a12")
set(__file_hash "7505c44ca4eb54b4ab1e4777cb96ac05")
ocv_download(
    FILENAME face_landmark_model.dat
    HASH \${__file_hash}
    URL
      "\${OPENCV_FACE_ALIGNMENT_URL}"
      "\$ENV{OPENCV_FACE_ALIGNMENT_URL}"
      "file://\${CMAKE_CURRENT_SOURCE_DIR}/"
    DESTINATION_DIR "\${CMAKE_BINARY_DIR}/\${OPENCV_TEST_DATA_INSTALL_PATH}/cv/face/"
    ID "data"
    RELATIVE_URL
    STATUS res
)
if(NOT res)
  message(WARNING "Face: Can't get model file for face alignment.")
endif()
END_TEXT
cat > opencv_contrib/modules/xfeatures2d/cmake/download_boostdesc.cmake << END_TEXT
function(download_boost_descriptors dst_dir status_var)
  set(OPENCV_3RDPARTY_COMMIT "34e4206aef44d50e6bbcd0ab06354b52e7466d26")

  set(ids BGM BGM_BI BGM_HD BINBOOST_064 BINBOOST_128 BINBOOST_256 LBGM)
  set(name_BGM boostdesc_bgm.i)
  set(name_BGM_BI boostdesc_bgm_bi.i)
  set(name_BGM_HD boostdesc_bgm_hd.i)
  set(name_BINBOOST_064 boostdesc_binboost_064.i)
  set(name_BINBOOST_128 boostdesc_binboost_128.i)
  set(name_BINBOOST_256 boostdesc_binboost_256.i)
  set(name_LBGM boostdesc_lbgm.i)
  set(hash_BGM "0ea90e7a8f3f7876d450e4149c97c74f")
  set(hash_BGM_BI "232c966b13651bd0e46a1497b0852191")
  set(hash_BGM_HD "324426a24fa56ad9c5b8e3e0b3e5303e")
  set(hash_BINBOOST_064 "202e1b3e9fec871b04da31f7f016679f")
  set(hash_BINBOOST_128 "98ea99d399965c03d555cef3ea502a0b")
  set(hash_BINBOOST_256 "e6dcfa9f647779eb1ce446a8d759b6ea")
  set(hash_LBGM "0ae0675534aa318d9668f2a179c2a052")

  set(\${status_var} TRUE PARENT_SCOPE)
  foreach(id \${ids})
    ocv_download(FILENAME \${name_\${id}}
                 HASH \${hash_\${id}}
                 URL
                   "\${OPENCV_BOOSTDESC_URL}"
                   "\$ENV{OPENCV_BOOSTDESC_URL}"
                   "file://\${CMAKE_CURRENT_SOURCE_DIR}/../../download_boostdesc/"
                 DESTINATION_DIR \${dst_dir}
                 ID "xfeatures2d/boostdesc"
                 RELATIVE_URL
                 STATUS res)
    if(NOT res)
      set(\${status_var} FALSE PARENT_SCOPE)
    endif()
  endforeach()
endfunction()
END_TEXT
cat > opencv_contrib/modules/xfeatures2d/cmake/download_vgg.cmake << END_TEXT
function(download_vgg_descriptors dst_dir status_var)
  set(OPENCV_3RDPARTY_COMMIT "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d")

  set(ids VGG_48 VGG_64 VGG_80 VGG_120)
  set(name_VGG_48 "vgg_generated_48.i")
  set(name_VGG_64 "vgg_generated_64.i")
  set(name_VGG_80 "vgg_generated_80.i")
  set(name_VGG_120 "vgg_generated_120.i")
  set(hash_VGG_48 "e8d0dcd54d1bcfdc29203d011a797179")
  set(hash_VGG_64 "7126a5d9a8884ebca5aea5d63d677225")
  set(hash_VGG_80 "7cd47228edec52b6d82f46511af325c5")
  set(hash_VGG_120 "151805e03568c9f490a5e3a872777b75")

  set(\${status_var} TRUE PARENT_SCOPE)
  foreach(id \${ids})
    ocv_download(FILENAME \${name_\${id}}
                 HASH \${hash_\${id}}
                 URL
                   "\${OPENCV_VGGDESC_URL}"
                   "\$ENV{OPENCV_VGGDESC_URL}"
                   "file://\${CMAKE_CURRENT_SOURCE_DIR}/../../download_vgg/"
                 DESTINATION_DIR "\${dst_dir}"
                 ID "xfeatures2d/vgg"
                 RELATIVE_URL
                 STATUS res)
    if(NOT res)
      set(\${status_var} FALSE PARENT_SCOPE)
    endif()
  endforeach()
endfunction()
END_TEXT
	cd opencv
	if [ ! -d "build" ]
	then
		mkdir build
	fi
	cd build
	# 这里的build就是opencv/3rdparty/ippicv/ippicv.cmake中${OpenCV_BINARY_DIR}所指的路径
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
	make -j$parallel
	sudo make install
	if [ -d "${HOME}/OpenCVtest" ]
	then
		sudo rm -rf ${HOME}/OpenCVtest
	fi
	mkdir ${HOME}/OpenCVtest
	touch ${HOME}/OpenCVtest/CMakeLists.txt
	touch ${HOME}/OpenCVtest/main.cpp
cat > ${HOME}/OpenCVtest/CMakeLists.txt << END_TEXT
set(SRC_LIST main.cpp)
cmake_minimum_required(VERSION 2.8)
project(main)
find_package(OpenCV REQUIRED)
add_executable(main \${SRC_LIST})
target_link_libraries(main \${OpenCV_LIBS})
END_TEXT
cat > ${HOME}/OpenCVtest/main.cpp << END_TEXT
#include <stdio.h>
#include <opencv2/opencv.hpp>
using namespace cv;
int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("usage: DisplayImage <Image_Path>\n");
        return -1;
    }
    Mat image = imread(argv[1], 1);
    if (!image.data)
    {
        return -1;
    }
    namedWindow("Display Image", WINDOW_AUTOSIZE);
    imshow("Display Image", image);
    waitKey(0);
    return 0;
}
END_TEXT
	cd $curr
	unzip opencv_extra.zip
	mv opencv_extra ${HOME}/OpenCVtest/
	mv opencv ${HOME}/OpenCVtest/
	mv opencv_contrib ${HOME}/OpenCVtest/
	cp icon/google.jpg ${HOME}/OpenCVtest/google.jpg
	if [ $(grep -c "export OPENCV_TEST_DATA_PATH=${HOME}/OpenCVtest/opencv_extra/testdata" /etc/bash.bashrc) -eq 0 ]
	then
		sudo sh -c 'echo "export OPENCV_TEST_DATA_PATH=${HOME}/OpenCVtest/opencv_extra/testdata" >> /etc/bash.bashrc'
	fi
	source /etc/bash.bashrc
	if [ $(grep -c "export OPENCV_TEST_DATA_PATH=${HOME}/OpenCVtest/opencv_extra/testdata" ${HOME}/.bashrc) -eq 0 ]
	then
		echo "export OPENCV_TEST_DATA_PATH=${HOME}/OpenCVtest/opencv_extra/testdata" >> ${HOME}/.bashrc
	fi
	source ${HOME}/.bashrc
	echo
	echo "已成功安装OpenCV"
	echo "pkg-config --modversion opencv4"
	pkg-config --modversion opencv4
	echo "pkg-config --cflags --libs opencv4"
	pkg-config --cflags --libs opencv4
	echo "OpenCV的简单实例已保存至主目录下的OpenCVtest，编译并运行："
	echo "cmake ."
	echo "make"
	echo "./main google.jpg"
	echo "OpenCV的官方实例见主目录下的OpenCVtest/opencv/samples"
	echo "已经成功配置OpenCV官方数据的环境变量OPENCV_TEST_DATA_PATH"
	echo "通过echo \$OPENCV_TEST_DATA_PATH命令查看官方数据的目录"
	echo "OpenCV官方文档"
	echo "https://docs.opencv.org/"
	echo "Doxygen HTML 4.3.0.tar.xz"
	echo "4.3.0/index.html"
else
	sudo echo "卸载OpenCV..."
	sudo apt-get remove --purge libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev -y
	sudo apt-get remove --purge python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev -y
	sudo apt-get remove --purge libjasper-dev -y
	sudo apt-get remove --purge libcanberra-gtk-module -y
	sudo apt-get autoremove -y
fi
