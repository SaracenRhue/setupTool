#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt remove python -y
sudo apt install python3 pip wget curl htop -y

if [ -n "$ZSH_VERSION" ]; then
    sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
    bash -c "$(https://raw.githubusercontent.com/SaracenRhue/setupTool/main/tasks/setup_zsh.sh)"
fi

source ~/.bashrc
source ~/.zshrc

bash -c "$(https://raw.githubusercontent.com/SaracenRhue/setupTool/main/tasks/install_nix.sh)"

python3 ./main.py debian