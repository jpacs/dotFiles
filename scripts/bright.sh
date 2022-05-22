#!/usr/bin/env bash

curB=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)

checkB=`awk -v v1=$curB 'BEGIN { a = v1; b = 0.1; print (a * 100) }'`

echo $checkB

if [ "$checkB" -le 250 ] && [ "$checkB" -ge 20 ]; then
  echo inside
  case $1 in
    - )
        newB=`awk -v v1=$curB 'BEGIN { a = v1; b = 0.1; print (a - b) }'` ;;
    + ) 
        newB=`awk -v v1=$curB 'BEGIN { a = v1; b = 0.05; print (a + b) }'` ;;
  esac
fi

echo $newB

xrandr --output HDMI-0 --brightness $newB
xrandr --output DVI-D-1 --brightness $newB
xrandr --output DVI-D-0 --brightness $newB 