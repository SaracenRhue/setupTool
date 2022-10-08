#!/bin/bash

#update system
sudo dnf -y update && sudo dnf -y upgrade
sudo dnf install -y python3 python3-pip curl wget htop

if [ -n "$ZSH_VERSION" ]; then
    sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
    echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
    sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
    curl -L http://install.ohmyz.sh | sh
    chsh -s $(which zsh)
    echo "neofetch" >> ~/.zshrc
fi

source ~/.bashrc
source ~/.zshrc

python3 main.py fedora