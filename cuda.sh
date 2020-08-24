#!/bin/bash
# ./cuda.sh     安装cuda
# ./cuda.sh 1	生成一个简单的cuda项目
# ./cuda.sh 0	卸载cuda
error=1

cuda_ver=11.0 #注意296行也要对应修改

if [ -n "$1" ] && [ ! -n "$2" ]
then
    if [ $1 == "1" ]
    then
        error=0
        echo "通过cd /usr/local/cuda/samples;ls查找CUDA的示例程序"
        cp -r /usr/local/cuda/samples/0_Simple/template ${HOME}/
        sed -i "s#INCLUDES  := -I../../common/inc#INCLUDES  := -I /usr/local/cuda/include -I /usr/local/cuda/samples/common/inc#g" ${HOME}/template/Makefile
        sed -i "s#LIBRARIES :=#LIBRARIES := -L /usr/local/cuda/lib64 -L /usr/local/cuda/samples/common/lib#g" ${HOME}/template/Makefile
        sed -i "s#\\\$(EXEC) \\\$(NVCC) \\\$(INCLUDES) \\\$(ALL_CCFLAGS) \\\$(GENCODE_FLAGS) -o \\\$@ -c \\\$<#\\\$(EXEC) \\\$(NVCC) \\\$(INCLUDES) \\\$(ALL_CCFLAGS) \\\$(GENCODE_FLAGS) -o \\\$@ -c \\\$< -dc#g" ${HOME}/template/Makefile
        sed -i "s#SMS ?= 35 37 50 52 60 61 70 75 80#SMS ?= 75#g" ${HOME}/template/Makefile
        sed -i '/mkdir/d' ${HOME}/template/Makefile
        sed -i '/rm -rf/d' ${HOME}/template/Makefile
        sed -i '/cp $@/d' ${HOME}/template/Makefile
        sudo rm -rf ${HOME}/template/doc
        sudo rm -rf ${HOME}/template/readme.txt
        sudo rm -rf ${HOME}/template/NsightEclipse.xml
        mkdir ${HOME}/template/.vscode
        touch ${HOME}/template/.vscode/settings.json
cat > ${HOME}/template/.vscode/settings.json << END_TEXT
{
    "files.associations": {
        "*.cuh": "cpp",
        "*.cu": "cpp",
    },
}
END_TEXT
        touch ${HOME}/template/.vscode/c_cpp_properties.json
cat > ${HOME}/template/.vscode/c_cpp_properties.json << END_TEXT
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "\${workspaceFolder}/**",
                "/usr/include",
                "/usr/include/x86_64-linux-gnu/sys",
                "/usr/local/cuda/include",
                "/usr/local/cuda/samples/common/inc"
            ],
            "intelliSenseMode": "gcc-x64",
            "compilerPath": "/usr/bin/gcc",
            "cStandard": "gnu11",
            "cppStandard": "gnu++14"
        }
    ],
    "version": 4
}
END_TEXT
        touch ${HOME}/template/.vscode/tasks.json
cat > ${HOME}/template/.vscode/tasks.json << END_TEXT
{
    "tasks": [
        {
            "label": "template_gpu",
            "type": "shell",
            "command": "nvcc",
            "args": [
                "-gencode",
                "arch=compute_75,code=sm_75",
                "-gencode",
                "arch=compute_75,code=compute_75",
                "-g",
                "template.cu",
                "-o",
                "template.o",
                "-I",
                "\${workspaceFolder}",
                "-I",
                "/usr/local/cuda/include",
                "-I",
                "/usr/local/cuda/samples/common/inc",
                "-L",
                "/usr/local/cuda/lib64",
                "-L",
                "/usr/local/cuda/samples/common/lib",
                "-dc"
            ]
        },
        {
            "label": "template_cpu",
            "type": "shell",
            "command": "nvcc",
            "args": [
                "-gencode",
                "arch=compute_75,code=sm_75",
                "-gencode",
                "arch=compute_75,code=compute_75",
                "-g",
                "template_cpu.cpp",
                "-o",
                "template_cpu.o",
                "-I",
                "\${workspaceFolder}",
                "-I",
                "/usr/local/cuda/include",
                "-I",
                "/usr/local/cuda/samples/common/inc",
                "-L",
                "/usr/local/cuda/lib64",
                "-L",
                "/usr/local/cuda/samples/common/lib",
                "-dc"
            ]
        },
        {
            "label": "template",
            "type": "shell",
            "command": "nvcc",
            "args": [
                "-gencode",
                "arch=compute_75,code=sm_75",
                "-gencode",
                "arch=compute_75,code=compute_75",
                "-o",
                "template",
                "template.o",
                "template_cpu.o",
            ],
            "dependsOn": [
                "template_gpu",
                "template_cpu",
            ]
        }
    ]
}
END_TEXT
        
        touch ${HOME}/template/.vscode/launch.json
