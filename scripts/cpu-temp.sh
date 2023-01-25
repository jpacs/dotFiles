#!/bin/sh
#sensors | grep "Package id 0:" | tr -d '+' | awk '{printf "CPU "$4}' && nvidia-smi -q | grep "GPU Current Temp" | awk '{print " GPU "$5".0°"$6}'
sensors | grep "AMD TSI Addr 98h:" | tr -d '+' | awk '{printf "CPU "$5}' && nvidia-smi -q | grep "GPU Current Temp" | awk '{print " GPU "$5".0°"$6}'
