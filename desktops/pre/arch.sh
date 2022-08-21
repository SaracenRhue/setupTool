#!/bin/bash

sudo pacman -Syu --noconfirm
packman -S --noconfirm wget curl python3 python-pip

# yay setup
sudo pacman -S --noconfirm git base-devel # install yay
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:users ./yay
sudo chown -W $USER:users ./yay
cd yay
makepkg -si
cd ../
sudo rm -fr yay

source ~/.bashrc
source ~/.zshrc

python3 ./arch.py