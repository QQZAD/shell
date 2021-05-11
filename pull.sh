#!/bin/bash
echo "https://gitee.com/qqzad/shell.git"
git pull
cd ..
echo "https://gitee.com/qqzad/reuse-code.git"
if [ -d "reuse-code" ]; then
    echo "reuse-code"
    cd reuse-code
    git pull
    cd ..
fi
echo "https://gitee.com/qqzad/termux.git"
if [ -d "termux" ]; then
    echo "termux"
    cd termux
    git pull
    cd ..
fi
echo "https://gitee.com/qqzad/private_shell.git"
if [ -d "private_shell" ]; then
    echo "private_shell"
    cd private_shell
    git pull
    cd ..
fi
echo "https://gitee.com/qqzad/nfv-gpu.git"
if [ -d "nfv-gpu" ]; then
    echo "nfv-gpu"
    cd nfv-gpu
    git pull
    cd ..
fi
