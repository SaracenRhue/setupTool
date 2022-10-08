#!/bin/bash

# software
PKGS=(
'brave'
'vscode'
'github-desktop'
'discord'
'nextcloud-client'
'resilio-sync'
'go'
'kotlin'
'nodejs'
'nodePackages.npm'
)
for PKG in "${PKGS[@]}"; do
    nix-env -iA nixpkgs.$PKG
done

#python modules
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

# npm
PKGS=(
'@angular/cli'
'typescript'
'sass'
)
for PKG in "${PKGS[@]}"; do
    npm install -g $PKG
done