#!/bin/bash
option=1
# 1 to install, 0 to uninstall
ver=912
_ver=9.1.2
gurobi=gurobi${_ver}_linux64.tar.gz
if [ -n "$1" ]; then
    if [ $1 -eq "1" ]; then
        option=1
    else
        option=0
    fi
fi
sudo apt-get install python3 python3-pip -y
if [ $option -eq 1 ]; then
    sudo echo "安装gurobi$ver..."
    if [ ! -f $gurobi ]; then
        echo "在shell/中没有找到$gurobi"
        exit
    fi
    tar -xf $gurobi
    sudo rm -rf /opt/gurobi$ver
    sudo mv gurobi$ver /opt/
    cd /opt/gurobi$ver/linux64
    sudo python3 setup.py install
    shell=$(env | grep SHELL=)
    echo $shell
    if [ $shell == "SHELL=/bin/bash" ]; then
        rc=.bashrc
    else
        rc=.zshrc
    fi
    sudo echo "为用户${USER}配置gurobipy的环境变量..."
    if [ $(grep -c "export GUROBI_HOME=\"/opt/gurobi$ver/linux64\"" ${HOME}/$rc) -eq 0 ]; then
        echo "export GUROBI_HOME=\"/opt/gurobi$ver/linux64\"" >>${HOME}/$rc
    fi
    if [ $(grep -c "export PATH=\"\${PATH}:\${GUROBI_HOME}/bin\"" ${HOME}/$rc) -eq 0 ]; then
        echo "export PATH=\"\${PATH}:\${GUROBI_HOME}/bin\"" >>${HOME}/$rc
    fi
    if [ $(grep -c "export LD_LIBRARY_PATH=\"\${LD_LIBRARY_PATH}:\${GUROBI_HOME}/lib\"" ${HOME}/$rc) -eq 0 ]; then
        echo "export LD_LIBRARY_PATH=\"\${LD_LIBRARY_PATH}:\${GUROBI_HOME}/lib\"" >>${HOME}/$rc
    fi
    read -p "手动执行source ${HOME}/$rc后继续"
    sudo ldconfig
    echo "必须在新的终端中使用gurobi！"
else
    sudo echo "卸载gurobi$ver..."
    sudo rm -rf /opt/gurobi$ver
    pip3 show gurobipy
    read -p "通过cd转到gurobipy的pip目录并运行sudo rm -rf gurobipy  gurobipy-${_ver}.egg-info后继续"
    shell=$(env | grep SHELL=)
    if [ $shell == "SHELL=/bin/bash" ]; then
        rc=.bashrc
    else
        rc=.zshrc
    fi
    read -p "手动删除${HOME}/$rc中gurobipy的环境变量..."
    sudo vim ${HOME}/$rc
    read -p "手动执行source ${HOME}/$rc后继续"
    sudo ldconfig
fi
