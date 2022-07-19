#!/usr/bin/env bash

if [[ -n $(setxkbmap -query | grep intl) ]]; then
  setxkbmap -model pc105 -layout us
else
  setxkbmap -model pc105 -layout us -variant intl
fi
