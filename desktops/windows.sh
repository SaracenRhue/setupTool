#!/bin/bash

# packages
scoop bucket add java
PKGS=(
'python310'
'nodejs'
'go'
'rust'
'openjdk'
'kotlin'
)      
for PKG in "${PKGS[@]}"; do
    scoop install $PKG
done

# npm packages
PKGS=(
'typescript'
'sass'
'@angular/cli'
)      
for PKG in "${PKGS[@]}"; do
    npm install -g $PKG
done

# python modules
PKGS=(
'selenium'
'eel'
'pyautogui'
'pyyaml'
'pygame'
'Pillow'
)      
for PKG in "${PKGS[@]}"; do
    pip3 install $PKG
done

# programs
PKGS=(
'vscode'
'brave'
'firefox'
'discord'
'github'
'vlc'
'pia-desktop'
'wox'
'bitwarden'
'7zip'
'winrar'
)
for PKG in "${PKGS[@]}"; do
    scoop install $PKG
done