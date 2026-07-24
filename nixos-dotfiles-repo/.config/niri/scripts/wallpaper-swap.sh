#!/bin/sh

waypaper
current_wallpaper=$(waypaper --list | grep -oP "("wallpaper"....\K).*(\S.*\.png)")
mkdir -p ~/.local/share/swaylock
rm -f ~/.local/share/swaylock/lock_screen.png
cp -f $current_wallpaper ~/.local/share/swaylock/lock_screen.png
