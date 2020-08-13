#!/bin/bash
sudo apt-get install language-pack-zh-hans
sudo apt-get install fonts-droid-fallback fonts-wqy-zenhei fonts-wqy-microhei fonts-arphic-ukai fonts-arphic-uming
sudo chmod 777 /usr/share/fonts/truetype/*
sudo fc-cache -fv
