#!/bin/bash
echo -e "\e[32m[Git教程]\e[0m"
echo
echo "git clone的3种协议"
echo "git clone https://github.com/QQZAD/shell.git"
echo "git clone git://github.com/QQZAD/shell.git"
echo "git clone git@github.com:QQZAD/shell.git"
echo
echo "初始化git仓库"
echo "git init"
echo
echo "查看所有分支"
echo "git branch"
echo
echo "新建分支new"
echo "git branch new"
echo
echo "新建分支new并切换到该分支"
echo "git checkout -b new"
echo
echo "删除分支new"
echo "git branch -d new"
echo
echo "放弃所有未提交的修改"
echo "git checkout ."
echo
echo "切换到主分支"
echo "git checkout master"
echo
echo "将new分支合并到当前分支中"
echo "git merge new"
echo
echo "下载子模块"
echo "git submodule init"
echo "git submodule update"
echo
echo "删除git仓库"
echo "rm -rf .git .gitignore .gitmodules"
echo
echo "git的zip文件的网址"
echo "https://codeload.github.com/QQZAD/Computer-Network/zip/master"
echo
echo "Problem with the SSL CA cert (path? access rights?)"
echo "sudo apt-get install ca-certificates -y"
echo
echo -e "\e[32m[经验与总结]\e[0m"
echo
echo "在使用apt-get安装软件包时可能会遇到“无法定位软件包”的问题，这一般是由于当前Ubuntu版本太新，软件包尚未适配当前系统，解决方法："
echo "[1]访问https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/"
echo "[2]寻找适配该软件包的Ubuntu版本软件源"
echo "[3]通过命令sudo add-apt-repository \"deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ...\"将该软件源添加至sources.list"
echo "[4]运行sudo apt-get update后重新安装软件包"
echo
echo "在cmake中cmake_modules.cmake文件一般用于定义独立的模块或函数，在CMakeLists.txt文件中可以通过include(cmake_modules.cmake文件完整路径)命令调用其中的模块或函数，\${CMAKE_CURRENT_SOURCE_DIR}表示当前正在执行的CMakeLists.txt所在的完整路径，cmake .命令用于编译当前目录，往往会生成很多Makefile。"
echo
echo "make -j后面的参数用于并行编译，指的是编译时逻辑任务线程的数量，对于一些大型的项目并行编译不仅取决于CPU的性能，更取决于内存的大小。"
