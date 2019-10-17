#!/bin/bash
# Init-Arch
# author Tobias Fried
# created 2019.10.15

# An initialization script for arch-based systems

# CHROMIUM
sudo yay -S chromium chromium-widevine
sed -i 's/Pale Moon/chromium/g' ~/.config/mimeapps.list # set to default web file handler
sed -i 's/\(bindsym $mod+F2\).*/\1 exec chromium/g' ~/.i3/config # set default browser shortcut

# MAKEPKG
sudo sed -i 's/MAKEFLAGS=.*/MAKEFLAGS="\-j$(nproc)"/g' /etc/makepkg.conf # enable multithreading