cat > ${HOME}/template/.vscode/launch.json << END_TEXT
{
    "configurations": [
        {
            "name": "template",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}/template",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "preLaunchTask": "template",
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
END_TEXT
        echo "已经在主目录下生成一个简单的CUDA项目template"
    elif [ $1 == "0" ]
    then
        error=0
        read -p "是否继续卸载CUDA Toolkit $cuda_ver ？(Y-继续/n-结束)" conti
        if [ $conti == "y" ] || [ $conti == "Y" ]
        then
            echo "卸载cuda..."
        elif [ $conti == "n" ] || [ $conti == "N" ]
        then
            echo "取消卸载"
            exit
        else
            echo "输入错误，取消卸载"
            exit
        fi
        sudo apt-get --purge remove cuda -y
        sudo apt-get --purge remove "*cublas*" "cuda*" -y
        sudo apt-get autoremove -y
        sudo rm -rf /usr/local/cuda-$cuda_ver
        echo
        echo "通过运行sudo apt-get --purge remove \"*nvidia*\" -y命令可以卸载NVIDIA驱动程序"
    fi
elif [ ! -n "$1" ]
then
    error=0
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
    
    # https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
    # https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=deblocal
    # https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal
    pin_url=https://developer.download.nvidia.com/compute/cuda/repos/$ubuntu/x86_64/cuda-$ubuntu.pin
    deb=cuda-repo-$ubuntu-11-0-local_11.0.3-450.51.06-1_amd64.deb
    deb_url=https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/$deb
    repo_ver=cuda-repo-$ubuntu-11-0-local
    
    # https://developer.nvidia.com/nsight-compute
    NsightCompute_ver=2020.1 #注意296行也要对应修改
    nsight_compute=nsight-compute-linux-${NsightCompute_ver}.2.4-28820667.run
    
    # 本地必须存在$nsight_compute
    if [ ! -f "$nsight_compute" ]
    then
        echo "没有找到本地$nsight_compute"
        echo "访问https://developer.nvidia.com/nsight-compute"
        echo "获取$nsight_compute并将其放在shell下"
        echo "结束安装"
        exit
    else
        echo -e "\e[32m已经获取本地$nsight_compute\e[0m"
    fi
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
    read -p "确保设备有足够的磁盘空间，是否继续安装CUDA Toolkit $cuda_ver ？(Y-继续/n-结束)" conti
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
    echo -e "\e[31m接下来将安装NVIDIA Nsight Compute\e[0m"
    echo -e "\e[31m请复制路径/usr/local/cuda-$cuda_ver/NsightCompute-$NsightCompute_ver\e[0m"
    read -p "按回车键继续..."
    sudo chmod +x $nsight_compute
    sudo ./$nsight_compute
    if [ ! -f "cuda-$ubuntu.pin" ]
    then
        echo -e "\e[32m正在从网络获取cuda-$ubuntu.pin...\e[0m"
        wget -t 0 -c $pin_url
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
    if [ ! -f "$deb" ]
    then
        echo -e "\e[32m正在从网络获取$deb...\e[0m"
        wget -t 0 -c $deb_url
    else
        echo -e "\e[32m已经获取本地$deb\e[0m"
    fi
    if [ ! -f "$deb" ]
    then
        echo "$deb下载失败或本地没有$deb"
        echo "结束安装"
        exit
    else
        echo "OK"
        sudo dpkg -i $deb
        sudo apt-key add /var/$repo_ver/7fa2af80.pub
        sudo apt-get update
        sudo apt-get -y install cuda
        echo
        echo "正在设置环境变量..."
        if [ $(grep -c "export PATH=/usr/local/cuda-$cuda_ver/bin:/usr/local/cuda-$cuda_ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" /etc/bash.bashrc) -eq 0 ]
        then
            sudo sh -c 'cuda_ver=11.0;NsightCompute_ver=2020.1;echo "export PATH=/usr/local/cuda-$cuda_ver/bin:/usr/local/cuda-$cuda_ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" >> /etc/bash.bashrc'
        fi
        source /etc/bash.bashrc
        if [ $(grep -c "export PATH=/usr/local/cuda-$cuda_ver/bin:/usr/local/cuda-$cuda_ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" ${HOME}/.bashrc) -eq 0 ]
        then
            echo "export PATH=/usr/local/cuda-$cuda_ver/bin:/usr/local/cuda-$cuda_ver/NsightCompute-$NsightCompute_ver\${PATH:+:\${PATH}}" >> ${HOME}/.bashrc
        fi
        source ${HOME}/.bashrc
        echo "已成功安装CUDA Toolkit $cuda_ver"
        sudo chown ${USER}: -R /usr/local/cuda
        sudo chown ${USER}: -R /usr/local/cuda-$cuda_ver
        echo "cat /usr/local/cuda/version.txt"
        cat /usr/local/cuda/version.txt
        echo "通过reboot命令重启机器"
    fi
fi
if [ $error == "1" ]
then
    echo "./cuda.sh     安装cuda"
    echo "./cuda.sh 1   生成一个简单的cuda项目"
    echo "./cuda.sh 0   卸载cuda"
    exit
fi