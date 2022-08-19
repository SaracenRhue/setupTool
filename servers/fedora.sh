#!/bin/bash

#update system
sudo dnf -y update && sudo dnf -y upgrade
sudo dnf install -y python3 curl htop

#zsh
sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)
source ~/.zshrc

echo "neofetch" >> ~/.zshrc

#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo dnf install docker-compose -y
sudo systemctl enable docker
source ~/.zshrc


python3 ./main.py


sleep 1
echo "reboot in 5 seconds..." && sleep 1
echo "reboot in 4 seconds..." && sleep 1
echo "reboot in 3 seconds..." && sleep 1
echo "reboot in 2 seconds..." && sleep 1
echo "reboot in 1 seconds..." && sleep 1
sudo reboot