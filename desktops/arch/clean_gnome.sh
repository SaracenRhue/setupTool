#!/bin/bash

PKGS=(
'cheese'
'xdg-desktop-portal-gnome'
'gnome-books' 
'gnome-calculator'
'gnome-calendar'
'gnome-characters'
'gnome-clocks'
'gnome-color-manager'
'gnome-contacts'
'gnome-font-viewer'
'gnome-getting-started-docs'
'gnome-keyring'
'gnome-logs'
'gnome-maps'
'gnome-music'
'gnome-photos'
'gnome-software'
'gnome-system-monitor'
'gnome-user-docs'
'gnome-video-effects'
'gnome-weather'
'yelp'
'python'
'chromium'
'totem'
'epiphany'
)
for PKG in "${PKGS[@]}"; do
    yay -R --noconfirm $PKG
done