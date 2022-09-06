#!/bin/bash

sudo dnf install @xfce-desktop-environment -y
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target