#!/bin/bash

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
printf "[vscode]\nname=packages.microsoft.com\nbaseurl=https://packages.microsoft.com/yumrepos/vscode/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscode.repo




sudo apt update -y
sudo apt upgrade -y
    

PKGS=(
'arc'
'code'
'tor'
'gparted'
'htop'
'net-tools'
'nextcloud-desktop'
'terminator'
'thunderbird'
'timeshift'
'vlc'
'tree'
'nodejs'
'npm'
'krusader'
'brave-browser'
'openjdk-17-jdk'
)
         
for PKG in "${PKGS[@]}"; do
    sudo dnf install $PKG -y
done

