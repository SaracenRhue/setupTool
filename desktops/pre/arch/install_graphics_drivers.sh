#!/bin/bash

             if lspci | grep -E "NVIDIA|GeForce"; then
                 yay -S --noconfirm nvidia
             	nvidia-xconfig
             elif lspci | grep -E "Radeon"; then
                 yay -S --noconfirm xf86-video-amdgpu
             elif lspci | grep -E "Integrated Graphics Controller"; then
                 yay -S --noconfirm libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils
             fi
             yay -S --noconfirm virt-manager qemu vde2 dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpmr iptables # setup virt-manager
             sudo systemctl enable libvirtd.service
             sudo systemctl start libvirtd.service
             sudo usermod -a -G libvirt $USER