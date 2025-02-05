#!/bin/bash

# baraction.sh for spectrwm status bar
# https://github.com/conformal/spectrwm

# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

icon() {
  echo -n "+@fg=1;$1+@fg=0;"
}

percentage() {
  current=$(echo $1 | sed 's/%//')
  if [ $current -le 25 ]; then
    echo -n "$(icon $2)"
  elif [ $current -le 50 ]; then
    echo -n "$(icon $3)"
  elif [ $current -le 75 ]; then
    echo -n "$(icon $4)"
  else
    echo -n "$(icon $5)"
  fi
}

sleep_sec=2
i=0
while :; do
  # Updates
  if (($i % 60 == 0)); then
    updates=$(checkupdates | wc -l)
  fi
  echo -n "$(icon ) $updates "

  # Volume
  vol=$(pamixer --get-volume)
  if [[ $(pamixer --get-mute) == "true" ]]; then
    echo -n "$(icon ﱝ) $vol% "
  else
    echo -n "$(percentage $vol  奔 墳 ) $vol% "
  fi

  # Battery

  # Date
  if (($i % 60 == 0)); then
    dte="$(date +"$(icon ) %d/%m/%Y $(icon ) %H:%M")"
  fi
  echo -e "$dte"

  sleep $sleep_sec
  ((i += $sleep_sec))
done
