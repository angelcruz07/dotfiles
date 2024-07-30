#!/bin/bash

# Spectrwm autostart script
feh --bg-scale ~/wallpapers/minimal.png
trayer \
  --monitor primary \
  --edge top \
  --widthtype pixel \
  --width 100 \
  --heighttype pixel \
  --height 18 \
  --align right \
  --margin 455 \
  --transparent true \
  --alpha 0 \
  --tint 0x0F101A \
  --iconspacing 3 \
  --distance 1 &
