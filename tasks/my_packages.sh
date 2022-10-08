#!/bin/bash

# progrmams
PKGS=(
'brave'
'vscode'
'github-desktop'
'discord'
'nextcloud-client'
'resilio-sync'

)
for PKG in "${PKGS[@]}"; do
    nix-env -iA nixpkgs.$PKG
done

# software
PKGS=(
'go'
'kotlin'
'nodejs'
'nodePackages.npm'
)
for PKG in "${PKGS[@]}"; do
    nix-env -iA nixpkgs.$PKG
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