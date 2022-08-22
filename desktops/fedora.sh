#!/bin/bash

#update system
sudo dnf -y update && sudo dnf -y upgrade
sudo dnf install -y python3 curl wget

source ~/.bashrc
source ~/.zshrc

python3 fedora.py