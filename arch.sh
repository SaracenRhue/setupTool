#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed terminus-font
setfont ter-v22b

sudo pacman -S --noconfirm wget curl python3 python-pip htop

if [ -n "$ZSH_VERSION" ]; then
    sudo pacman -S --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
    bash -c "$(https://raw.githubusercontent.com/SaracenRhue/setupTool/main/tasks/setup_zsh.sh)"
fi

source ~/.bashrc
source ~/.zshrc

bash -c "$(https://raw.githubusercontent.com/SaracenRhue/setupTool/main/tasks/install_nix.sh)"

python3 ./main.py arch
