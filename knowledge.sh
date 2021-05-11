#!/bin/bash
echo -e "\e[32m[算法]\e[0m"
echo
echo "Polynomial Problem"
echo "P问题指的是在多项式时间计算机可以求解的问题"
echo
echo "Nondeterministic Polynomial Problem"
echo "NP问题的解可以在多项式时间内被证实或证伪"
echo "所有P问题都是NP问题"
echo "NP问题的本质是P=NP？"
echo
echo "Nondeterministic Polynomial Complete Problem"
echo "NPC问题指的是NP问题中最难解决的问题"
echo "只要存在一个在多项式时间内可解的NPC问题，那么所有NP问题都可以求解"
echo "正是NPC问题的存在导致P=NP难以置信"
echo
echo "NP-hard Problem"
echo "NP难问题指的是这样的问题（NP难问题不一定是NP问题）"
echo "只要存在一个在多项式时间内可解的问题，那么所有NP问题都可以求解"
echo
echo -e "\e[32m[数学]\e[0m"
echo
echo "可导一定连续,但连续不一定可导(\/),极限0/0的定义"
echo "0<=t<=1"
echo "x和y是f(x)定义域内任意两点"
echo "convex 凸函数 下凸上凹 f\"(x)>=0 f(tx+(1-t)y)<=tf(x)+(1-t)f(y)"
echo "concave 凹函数 上凸下凹 f\"(x)<=0 f(tx+(1-t)y)>=tf(x)+(1-t)f(y)"
echo "简单的说,凸优化要求优化问题中的目标函数和约束函数是凸函数"
echo "凸集的定义:对于集合内的每一对点,连接该对点的直线段上的每个点也在该集合内,封闭性"
echo "驻点的定义:一阶导数为0,可导函数的极值点一定是驻点,驻点不一定是极值点"
echo "不可导点的左右极限不相等,不可导点左右的单调性发生改变则是极值点"
echo "极小值点需要考察驻点和不可导点"
echo "拐点的定义:二阶导数为0,该点左右的凹凸性不同,且一阶导数的变化趋势相反"
echo "对于凸函数而言,驻点就是极小值点,极小值点就是最小值点,所以局部最优就是全局最优"
echo
echo "卷积的定义"
echo "(f*g)(t)=∫[-∞,+∞]f(x)g(t-x)dx"
echo "(f*g)(t)=∑[x=-∞,+∞]f(x)g(t-x)"
echo
echo "张量是有大小和多个方向的量"
echo "张量所表示的几何对象不会随着坐标系发生变化"
echo "这里的方向数就是指张量的阶数"
echo "张量的阶数小于等于空间的维数"
echo "零阶张量：标量"
echo "一阶张量：矢量"
echo "二阶张量：矩阵"
echo
echo "对于多元函数，偏导数考察因变量与选定变量之间的变化关系"
echo "偏导数表示多元函数沿某个坐标轴方向的导数"
echo "多元函数在非坐标轴方向的导数被称为方向导数"
echo "梯度是一个矢量，考察函数上的一点，函数在该方向的方向导数最大，变化率最大"
echo "梯度函数为∇ f(x,y)"
echo
echo "贝尔数"
echo "B0=B1=1"
echo "假设集合中元素的数量为n"
echo "将该集合划分为m个两两不相交的非空子集"
echo "其中m<=n，划分方法共有Bn种"
echo "Bn+1=∑[k=0,n]C(n,k)Bk"
echo
echo "条件概率公式"
echo "A的发生由B引起"
echo "P(A|B)=P(AB)/P(B)"
echo "A的发生由Bi(i=1,...,n)共同引起"
echo "P(ABi)=P(Bi)P(A|Bi)"
echo
echo "全概率公式"
echo "P(A)=∑[i=1,n]P(ABi)"
echo "P(A)=∑[i=1,n]P(Bi)P(A|Bi)"
echo
echo "贝叶斯公式"
echo "P(Bi|A)=P(ABi)/P(A)"
echo "P(Bi|A)=(P(Bi)P(A|Bi))/(∑[j=1,n]P(Bj)P(A|Bj))"
