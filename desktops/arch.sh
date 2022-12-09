#!/bin/bash

sudo pacman -Syu --noconfirm

packman -S --noconfirm wget curl python3 python-pip htop papirus-icon-theme bash-completion
pip3 install pick pyyaml
# yay setup
sudo pacman -S --noconfirm base-devel
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:users ./yay
sudo chown -W $USER:users ./yay
cd yay
makepkg -si
cd ../
sudo rm -fr yay

if [ -n "$ZSH_VERSION" ]; then
    sudo pacman -S --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
    echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
    sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    echo "ZSH_THEME='powerlevel10k/powerlevel10k'" >> ~/.zshrc
    curl -L http://install.ohmyz.sh | sh
    chsh -s $(which zsh)
    echo "neofetch" >> ~/.zshrc
fi


source ~/.bashrc
source ~/.zshrc
python3 ./main.py arch


