#!/bin/bash

sudo pacman -Syu --noconfirm

#clear
    cat<<EOF
    Do you want to use Archtitus?:
     (0) yes
     (1) no
EOF
    read -n1 -s
    case "$REPLY" in
        "0")cd
            git clone https://github.com/ChrisTitusTech/ArchTitus
            cd ArchTitus
            ./archtitus.sh
            ;;
        "1")packman -S --noconfirm wget curl python3 python-pip htop
            # yay setup
            sudo pacman -S --noconfirm git base-devel
            sudo git clone https://aur.archlinux.org/yay.git
            sudo chown -R $USER:users ./yay
            sudo chown -W $USER:users ./yay
            cd yay
            makepkg -si
            cd ../
            sudo rm -fr yay

            source ~/.bashrc
            source ~/.zshrc
            ;;
     * )  echo "invalid option" ;;
    esac
    sleep 1

python3 ./arch.py