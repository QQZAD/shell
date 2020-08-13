#!/bin/bash
echo "打开全局设置"
echo "[1]Ctrl+Shift+P"
echo "[2]Preferences: Open Settings (JSON)"
echo
echo "打开工作区设置"
echo "[1]Ctrl+Shift+P"
echo "[2]Preferences: Open Workspace Settings (JSON)"
echo
echo "配置C/C++：生成c_cpp_properties.json"
echo "[1]Ctrl+Shift+P"
echo "[2]C/C++: Edit Configurations (JSON)"
echo
echo "配置任务：生成tasks.json"
echo "[1]双击打开要配置的c/cpp源文件"
echo "[2]Ctrl+Shift+P"
echo "[3]Tasks: Configure Task"
echo "[4]对于c 选择C/C++: gcc build active file"
echo "[5]对于cpp 选择C/C++: g++ build active file"
echo
echo "配置启动：生成launch.json"
echo "[1]双击打开要配置的c/cpp源文件"
echo "[2]Ctrl+Shift+P"
echo "[3]Debug: Open launch.json"
echo "[4]选择C++ (GDB/LLDB)"
echo "[5]对于c 选择gcc - 生成和调试活动文件"
echo "[6]对于cpp 选择g++ - 生成和调试活动文件"
echo
echo "仅编译当前源文件(.c/.cpp/.cu)"
echo "[1]双击打开要编译的c/cpp源文件"
echo "[2]Ctrl+Shift+B"
echo "[3]对于c 选择C/C++: gcc build active file"
echo "[4]对于cpp 选择C/C++: g++ build active file"
echo
echo "F5 执行编译任务并调试"
echo "F5 断点调试"
echo "F10 单步跳过"
echo
echo "Ctrl+F5 执行编译任务并运行"
echo
echo "tasks.json参数设置"
echo "\"label\"用于配置任务名"
echo "\"command\"用于配置编译器命令"
echo "\"args\"用于配置传递给编译器命令的参数，参数的设置需参见编译器命令的用法"
echo "g++/gcc的常用参数设置如下："
echo "\"-g\","
echo "\"要调试的源文件1(.c/.cpp/.cu)的完整路径\","
echo "\"要调试的源文件2(.c/.cpp/.cu)的完整路径\","
echo "\"...\","
echo "\"-o\","
echo "\"编译后生成的二进制目标文件和可执行文件的输出目录\","
echo "/*"
echo "(1)对于Windows系统，二进制目标文件的扩展名是.obj，用于静态链接的库文件扩展名是.lib，用于动态链接的库文件扩展名是.dll，可执行文件的扩展名是.exe"
echo "(2)对于Linux系统，二进制目标文件的扩展名是.o，用于静态链接的库文件扩展名是.a，用于动态链接的库文件扩展名是.so，可执行文件没有扩展名"
echo "(3)用于静态链接的库文件一般称为静态链接库，用于动态链接的库文件一般称为动态链接库，两种库文件都旨在为外部程序提供接口和函数，静态链接发生在可执行文件生成之前，动态链接发生在程序执行时，即使用时才载入"
echo "(4)静态链接库一般由多个二进制目标文件组成，动态链接库在程序执行时才将各个二进制目标文件组装起来"
echo "(5)源代码(Source Code)→ 预处理(Preprocessing)→ 预处理（宏定义、文件包含、条件编译）后的源代码(Source Code)→ 编译(Compilation)→ 特定汇编代码(Assembly Code)→ 汇编(Assemble)→ 二进制目标文件(Object Code)→ 链接多个二进制目标文件以及所需的库文件(Linking)→ 可执行文件(Executable File)"
echo "*/"
echo "\"-l\","
echo "\"需链接的库文件1\",//如libpcre.so则为\"pcre\""
echo "\"需链接的库文件2\",//如libcrypto.so则为\"crypto\""
echo "\"...\","
echo "\"-L\","
echo "\"需链接的库文件目录1\","
echo "\"需链接的库文件目录2\","
echo "\"...\","
echo "\"-I\","
echo "\"include头文件的搜索路径1\","
echo "\"include头文件的搜索路径2\","
echo "\"...\","
echo "\"-w\",//不生成任何警告信息"
echo "\"-Wall\",//生成所有警告信息"
echo "\${file}表示当前源文件的完整路径"
echo "\${fileDirname}表示当前源文件所在目录"
echo "\${fileBasenameNoExtension}表示当前源文件去除扩展名后的基本名称"
echo
echo "launch.json参数设置"
echo "\"preLaunchTask\"用于配置要运行的任务名"
echo "\${workspaceFolder}表示当前项目的工作目录"


