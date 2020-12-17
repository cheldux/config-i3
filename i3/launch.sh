#!/usr/bin/env sh

killall -q picom
killall -q polybar

while pgrep -x picom >/dev/null; do sleep 1; done
while pgrep -x polybar >/dev/null; do sleep 1; done

picom &
polybar bureau &

