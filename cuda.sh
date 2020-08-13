#!/bin/bash
option=1
# 1 to install, 0 to uninstall
# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=deblocal
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal

if [ -n "$1" ]; then
	if [ $1 -eq "1" ]
	then
		option=1
	else
		option=0
	fi
fi
ver=10.2
NsightCompute_ver=2019.5
if [ $option -eq 1 ]
then
	ubuntu=ubuntu1804
	ubuntu1804_deb=cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
	ubuntu1604_deb=cuda-repo-ubuntu1604-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
	cuda_ver=cuda-repo-10-2-local-10.2.89-440.33.01
	sudo apt-get install gcc -y
	sudo echo "更新系统内核..."
	sudo apt-get install linux-headers-$(uname -r)
	echo
	sudo echo "获取设备GPU信息："
	echo $(lspci|grep -i vga)
	sudo echo "在安装前请访问官网查询你的NVIDIA GPU是否支持cuda以及支持的cuda版本"
	sudo echo "对于较新的GPU参见https://developer.nvidia.com/cuda-gpus"
	sudo echo "对于较老的GPU参见https://developer.nvidia.com/cuda-legacy-gpus"
	echo "通过运行lspci|grep -i nvidia命令可以验证设备GPU是否支持cuda"
	echo
	read -p "确保设备有足够的磁盘空间，是否继续安装CUDA Toolkit $ver？(Y-继续/n-结束)" conti
	if [ $conti == "y" ] || [ $conti == "Y" ]
	then
	 	echo "安装cuda..."
	elif [ $conti == "n" ] || [ $conti == "N" ]
	then
		echo "结束安装"
		exit
	else
		echo "输入错误，结束安装"
		exit
	fi
	release_num=$(lsb_release -r --short)
	case "$release_num" in
	    "18.04")
		echo -e "\e[32m获取当前Ubuntu版本$release_num\e[0m"
		ubuntu=ubuntu1804
	    ;;
	    "18.10")
		echo -e "\e[32m获取当前Ubuntu版本$release_num\e[0m"
		ubuntu=ubuntu1804
	    ;;
	    "16.04")
		echo -e "\e[32m获取当前Ubuntu版本$release_num\e[0m"
		ubuntu=ubuntu1604
	    ;;
	    *)
		echo -e "\e[32m当前Ubuntu版本$release_num不支持cuda，已结束安装\e[0m"
		exit
	    ;;
	esac
	nsight_compute=nsight-compute-linux-${NsightCompute_ver}.0.14-27346997.run
	# 本地必须存在$nsight_compute
	# https://developer.nvidia.com/nsight-compute
	if [ ! -f "$nsight_compute" ]
	then
		echo -e "\e[32m正在从网络获取$nsight_compute...\e[0m"
		wget -t 0 -c https://developer.download.nvidia.cn/assets/tools/secure/nsight-compute/$NsightCompute_ver/$nsight_compute?xQereKzqqAGNH-nP-v4f1AzIh9mHPK_AlDDBQUzyhw9VtE5xMZ9FsI5FNmo7dKwhExA2xpnexfBzl5SE8MaVHg0T0mQsCyZA6HapMsCVVOdpeKQ_yz_fTQQPA8U4b2RrTjHrR8wSjuyPxD15a0zmwM_ZfBWfOnOnC1HhabIrrXCcJhwSuEF7-t72DsZjVtlTBUk8IeB3 -O $nsight_compute
	else
		echo -e "\e[32m已经获取本地$nsight_compute\e[0m"
	fi
	echo -e "\e[31m接下来将安装NVIDIA Nsight Compute\e[0m"
	echo -e "\e[31m请选择路径/usr/local/cuda-$ver/NsightCompute-$NsightCompute_ver\e[0m"
	read -p "按回车键继续..."
	sudo chmod +x $nsight_compute
	sudo ./$nsight_compute
	ubuntu_deb_=${ubuntu}_deb
	eval ubuntu_deb=$(echo \$$ubuntu_deb_)
	if [ ! -f "cuda-$ubuntu.pin" ]
	then
		echo -e "\e[32m正在从网络获取cuda-$ubuntu.pin...\e[0m"
		wget -t 0 -c https://developer.download.nvidia.com/compute/cuda/repos/$ubuntu/x86_64/cuda-$ubuntu.pin
	else
		echo -e "\e[32m已经获取本地cuda-$ubuntu.pin\e[0m"
	fi
	if [ ! -f "cuda-$ubuntu.pin" ]
	then
		echo "cuda-$ubuntu.pin下载失败或本地没有cuda-$ubuntu.pin"
		echo "结束安装"
		exit
	else
		sudo cp cuda-$ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
	fi
	if [ ! -f "$ubuntu_deb" ]
	then
		echo -e "\e[32m正在从网络获取$ubuntu_deb...\e[0m"
		wget -t 0 -c http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/$ubuntu_deb
	else
		echo -e "\e[32m已经获取本地$ubuntu_deb\e[0m"
	fi
	if [ ! -f "$ubuntu_deb" ]
	then
		echo "$ubuntu_deb下载失败或本地没有$ubuntu_deb"
		echo "结束安装"
		exit
	else
		echo "OK"
		sudo dpkg -i $ubuntu_deb
		sudo apt-key add /var/$cuda_ver/7fa2af80.pub
		sudo apt-get update
		sudo apt-get -y install cuda
		echo
		echo "正在设置环境变量..."
		if [ $(grep -c "export PATH=/usr/local/cuda-$ver/bin:/usr/local/cuda-$ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" /etc/bash.bashrc) -eq 0 ]
		then
			sudo sh -c 'ver=10.2;NsightCompute_ver=2019.5;echo "export PATH=/usr/local/cuda-$ver/bin:/usr/local/cuda-$ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" >> /etc/bash.bashrc'
		fi
		source /etc/bash.bashrc
		if [ $(grep -c "export PATH=/usr/local/cuda-$ver/bin:/usr/local/cuda-$ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" ${HOME}/.bashrc) -eq 0 ]
		then
			echo "export PATH=/usr/local/cuda-$ver/bin:/usr/local/cuda-$ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" >> ${HOME}/.bashrc
		fi
		source ${HOME}/.bashrc
		echo "已成功安装CUDA Toolkit $ver"
		sudo chown ${USER}: -R /usr/local/cuda
		sudo chown ${USER}: -R /usr/local/cuda-$ver
		echo "cat /usr/local/cuda/version.txt"
		cat /usr/local/cuda/version.txt
		echo "通过reboot命令重启机器"
	fi
else
	sudo echo "卸载cuda..."
	sudo apt-get --purge remove cuda -y
	sudo apt-get --purge remove "*cublas*" "cuda*" -y
	sudo apt-get autoremove -y
	sudo rm -rf /usr/local/cuda-$ver
	echo
	echo "通过运行sudo apt-get --purge remove \"*nvidia*\" -y命令可以卸载NVIDIA驱动程序"
fi
