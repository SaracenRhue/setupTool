#!/bin/bash

             if lspci | grep -E "NVIDIA|GeForce"; then
                 sudo dnf install -y nvidia
             	nvidia-xconfig
             elif lspci | grep -E "Radeon"; then
                 sudo dnf install -y xf86-video-amdgpu
             elif lspci | grep -E "Integrated Graphics Controller"; then
                 sudo dnf install -y libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils
             fi
             sudo dnf install -y virt-manager qemu vde2 dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpmr iptables # setup virt-manager
             sudo systemctl enable libvirtd.service
             sudo systemctl start libvirtd.service
             sudo usermod -a -G libvirt $USER