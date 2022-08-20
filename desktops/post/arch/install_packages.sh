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
)
         
for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done