#!/bin/bash

curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
sudo apt install docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker
source ~/.zshrc
rm -fr get-docker.sh
sleep 1
python3 ./docker_menu.py


