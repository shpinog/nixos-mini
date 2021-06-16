#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom --experimental-backends
run /home/shpinog/.screenlayout/fix.sh
run quiterss
#run kotatogram-desktop 
run flameshot
run paramano
run volctl
run xbindkeys --poll-rc
run udiskie --no-automount --no-notify --tray
run claws-mail
