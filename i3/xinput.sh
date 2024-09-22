#!/bin/sh

ID=$(xinput list|grep touch -i|sed -nr 's/.*id=([0-9]*).*/\1/p')
IN_TAP=$(xinput list-props $ID|grep "Tapping Enabled"|grep -v "Default" |sed -nr 's/.*\(([0-9][0-9][0-9])\).*/\1/p')
xinput set-prop $ID $IN_TAP 1
