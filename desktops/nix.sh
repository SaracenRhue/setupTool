#!/bin/bash
export NIXPKGS_ALLOW_UNFREE=1
nix-env -u
nix-env -iA nixos.python311
nix-env -iA nixos.python310Packages.pick
nix-env -iA nixos.python310Packages.pyyaml
##########################################
PKGS=(
'vscode'
'discord'
'github-desktop'
'gparted'
'krusader'
'nextcloud-client'
'firefox'
'brave'
'vlc'
'tor-browser'
'private-internet-access'
'resilio-sync'
'zoom'
'nodejs'
'nodePackages.npm'
'jre8'
'libvirt'
'tree'
'timeshift'
'sshpass'
'cmatrix'
)
for PKG in "${PKGS[@]}"; do
    nix-env -iA nixos.$PKG
done
##########################################
PKGS=(
'pyyaml'
'pick'
'eel'
'beautifulsoup4'
'icecream'
'discord'
'selenium'
'pyautogui'
'pygame'
)
for PKG in "${PKGS[@]}"; do
    python310Packages.$PKG
done

#python main.py nix