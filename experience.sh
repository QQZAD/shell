#!/bin/bash
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
echo
echo "Ubuntu系统中移动硬盘出现文档被锁定的问题，解决方案：Ctrl+H 删除该目录下对应的隐藏文件"
echo
echo "Ubuntu系统某些软件（如计算器）可能会出现方块字的现象"
echo "sudo chmod -R 755 /usr/share/fonts"
echo "sudo chmod -R 754 /usr/share/fonts/truetype"
echo "sudo fc-cache -fv"