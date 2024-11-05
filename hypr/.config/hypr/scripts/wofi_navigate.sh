#!/bin/bash

direction=$1

if [ "$direction" == "up" ]; then
  xdotool key up
elif [ "$direction" == "down" ]; then
  xdotool key down
if

