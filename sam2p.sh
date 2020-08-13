#!/bin/bash
sudo apt-get install sam2p -y
echo "将png图片转换为eps图片..."
file_name=$(find ./ -name "*.png")
if [ -n "$file_name" ]
then
	file_names=(${file_name//\ / })
	for i in "${!file_names[@]}"
	do
		str_png=${file_names[i]}
		str_eps_=(${str_png//\./ })
		str_eps="."${str_eps_[0]}".eps"
		echo "find $str_png"
		sam2p $str_png $str_eps
		echo "generate $str_eps"
	done
else
	echo "No png!"
fi

