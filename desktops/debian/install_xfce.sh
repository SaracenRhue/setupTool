#!/bin/bash

sudo apt install -y xfce4 
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target