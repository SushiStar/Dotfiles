#!/bin/bash/
cd /usr/share/X11/xkb/symbols/
sudo cp ~/Dotfiles/keymap/pc_bk pc
sudo cp ~/Dotfiles/keymap/us_bk us
setxkbmap -layout us
