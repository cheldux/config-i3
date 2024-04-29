#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ff00ffcc'
TEXT='#242424ee'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'
IMG=$HOME/Pictures/lock.png

i3lock \
-e \
--pointer=default \
--color=$BLANK \
--image=$IMG \
-C \
\
--insidever-color=$CLEAR \
--ringver-color=$VERIFYING \
\
--insidewrong-color=$CLEAR \
--ringwrong-color=$WRONG \
\
--inside-color=$BLANK \
--ring-color=$DEFAULT \
--line-color=$BLANK \
--separator-color=$DEFAULT \
\
--verif-color=$TEXT \
--wrong-color=$TEXT \
--time-color=$TEXT \
--date-color=$TEXT \
--layout-color=$TEXT \
--keyhl-color=$WRONG \
--bshl-color=$WRONG \
\
--screen 0 \
--clock \
--indicator \
\
--time-str="%H:%M:%S" \
--date-str="%Y-%m-%d" \
--time-pos="ix:iy+125" \
\
--greeter-text="Welcome back" \
--greeter-color=$TEXT \
--greeter-pos="ix:iy-105" \
--keylayout 1 \
