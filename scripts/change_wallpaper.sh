#!/bin/bash

WALLPAPERS_DIR="$HOME/wallpapers"
INTERVAL=10

while true; do
  WALLPAPERS=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

  feh --bg-scale "$WALLPAPER"

  sleep $((INTERVAL * 60))
done
