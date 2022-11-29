#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt remove python -y
sudo apt install python3 pip wget curl htop -y
pip3 install pick

if [ -n "$ZSH_VERSION" ]; then
    sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
    echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
    sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
    curl -L http://install.ohmyz.sh | sh
    chsh -s $(which zsh)
    echo "neofetch" >> ~/.zshrc
fi


source ~/.bashrc
source ~/.zshrc

python3 ./main.py debian