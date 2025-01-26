#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"
INTERVAL=10

while true; do
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

  feh --bg-scale "$WALLPAPER"

  sleep $((INTERVAL * 60))
done
