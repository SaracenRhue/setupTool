#!/bin/bash

             if lspci | grep -E "NVIDIA|GeForce"; then
                 sudo dnf install nvidia -y
             	nvidia-xconfig
             elif lspci | grep -E "Radeon"; then
                 sudo dnf install xf86-video-amdgpu -y
             elif lspci | grep -E "Integrated Graphics Controller"; then
                 sudo dnf install libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils -y
             fi
