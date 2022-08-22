#!/bin/bash

sudo apt install software-properties-common apt-transport-https -y
    sudo curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
    wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null

    sudo apt update -y
    sudo apt upgrade -y
    

PKGS=(
'arc'
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
'code'
'openjdk-17-jdk'
'papirus-icon-theme'
)
         
for PKG in "${PKGS[@]}"; do
    sudo apt install -y $PKG
done

    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
    sudo rm -fr zoom_amd64.deb

wget https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run
sh pia-linux-3.3.1-06924.run
sudo rm -fr pia-linux-3.3.1-06924.run

sudo apt autoremove -y