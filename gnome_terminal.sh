#!/bin/bash
echo "启动bash终端"
echo "gnome-terminal -- /bin/sh -c 'echo \"test\";sleep 10;exec bash'"
echo "启动zsh终端"
echo "gnome-terminal -- /bin/zsh -c 'echo \"test\";sleep 10;exec zsh'"
gnome-terminal -- /bin/zsh -c 'echo "start1";sleep 10;echo "end1";exec zsh'
gnome-terminal -- /bin/zsh -c 'echo "start2";sleep 10;echo "end2";exec zsh'
gnome-terminal -- /bin/zsh -c 'echo "start3";sleep 10;echo "end3";exec zsh'
