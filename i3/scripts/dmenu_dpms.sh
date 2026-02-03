#!/usr/bin/bash

theme="-sb #2F5ED0 -sf #fff -nb #214291"

state=$(xset q | grep DPMS | tail -n1 | awk '{print $3}')
if [ $state = 'Enabled' ]
then
	oposite='Disable'
else
	oposite='Enable'
fi

choice=$(echo -e "Yes\nNo" | dmenu $theme -i -p "Screensaver is $state, $oposite it ?")
if [ $choice ]
then
	if [ $choice = 'Yes' ]
	then
		if [ $state = 'Enabled' ]
		then
				xset -dpms
		else
				xset +dpms
		fi
	fi
fi
