#!/bin/bash
echo "shell"
git pull;cd ..
if [ -d "reuse-code" ]
then
    echo "reuse-code"
    cd reuse-code;git pull;cd ..
fi
if [ -d "termux" ]
then
    echo "termux"
    cd termux;git pull;cd ..
fi
if [ -d "private_shell" ]
then
    echo "private_shell"
    cd private_shell;git pull;cd ..
fi
if [ -d "NFV-GPU" ]
then
    echo "NFV-GPU"
    cd NFV-GPU;git pull;cd ..
fi