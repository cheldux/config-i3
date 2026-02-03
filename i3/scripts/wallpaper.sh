#!/bin/bash
path=$HOME/Pictures/Wallpapers/
last=$(tail -n 1 $HOME/.fehbg | cut -d \' -f2)
files=($(ls $path))
while
choice=$(($RANDOM%${#files[@]}))
[[ "$last" == "$path${files[$choice]}" ]]
do true
done

feh --bg-scale $path${files[$choice]}
