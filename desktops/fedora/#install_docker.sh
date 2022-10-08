#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo dnf install docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker
source ~/.zshrc
rm -fr get-docker.sh
sleep 1
python3 ./docker_menu.py


