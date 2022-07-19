#!/usr/bin/env bash

nvidia-settings -a [gpu:0]/GPUFanControlState=1
nvidia-settings -a [fan]/GPUTargetFanSpeed=30
