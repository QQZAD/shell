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
        echo "24个希腊字母"
        echo "阿尔法    Αα  \alpha"
        echo "贝塔      Ββ  \beta"
        echo "伽马      Γγ  \Gamma\gamma"
        echo "德尔塔    Δδ  \Delta\delta"
        echo "伊普西龙  Εε  \epsilon\varepsilon"
        echo "截塔      Ζζ  \zeta"
        echo "艾塔      Ηη  \eta"
        echo "西塔      Θθ  \Theta\theta\vartheta"
        echo "约塔      Ιι  \iota"
        echo "卡帕      Κκ  \kappa"
        echo "兰布达    Λλ  \Lambda\lambda"
        echo "缪        Μμ  \mu"
        echo "纽        Νν  \nu"
        echo "克西      Ξξ  \Xi\xi"
        echo "奥密克戎  Οο"
        echo "派        Ππ  \Pi\pi\varpi"
        echo "肉        Ρρ  \rho\varrho"
        echo "西格马    Σσς  \Sigma\sigma\varsigma"
        echo "套        Ττ  \tau"
        echo "宇普西龙  Υυ  \Upsilon\upsilon"
        echo "佛爱      Φφ  \Phi\phi\varphi"
        echo "西        Χχ  \chi"
        echo "普西      Ψψ  \Psi\psi"
        echo "欧米伽    Ωω  \Omega\omega"
        echo
        echo "二元关系和二元运算符"
        echo "\usepackage{amsmath,amssymb,amsfonts}"
        echo "≤ \leq"
        echo "≥ \geq"
        echo "≡ \equiv"
        echo "≠ \not=\neq"
        echo "≃ \simeq"
        echo "≈ \approx"
        echo "∈ \in"
        echo "∉ \not\in"
        echo "∋ \ni"
        echo "∀ \forall"
        echo "∃ \exists"
        echo "\mathbb{T} = \{1, 2, ...,10\}"
        echo "⊂ \subset"
        echo "⊃ \supset"
        echo "⊆ \subseteq"
        echo "⊇ \supseteq"
        echo "| \mid"
        echo "\{x \mid x \notin \mathbb{T}, x\in \mathbb{N}\}"
        echo "∅ \varnothing"
        echo "集合A的闭包 \overline{\mathbb{A}}"
        echo "集合A减集合B \mathbb{A}\setminus\mathbb{B}"
        echo "· \cdot"
        echo "÷ \div"
        echo "× \times"
        echo "∪ \cup"
        echo "∩ \cap"
        echo "← \gets"
        echo "→ \to"
        echo
        echo "大运算符"
        echo "∑ \sum_{i=1}^{n}{(x_i+y_i)}"
        echo "∏ \prod_{i=1}^{n}{(x_i+y_i)}"
        echo "∪ \bigcup_{i=1}^{n}{X_i}"
        echo "∩ \bigcap_{i=1}^{n}{X_i}"
        echo
        echo "文字中的公式"
        echo "$\mathbb{T} = \{1, 2, ...,10\}$"
        echo
        echo "简单数学公式"
        echo "\begin{equation}"
        echo "x^i_{j,k}=\frac{i}{j \cdot k} \label{equation1}"
        echo "\end{equation}"
        echo
        echo "数学模型目标和约束"
        echo "\begin{align}"
        echo "\begin{split}"
        echo "\mathop{\arg\min}_{x_i,y_i,z_i}"
        echo "&\quad \sum_{i=1}^{n}{(x_i + y_i)} + \sum_{i=1}^{n}{(x_i - z_i)} + \sum_{i=1}^{n}{(w_i)} +\\\\"
        echo "&\quad \sum_{i=1}^{n}{(y_i \cdot s_i)} + \sum_{i=1}^{n}{(z_i \div t_i)} \label{eq:obj}"
        echo "\end{split}\\\\"
        echo "\textrm{s.t.}:"
        echo "&\quad \sum_{i=1}^{n}{x_i}=1, \forall i \in \mathbb{U} \label{eq:constraint_1}\\\\"
        echo "&\quad \sum_{i=1}^{n}{(x_i+y_i)}\leq 1, \forall i \in \mathbb{U} \label{eq:constraint_2}\\\\"
        echo "&\quad \sum_{i=1}^{n}{(x_i+y_i+z_i)}\geq 1, \forall i \in \mathbb{U} \label{eq:constraint_3}."
        echo "\end{align}"
        echo
        echo "\usepackage{amsthm}"
        echo "引理"
        echo ".tex文件头部添加一次\newtheorem{lemma}{Lemma}[section]"
        echo "\begin{lemma} \label{lemma_1}"
        echo "A lemma is a statement used to prove a theorem or to solve a problem. There is no strict distinction between a lemma and a theorem. If a proposition is proved without a direct basis and some unproved conclusion is needed to prove it, it is called a construction lemma."
        echo "\end{lemma}"
        echo
        echo "定理"
        echo ".tex文件头部添加一次\newtheorem{thm}{Theorem}[section]"
        echo "\begin{thm} \label{theorem_1}"
        echo "A theorem is a statement that has been proved to be true by a logical constraint. Generally speaking, in mathematics, only important or interesting statements are called theorems. Proving theorems is the central activity of mathematics."
        echo "\end{thm}"
        echo
        echo "证明"
        echo "将证毕符号改为黑色方框"
        echo ".tex文件头部添加一次\renewcommand{\qedsymbol}{$\blacksquare$}"
        echo "\begin{proof} \label{proof_1}"
        echo "In mathematics, proof is the process of deriving certain propositions from axioms and theorems according to certain rules or standards in a particular axiom system."
        echo "\end{proof}"
        echo "在\begin{proof} \label{proof_1}后面添加<span style=\"background-color: rgb(255, 0, 0);\">\renewcommand{\qedsymbol}{}</span>来取消证毕符号"
        echo
        echo "假设"
        echo ".tex文件头部添加一次\newtheorem{assumption}{Assumption}[section]"
        echo "\begin{assumption} \label{assumption_1}"
        echo "A statement is considered correct in the absence of evidence. These are the basic building blocks from which all theorems are proved, and the famous assumptions are generally called postulates or axioms."
        echo "\end{assumption}"
        echo
        echo "推论"
        echo ".tex文件头部添加一次\newtheorem{corollary}{Corollary}[section]"
        echo "\begin{corollary} \label{corollary_1}"
        echo "A usually short result whose proof depends heavily on a given theorem, which is an inevitable result of a theorem."
        echo "\end{corollary}"
        echo
        echo "为了将引理、定理、假设和推论的编号改为阿拉伯数字，需要在他们所在的节\section{Introduction}前后分别添加"
        echo "\renewcommand\thesection{\Roman{section}}"
        echo "\section{Introduction}"
        echo "\renewcommand\thesection{\arabic{section}}"
        echo
        echo "算法排版"
        echo "\usepackage[ruled,vlined,linesnumbered]{algorithm2e}"
        echo "\SetKw{Break}{break}"
        echo "\SetKw{Continue}{continue}"
        echo "\begin{algorithm}"
        echo "\label{algorithm_1}"
        echo "\caption{algorithm caption}"
        echo "\KwIn{\$x_i\$, \$y_i\$ and \$A\$}"
        echo "\KwOut{\$z_i\$}"
        echo "\For{condition}{"
        echo "	\If{condition}{"
        echo "		\$x \gets 1$\;"
        echo "	}"
        echo "	\uIf{condition}{"
        echo "		\Break\;"
        echo "	}"
        echo "	\Else{"
        echo "		\Continue\;"
        echo "	}"
        echo "}"
        echo "\While{not at end of this document}{"
        echo "	\eIf{condition}{"
        echo "		code 1\;"
        echo "	}{"
        echo "		code 2\;"
        echo "	}"
        echo "}"
        echo "\ForEach{condition}"
        echo "{"
        echo "	\uIf{condition 1}{"
        echo "    	code 1\;"
        echo "	}"
        echo "	\uElseIf{condition 2}{"
        echo "    	code 2\;"
        echo "	}"
        echo "	\uElseIf{condition 3}{"
        echo "    	code 3\;"
        echo "	}"
        echo "	\Else{"
        echo "		code 4\;"
        echo "	}"
        echo "}"
        echo "\BlankLine"
        echo "\SetKwProg{Fn}{function}{}{}"
        echo "\Fn{func (arg1, arg2)}{"
        echo "	\ForAll{condition}"
        echo "	{"
        echo "		\lIf{condition 1}{"
        echo "    		code 1\\"
        echo "		}"
        echo "		\lElseIf{condition 2}{"
        echo "    		code 2\\"
        echo "		}"
        echo "		\lElseIf{condition 3}{"
        echo "    		code 3\\"
        echo "		}"
        echo "		\lElse{"
        echo "			code 4\\"
        echo "		}"
        echo "	}"
        echo "	\Return \$z_i\$\;"
        echo "}"
        echo "\end{algorithm}"
        echo
        echo "函数排版"
        echo "\usepackage[ruled,vlined,linesnumbered]{algorithm2e}"
        echo "\SetKw{Break}{break}"
        echo "\SetKw{Continue}{continue}"
        echo "\begin{function}"
        echo "\label{function_1}"
        echo "\caption{Runtime(worker\_id)}"
        echo "\textit{request\_buffer} $\gets$ requests\_buffers[worker\_id]\\\\"
        echo "\textit{timeslot\_buffer} $\gets$ timeslot\_buffers[worker\_id]\\\\"
        echo "\While{true}{"
        echo "	\If{batch\_prepared() == true}{"
        echo "		Send a request via \textit{request\_buffer}\\\\"
        echo "	}"
        echo "	\textit{timeslot} $\gets$ Get from \textit{timeslot\_buffer}\\\\"
        echo "	\If{timeslot == NULL}{"
        echo "		\Continue\\\\"
        echo "	}"
        echo "	\While{true}{"
        echo "		\textit{cur\_time} $\gets$ Get system clock\\\\"
        echo "		\If{cur\_time $\geq$ timeslot}{"
        echo "			Start data transfer\\\\"
        echo "			\Break\\\\"
        echo "		}"
        echo "	}"
        echo "}"
        echo "\end{function}"
        echo
        echo "当引用公式、引理、定理、证明、假设、推论、算法和函数时用\ref{label}"
        echo
        echo "代码排版"
        echo "\usepackage{listings}"
        echo "\lstset{%"
        echo "  basicstyle=\ttfamily,%"
        echo "  columns=fixed,%"
        echo "  basewidth=.5em,%"
        echo "  xleftmargin=0.5cm,%"
        echo "  captionpos=b}%"
        echo "\usepackage[capitalise,nameinlink]{cleveref}"
        echo "\crefname{lstlisting}{\lstlistingname}{\lstlistingname}"
        echo "\Crefname{lstlisting}{Listing}{Listings}"
        echo
        echo "\begin{lstlisting}["
        echo "  caption={Example C++ Listing},"
        echo "  language=C++,"
        echo "  label=L1]"
        echo "#include <iostream>"
        echo "using namespace std;"
        echo "int main(){"
        echo "    cout << \"Hello world!\" << endl;"
        echo "}"
        echo "\end{lstlisting}"
        echo "引用该代码\Cref{L1}"
        echo
        echo "图片的使用"
        echo "占据两版"
        echo "\begin{figure*}"
        echo "\centering"
        echo "\includegraphics[width=0.80\textwidth]{figure.eps}"
        echo "\caption{figure caption}"
        echo "\label{figure_label}"
        echo "\end{figure*}"
        echo "占据一版"
        echo "\begin{figure}"
        echo "\centering"
        echo "\includegraphics[width=0.40\textwidth]{figure.eps}"
        echo "\caption{figure caption}"
        echo "\label{figure_label}"
        echo "\end{figure}"
        echo
        echo "表格的使用"
        echo "在.tex头文件头部添加一次\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}"
        echo "占据两版"
        echo "\begin{table*}"
        echo "\caption{table caption}"
        echo "\label{table_label}"
        echo "\centering"
        echo "\begin{tabular}{ccc}"
        echo "\toprule"
        echo "\tabincell{c}{The value of\\\\the horizontal\\\\table entry} &"
        echo "\tabincell{c}{The value of\\\\entry 1 in\\\\the vertical direction} &"
        echo "\tabincell{c}{The value of\\\\entry 2 in\\\\the vertical direction} \\\\"
        echo "\midrule"
        echo "The first line & O & O \\\\"
        echo "\midrule"
        echo "The second line & X & X \\\\"
        echo "\bottomrule"
        echo "\end{tabular}"
        echo "\end{table*}"
        echo "占据一版"
        echo "\begin{table}"
        echo "\caption{table caption}"
        echo "\label{table_label}"
        echo "\centering"
        echo "\begin{tabular}{ccc}"
        echo "\toprule"
        echo "\tabincell{c}{The value of\\\\the horizontal\\\\table entry} &"
        echo "\tabincell{c}{The value of\\\\entry 1 in\\\\the vertical direction} &"
        echo "\tabincell{c}{The value of\\\\entry 2 in\\\\the vertical direction} \\\\"
        echo "\midrule"
        echo "The first line & O & O \\\\"
        echo "\midrule"
        echo "The second line & X & X \\\\"
        echo "\bottomrule"
        echo "\end{tabular}"
        echo "\end{table}"
        echo
        echo "使用BibTeX为论文添加参考文献"
        echo "1. 在.tex同级目录下建立example.bib文件"
        echo "2. 在.tex中添加\bibliography{example}"
        echo "3. 为一篇参考文献指定一个自定义的唯一标识符cite_paper"
        echo "4. 在需要引用该参考文献处添加\cite{cite_paper}"
        echo "5. 下载该参考文献对应的BibTeX并复制到.bib中，将@...后面修改为{cite_paper,的形式"
        echo "6. 参考文献为网页时，"
        echo "（1）在.tex文件中添加\usepackage{url}"
        echo "（2）在example.bib文件中添加以下内容"
        echo "@Misc{cite_web,"
        echo "  howpublished = \"Website\","
        echo "  note = {\url{https://www.khronos.org/registry/OpenCL/}},"
        echo "  title = {Khronos OpenCL Registry},"
        echo "  author = {khronos.org}"
        echo "}"
        echo "7. 将快速构建切换为BibTeX 运行"
        echo "8. 将BibTeX切换为快速构建 运行"
        echo "9. 若没有成功多次重复7-8"
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