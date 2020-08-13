#!/bin/bash
./new.sh
sudo apt-get -y install make
sudo apt-get -y install gcc
sudo apt-get -y install g++
sudo apt-get -y install git
sudo apt-get -y install net-tools
sudo apt-get -y install vim
sudo apt-get -y install htop
sudo apt-get -y install wireshark
sudo apt-get -y install openssl
sudo apt-get -y install libssl-dev
sudo apt-get -y install python
sudo apt-get -y install python3
sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
pip install --upgrade pip
pip3 install --upgrade pip
openssl version -a
sudo apt-get -y install screen
sudo apt-get -y install gparted
screen -version
./clean.sh
