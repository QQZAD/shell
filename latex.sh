#!/bin/bash
# ./latex.sh	安装latex
# ./latex.sh 1	配置latex
# ./latex.sh 0	卸载latex
error=1
currdir=$(pwd)
URL=https://mirrors.aliyun.com/CTAN/systems/texlive/Images/texlive.iso
year=2020
if [ -n "$1" ] && [ ! -n "$2" ]
then
    if [ $1 == "1" ]
    then
        error=0
        echo "注意！！！启动Texmaker——选项——配置Texmaker如下："
        echo "[1] LaTeX——\"/usr/local/texlive/$year/bin/x86_64-linux/latex\" -interaction=nonstopmode %.tex"
        echo "[2] PdfLaTex/Dvipdfm——\"/usr/local/texlive/$year/bin/x86_64-linux/pdflatex\" -interaction=nonstopmode %.tex"
        echo "[3] XeLaTeX——\"/usr/local/texlive/$year/bin/x86_64-linux/xelatex\" -interaction=nonstopmode %.tex"
        echo "[4] Latexmk——\"/usr/local/texlive/$year/bin/x86_64-linux/latexmk\" -e \"\$pdflatex=q/pdflatex -interaction=nonstopmode/\" -pdf %.tex"
        echo "[5] Bib(la)tex——\"/usr/local/texlive/$year/bin/x86_64-linux/bibtex\" %.aux"
        echo "[6] Makeindex——\"/usr/local/texlive/$year/bin/x86_64-linux/makeindex\" %.idx"
        echo "[7] dvips——\"/usr/local/texlive/$year/bin/x86_64-linux/dvips\" -o %.ps %.dvi"
        echo "[8] Dvipdfm——\"/usr/local/texlive/$year/bin/x86_64-linux/dvipdfm\" %.dvi"
        echo "[9] metapost——\"/usr/local/texlive/$year/bin/x86_64-linux/mpost\" --interaction nonstopmode "
        echo "[10] Asymptote——\"/usr/local/texlive/$year/bin/x86_64-linux/asy\" %.asy"
        echo "[11] Add to PATH——/usr/local/texlive/$year/bin/x86_64-linux/"
        echo
        echo "英文论文：选项——配置Texmaker——快速构建——快速构建命令——PdfLaTeX + 查看PDF——OK"
        echo "获取IEEE的模板"
        echo "git clone https://github.com/latextemplates/IEEE.git"
        echo
        echo "中文论文：选项——配置Texmaker——快速构建——快速构建命令——XeLaTeX + 查看PDF——OK"
        echo "获取《计算机学报》的模板"
        echo "git clone https://github.com/CTeX-org/chinesejournal.git"
        echo
        echo "构建引用 BibTeX example.bib"
    elif [ $1 == "0" ]
    then
        error=0
        sudo echo "卸载texlive和texmaker..."
        sudo apt-get --purge remove texmaker -y
        sudo apt-get --purge remove texlive* -y
        sudo apt-get --purge remove tex-common -y
        sudo rm -rf /usr/local/texlive
        sudo rm -rf /usr/local/share/texmf
        sudo rm -rf /var/lib/texmf
        sudo rm -rf /etc/texmf
        sudo rm -rf ~/.texlive*
    fi
elif [ ! -n "$1" ]
then
    error=0
    sudo echo "安装texlive和texmaker..."
    sudo apt-get install texmaker -y
    name=texlive$year.iso
    if [ ! -f "./$name" ]
    then
        echo "正在从网络获取$name"
        read -p "选择国内源（阿里云-1/清华大学-2）" answer
        case $answer in
            1)
                URL=https://mirrors.aliyun.com/CTAN/systems/texlive/Images/texlive.iso
            ;;
            2)
                URL=https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/texlive.iso
            ;;
            *)
                echo "输入错误,已选择阿里云"
            ;;
        esac
        echo -e "\e[32m注意：若在下载过程中突然卡住，依次执行以下命令：\e[0m"
        echo -e "\e[32mCtrl+Z\e[0m"
        echo -e "\e[32mwget -c $URL -O $name\e[0m"
        echo -e "\e[32m./latex.sh\e[0m"
        wget $URL -O $name
    else
        echo "已经获取本地$name"
    fi
    sudo mount -o loop $name /mnt
    cd /mnt
	sudo ./install-tl <<EOF
I
EOF
    cd $currdir
    sudo umount /mnt
    echo
    echo "tex -version"
    tex -version
fi
if [ $error == "1" ]
then
    echo "./latex.sh	安装latex"
    echo "./latex.sh 1	配置latex"
    echo "./latex.sh 0	卸载latex"
    exit
fi