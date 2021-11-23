#!/bin/bash/
cd /usr/share/X11/xkb/symbols/
sudo cp ~/Dotfiles/keymap/pc pc
sudo cp ~/Dotfiles/keymap/us us
setxkbmap -layout us
