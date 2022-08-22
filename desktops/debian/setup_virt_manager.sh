#!/bin/bash

    sudo apt install virt-manager -y
    sudo systemctl enable libvirtd.service
    sudo systemctl start libvirtd.service
    sudo usermod -a -G libvirt $USER