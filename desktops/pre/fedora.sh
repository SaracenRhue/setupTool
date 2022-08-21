#!/bin/bash

sudo dnf update -y
sudo dnf upgrade -y
sudo dnf remove python -y
sudo dnf install python3 pip wget curl -y

source ~/.bashrc
source ~/.zshrc

python3 ./fedora.py