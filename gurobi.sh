#!/bin/bash
gurobi=gurobi9.1.1_linux64.tar.gz
ver=911
if [ ! -f $gurobi ]
then
    echo "在shell/中没有找到$gurobi"
    exit
fi
tar -xf $gurobi
sudo rm -rf /opt/gurobi$ver/linux64
sudo mv gurobi$ver /opt/
cd /opt/gurobi$ver/linux64
sudo python3 setup.py install
shell=$(env|grep SHELL=)
echo $shell
if [ $shell == "SHELL=/bin/bash" ]
then
    rc=.bashrc
else
    rc=.zshrc
fi
if [ $(grep -c "export GUROBI_HOME=\"/opt/gurobi$ver/linux64\"" ${HOME}/$rc) -eq 0 ]
then
    echo "export GUROBI_HOME=\"/opt/gurobi$ver/linux64\"" >> ${HOME}/$rc
fi
if [ $(grep -c "export PATH=\"\${PATH}:\${GUROBI_HOME}/bin\"" ${HOME}/$rc) -eq 0 ]
then
    echo "export PATH=\"\${PATH}:\${GUROBI_HOME}/bin\"" >> ${HOME}/$rc
fi
if [ $(grep -c "export LD_LIBRARY_PATH=\"\${LD_LIBRARY_PATH}:\${GUROBI_HOME}/lib\"" ${HOME}/$rc) -eq 0 ]
then
    echo "export LD_LIBRARY_PATH=\"\${LD_LIBRARY_PATH}:\${GUROBI_HOME}/lib\"" >> ${HOME}/$rc
fi
read -p "手动执行source ${HOME}/$rc后继续"
sudo ldconfig