#!/bin/bash

#update system
sudo dnf -y update && sudo dnf -y upgrade
sudo dnf install -y python3 python3-pip curl wget htop
groupinstall 'Development Tools'

if [ -n "$ZSH_VERSION" ]; then
    sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
    bash -c "$(https://raw.githubusercontent.com/SaracenRhue/setupTool/main/tasks/setup_zsh.sh)"
fi

source ~/.bashrc
source ~/.zshrc

bash -c "$(https://raw.githubusercontent.com/SaracenRhue/setupTool/main/tasks/install_nix.sh)"

python3 main.py fedora