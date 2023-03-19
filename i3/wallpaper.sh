#!/bin/bash
path=$HOME/Pictures/Wallpapers/
files=($(ls $path))
choice=$(($RANDOM%${#files[@]}))
feh --bg-scale $path${files[$choice]}
