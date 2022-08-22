#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo apt install docker-compose -y
sudo systemctl enable docker
source ~/.zshrc
rm -fr get-docker.sh
sleep 1
python3 ./docker_menu.py


