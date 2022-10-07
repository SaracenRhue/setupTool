#!/bin/bash

#update system
sudo dnf -y update && sudo dnf -y upgrade
sudo dnf install -y python3 python3-pip curl wget htop
groupinstall 'Development Tools'

source ~/.bashrc
source ~/.zshrc

python3 fedora.py