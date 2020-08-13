#!/bin/bash
echo -e "\e[32m[系统命令]\e[0m"
echo
echo "重启"
echo "reboot"
echo
echo "关机"
echo "shutdown"
echo
echo "命令行模式注销"
echo "logout"
echo
echo "回到图形登录界面(Ubuntu18)"
echo "Ctrl+Alt+F1"
echo
echo "恢复已登录的图形桌面(Ubuntu18)"
echo "Ctrl+Alt+F2"
echo
echo "切换命令行模式(Ubuntu18)"
echo "Ctrl+Alt+F3-F6"
echo
echo "切换命令行模式(Ubuntu16)"
echo "Ctrl+Alt+F1-F6"
echo
echo "切换图形界面模式(Ubuntu16)"
echo "Ctrl+Alt+F7"
echo
echo "查看所有用户信息"
echo "grep bash /etc/passwd"
echo
echo "创建用户user_name"
echo "（1）默认无用户密码，无主目录，无法登录图形界面"
echo "sudo useradd user_name"
echo "（2）需指定用户信息，创建主目录，可以登录图形界面"
echo "sudo adduser user_name"
echo
echo "设置用户user_name的密码"
echo "sudo passwd user_name"
echo
echo "修改用户user_name的名称为new_user_name"
echo "sudo usermod -l new_user_name user_name"
echo
echo "删除用户user_name"
echo "sudo userdel user_name"
echo
echo "查看所有用户组信息"
echo "getent group"
echo "用户组的名称:组密码:组ID:用户列表"
echo
echo "查看包含当前用户的全部用户组"
echo "groups"
echo
echo "查看包含用户\${USER}的全部用户组"
echo "groups \${USER}"
echo
echo "创建用户组group_name"
echo "sudo groupadd group_name"
echo
echo "修改用户组group_name的名称为new_group_name"
echo "sudo groupmod -n new_group_name group_name"
echo
echo "将用户\${USER}添加到用户组group_name中"
echo "sudo gpasswd -a \${USER} group_name"
echo
echo "将用户\${USER},user_name等设置为用户组group_name的管理员"
echo "sudo gpasswd -A \${USER},user_name group_name"
echo
echo "将用户\${USER}从用户组group_name中去除"
echo "sudo gpasswd -d \${USER} group_name"
echo
echo "删除用户组group_name"
echo "sudo groupdel group_name"
echo
echo "改变文件/文件夹的主人"
echo "sudo chown \${USER}: -R name"
echo
echo "使所有用户对文件test拥有最高权限"
echo "sudo chmod 777 test"
echo
echo "使所有用户对文件夹test及其子项拥有最高权限"
echo "sudo chmod -R 777 test"
echo
echo "杀死图形进程"
echo "xkill"
echo
echo "查看进程资源占用情况（q退出，空格刷新）"
echo "top"
echo
echo "杀死chrome的所有进程"
echo "killall chrome"
echo
echo "为文件添加/取消可执行权限"
echo "chmod +/-x 'file name'"
echo
echo "为当前目录下所有文件添加/取消可执行权限"
echo "chmod +/-x *"
echo
echo "为当前目录下所有txt文件添加/取消可执行权限"
echo "chmod +/-x *.txt"
echo
echo "查看所有文件"
echo "ls -a"
echo
echo "查看所有文件的详细信息"
echo "ls -la"
echo
echo "新建文件"
echo "touch ~/'file name.txt'"
echo
echo "新建文件夹"
echo "mkdir ~/'floder name'"
echo
echo "重命名文件(注意：通过ls获取文件的正确名称)"
echo "sudo mv ~/'file name.txt' ~/'new file name.txt'"
echo
echo "重命名文件夹(注意：通过ls获取文件夹的正确名称)"
echo "sudo mv ~/'floder name' ~/'new floder name'"
echo
echo "复制文件(注意：通过ls获取文件的正确名称)"
echo "sudo cp ~/'file name.txt' /'file name.txt'"
echo
echo "复制文件夹中所有文件至另一个文件夹(直接替换同名文件)"
echo "\cp -r ~/'floder name'/* ~/'other floder name'/"
echo
echo "复制文件夹(注意：通过ls获取文件夹的正确名称)"
echo "sudo cp -r ~/'floder name' /"
echo
echo "移动文件(注意：通过ls获取文件的正确名称)"
echo "sudo mv ~/'file name.txt' /'file name.txt'"
echo
echo "移动文件夹(注意：通过ls获取文件夹的正确名称)"
echo "sudo mv ~/'floder name' /"
echo
echo "删除文件(注意：通过ls获取文件的正确名称)"
echo "sudo rm -rf ~/'file name.txt'"
echo
echo "删除文件夹(注意：通过ls获取文件夹的正确名称)"
echo "sudo rm -rf ~/'floder name'"
echo
echo "tar的参数-v表示显示细节"
echo
echo "zip的参数-q表示不显示细节"
echo
echo "压缩(注意：通过ls获取文件(文件夹)的正确名称)"
echo "zip -q -r ~/'floder name.zip' 'floder name'"
echo "tar -zcvf ~/'floder name.tar.gz' 'floder name'"
echo "tar -zcvf 'floder name.tar' 'floder name'"
echo
echo "解压缩tar.gz(.tgz)(注意：通过ls获取文件(文件夹)的正确名称)"
echo "mkdir ~/'floder name'"
echo "tar -zxvf ~/'file name.tar.gz(.tgz)' -C ~/'floder name'"
echo
echo "解压缩tar.xz(注意：通过ls获取文件(文件夹)的正确名称)"
echo "xz -d 'file name.tar.xz'"
echo "tar -xvf 'file name.tar'"
echo
echo "解压缩tar(注意：通过ls获取文件(文件夹)的正确名称)"
echo "tar -xvf 'file name.tar'"
echo
echo "安装新的软件包"
echo "sudo apt-get install"
echo
echo "查看所有已安装的软件包"
echo "dpkg -l"
echo
echo "卸载软件包以及配置文件"
echo "sudo apt-get --purge remove"
echo
echo "返回父目录"
echo "cd .."
echo
echo "显示Nautilus地址栏"
echo "Ctrl+L"
echo
echo "显示Nautilus隐藏文件"
echo "Ctrl+H"
echo
echo "创建软链接"
echo "ln -s ~/file.txt ~/floder"
echo
echo "查看内核信息"
echo "uname -a"
echo
echo "查看Ubuntu版本"
echo "cat /etc/issue"
echo
echo "查看CPU信息"
echo "cat /proc/cpuinfo"
echo
echo "查看GPU信息"
echo "echo \$(lspci|grep -i vga)"
echo
echo "查看网卡型号"
echo "lspci|grep \"Ethernet controller\""
echo
echo "查看USB设备"
echo "lsusb"
echo
echo "查看PCI设备"
echo "lspci"
echo
echo "查看内核加载的模块"
echo "lsmod"
echo
echo "查看当前硬件信息"
echo "sudo lshw"
echo
echo "查看磁盘信息"
echo "sudo fdisk -l"
echo
echo "查看硬盘剩余空间"
echo "df -h"
echo
echo "查看当前的内存使用情况"
echo "free -m"
echo
echo "查看软件vim安装位置"
echo "dpkg -L vim"
echo "whereis vim"
echo "which vim"
echo "type vim"
echo
echo "在特定目录下快速查找文件或目录"
echo "sudo find 特定目录 -name 文件或目录"
echo
echo "立刻关闭计算机"
echo "sudo shutdown -r now"
echo
echo "定时关闭计算机（24小时制）"
echo "sudo shutdown -h 22:00"
echo
echo "安装MS字体"
echo "sudo apt-get install ttf-mscorefonts-installer"
echo
echo "列出会话窗口"
echo "screen -ls"
echo
echo "新建会话窗口"
echo "screen -S name"
echo
echo "分离会话窗口"
echo "Ctrl+A+D"
echo
echo "恢复会话窗口"
echo "(Attached)"
echo "screen -d id/name"
echo "(Detached)"
echo "screen -r id/name"
echo
echo "杀死会话窗口"
echo "kill -9 id"
echo
echo "清除死去窗口"
echo "screen -wipe"
echo
echo "切换输入法"
echo "Win+Space"
echo
echo "安装pip"
echo "sudo apt-get install python-pip"
echo
echo "更新pip"
echo "pip install --upgrade pip"
echo
echo "卸载pip"
echo "sudo apt-get remove python-pip"
echo
echo "用pip查看特定包"
echo "pip show"
echo
echo "用pip安装特定包"
echo "pip install numpy -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com"
echo
echo "用pip卸载特定包"
echo "pip uninstall"
echo
echo "安装pip3"
echo "sudo apt-get install python3-pip"
echo
echo "更新pip3"
echo "pip3 install --upgrade pip"
echo
echo "卸载pip3"
echo "sudo apt-get remove python3-pip"
echo
echo "用pip3查看特定包"
echo "pip3 show"
echo
echo "用pip3安装特定包"
echo "pip3 install numpy -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com"
echo
echo "用pip3卸载特定包"
echo "pip3 uninstall"
echo
echo "清除无用的软件包"
echo "sudo apt-get autoremove"
echo
echo "更新Linux系统内核"
echo "sudo apt-get install linux-headers-\$(uname -r)"
echo
echo "开启防火墙"
echo "sudo ufw enable"
echo
echo "关闭防火墙"
echo "sudo ufw disable"
echo
echo "查看防火墙状态"
echo "sudo ufw status"
echo
echo "查看ssh服务状态"
echo "service ssh status"
echo
echo "启动ssh服务"
echo "service ssh start"
echo
echo "停止ssh服务"
echo "service ssh stop"
echo
echo "重启ssh服务"
echo "service ssh restart"
echo
echo "开放防火墙ssh服务端口"
echo "service ssh status"
echo
echo "开放防火墙ssh服务端口"
echo "sudo ufw allow ssh"
echo
echo "删除防火墙ssh服务端口"
echo "sudo ufw delete allow ssh"
echo
echo "递归查找文件夹test下所有包含\"\${HOME}string\"或\"hello\"字符串的文件"
echo "grep -r -E \"\\\${HOME}string|hello\" ~/test"
echo
echo "递归查找文件夹test下所有包含\"\${HOME}string\"和\"hello\"字符串的文件"
echo "grep -r \"\\\${HOME}string\" ~/test | grep \"hello\""
echo
echo "gedit查找和替换"
echo "Ctrl+H"
echo
echo "U盘目录"
echo "cd /media/\${USER}"
echo "ls"
echo
echo "查看CPU线程数量"
echo "echo \`nproc\`"
echo
echo "设置root用户的密码"
echo "sudo passwd root"
echo
echo "查看已经登入的用户"
echo "who"
echo
echo "查看后台正在运行的程序"
echo "ps -aux"
echo
echo -e "\e[32m[Shell教程]\e[0m"
echo
echo "shell脚本的第一行"
echo "#!/bin/bash"
echo
echo "显示脚本执行过程"
echo "set -xe"
echo
echo "显示当前工作目录"
echo "currdir=\$(pwd)"
echo
echo "显示执行脚本的父目录"
echo "shdir=\$(cd \`dirname \$0\`; pwd)"
echo
echo "查看文件内容"
echo "cat 文件的完整路径"
echo
echo "下载 -t 0表示重试无数次 -c 表示允许断点续传"
echo "wget -t 0 -c \"URL\" -O ~/file_name"
echo
echo "输出用户信息"
echo "echo \${USER}"
echo "echo \${HOME}"
echo
echo "查看本机IP地址"
echo "echo \$(ifconfig|grep -E \"broadcast|广播\")"
echo "echo \$(ifconfig|grep -E \"<link>|Scope:Link\")"
echo
echo "判断文件/文件夹/软链接是否存在"
echo "if [ ! -f/-d/-h \"\${HOME}/name\" ]"
echo "then"
echo "	echo \"不存在\""
echo "else"
echo "	echo \"存在\""
echo "fi"
echo
echo "判断x是否等于0（不等于-ne）（大于-gt）（小于-lt）（大于等于-ge）（小于等于-le）"
echo "if [ \$x -eq 0 ]"
echo "then"
echo " 	echo \"等于\""
echo "else"
echo "	echo \"不等于\""
echo "fi"
echo
echo "输出内容到文件（清空模式）"
echo "echo \"content\"> name"
echo "sudo sh -c 'echo \"content\"> name'"
echo
echo "输出内容到文件（追加模式）"
echo "echo \"content\">> name"
echo "sudo sh -c 'echo \"content\">> name'"
echo
echo "输出更多内容到文件"
echo "cat > file_name << END_TEXT"
echo "文件内容"
echo "END_TEXT"
echo
echo "shell多行注释"
echo "<<'COMMENT'"
echo "注释内容"
echo "COMMENT"
echo
echo "暂停回车键继续"
echo "read -p \"按回车键继续...\""
echo
echo "自动输入shell中的输入"
echo "read -p \"输入：\" input <<EOF"
echo "预定的输入值"
echo "EOF"
echo "echo \$input"
echo
echo "挂载镜像文件"
echo "sudo mount -o loop file.iso /mnt"
echo "cd /mnt"
echo "sudo umount /mnt"
echo
echo "Linux下基于file协议通过网络或浏览器访问本地目录"
echo "file://${HOME}/"
echo "file://+目录的完整路径"
echo
echo "查找特定字符串在文件中的出现的次数"
echo "result=\$(grep -c \"string\" ~/filename)"
echo "echo \$result"
echo
echo "遍历数组"
echo "array=(A B C D E)"
echo "for i in {0..4}"
echo "do"
echo "	echo \${array[i]}"
echo "done"
echo
echo "循环输入判断"
echo "while :"
echo "do"
echo "	read -p \"是否继续循环？(Y/n)\" option"
echo "	if [ \$option == \"y\" ] || [ \$option == \"Y\" ]"
echo "	then"
echo "	 	echo \"继续\""
echo "	elif [ \$option == \"n\" ] || [ \$option == \"N\" ]"
echo "	then"
echo "		break"
echo "	else"
echo "		echo \"输入错误\""
echo "	fi"
echo "done"
echo
echo "嵌套变量的使用"
echo "var_first=1"
echo "var_second=2"
echo "index=first"
echo "var_=var_\${index}"
echo "eval var=\$(echo \\$\$var_)"
echo "echo \$var_"
echo "echo \$var"
echo "index=second"
echo "var_=var_\${index}"
echo "eval var=\$(echo \\$\$var_)"
echo "echo \$var_"
echo "echo \$var"
echo
echo "添加环境变量(以CUDA为例)"
echo "ver=10.2"
echo "NsightCompute_ver=2019.5"
echo "if [ \$(grep -c \"export PATH=/usr/local/cuda-\$ver/bin:/usr/local/cuda-\$ver/NsightCompute-\$NsightCompute_ver\\\${PATH:+:\\\${PATH}}\" /etc/bash.bashrc) -eq 0 ]"
echo "then"
echo "	sudo sh -c 'ver=10.2;NsightCompute_ver=2019.5;echo \"export PATH=/usr/local/cuda-\$ver/bin:/usr/local/cuda-\$ver/NsightCompute-\$NsightCompute_ver\\\${PATH:+:\\\${PATH}}\" >> /etc/bash.bashrc'"
echo "fi"
echo "source /etc/bash.bashrc"
echo "if [ \$(grep -c \"export PATH=/usr/local/cuda-\$ver/bin:/usr/local/cuda-\$ver/NsightCompute-\$NsightCompute_ver\\\${PATH:+:\\\${PATH}}\" \${HOME}/.bashrc) -eq 0 ]"
echo "then"
echo "	echo \"export PATH=/usr/local/cuda-\$ver/bin:/usr/local/cuda-\$ver/NsightCompute-\$NsightCompute_ver\\\${PATH:+:\\\${PATH}}\" >> \${HOME}/.bashrc"
echo "fi"
echo "source \${HOME}/.bashrc"
echo "打开文件删除刚才的环境变量"
echo "sudo gedit /etc/bash.bashrc"
echo "gedit \${HOME}/.bashrc"
echo "并运行以下命令"
echo "source /etc/bash.bashrc"
echo "source \${HOME}/.bashrc"
echo
echo "比较两个文件是否相同"
echo "diff filename1 filename2"
echo
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
echo "Problem with the SSL CA cert (path? access rights?)"
echo "sudo apt-get install ca-certificates -y"
echo
echo -e "\e[32m[经验与总结]\e[0m"
echo
echo "在Linux下安装、配置、编译各种软件或组件时务必以官方文档为准"
echo "注意：在尚未安装软件时运行所配置的卸载脚本应该不会对系统造成任何影响"
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
