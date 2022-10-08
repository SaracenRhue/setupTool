#!/bin/bash

# yay setup
sudo pacman -S --noconfirm base-devel
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:users ./yay
sudo chown -W $USER:users ./yay
cd yay
makepkg -si
cd ../
sudo rm -fr yay