#!/bin/bash

sudo apt install virt-manager qemu vde2 dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpmr iptables -y
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -a -G libvirt $USER