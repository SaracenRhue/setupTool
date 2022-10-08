#!/bin/bash

    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt remove python -y
    sudo apt install python3 pip wget curl htop -y

source ~/.bashrc
source ~/.zshrc

python3 ./debian.py