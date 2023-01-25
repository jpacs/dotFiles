#!/usr/bin/env bash

curB=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)

checkB=`awk -v v1=$curB 'BEGIN { a = v1; b = 0.1; print (a * 100) }'`

#echo $checkB

if [ "$checkB" -le 150 ] && [ "$checkB" -ge 19 ]; then
  #echo inside
  case $1 in
    - )
        newB=`awk -v v1=$curB 'BEGIN { a = v1; b = 0.05; print (a - b) }'` ;;
    + ) 
        newB=`awk -v v1=$curB 'BEGIN { a = v1; b = 0.05; print (a + b) }'` ;;
    * )
        newB=1 ;;
  esac
fi

#echo $newB

xrandr --output DP-0 --brightness $newB
#xrandr --output DVI-D-1 --brightness $newB
#xrandr --output DVI-D-0 --brightness $newB 
