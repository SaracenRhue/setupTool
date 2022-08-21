#!/bin/bash

PKGS=(
'arc'
'bash-completion'
'brave-browser'
'vlc'
'cmatrix'
'curl'
'discord'
'firefox'
'github-desktop-bin'
'gparted'
'grub'
'grub-btrfs'
'htop'
'krusader'
'nodejs'
'npm'
'jre-openjdk'
'nextcloud-client'
'pyenv'
'thunderbird'
'timeshift'
'tor-browser'
'tree'
'visual-studio-code-bin'
'wget'
'zoom'
'papirus-icon-theme'
)
         
for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

wget https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run
sh pia-linux-3.3.1-06924.run
sudo rm -fr pia-linux-3.3.1-06924.run