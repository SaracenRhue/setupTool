#!/bin/bash

cd ./unixtool
cd ./desktops

    clear
    cat<<EOF
    Please enter your choice:
     (0) MacOS
     (1) Arch
     (2) Debian
     (3) Fedora
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash ./mac.sh;;
        "1")bash ./arch.sh;;
        "2")bash ./debian.sh;;
        "3")bash ./fedora.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1

cd
    clear
    cat<<EOF
    Do you want to setup the project creator script?:
     (0) yes
     (1) no
EOF
    read -n1 -s
    case "$REPLY" in
        "0")wget https://raw.githubusercontent.com/SaracenRhue/projectGenerator/main/.generator.py
            echo "alias pg='python3 ./.generator.py'" >> ~/.zshrc
            source ~/.zshrc
            rm -fr ./unixtool
            ;;
        "1")rm -fr ./unixtool;;
     * )  echo "invalid option" ;;
    esac
    sleep 1


echo "\x1b[32m" # Green
echo "  __  __      ___ "
echo " /  )/  )/| )(_   "
echo "/(_/(__// |/ /__  "
echo "\x1b[39m" # default color

#reboot
echo "Rebooting in 3 Seconds ..." && sleep 1
echo "Rebooting in 2 Seconds ..." && sleep 1
echo "Rebooting in 1 Second ..." && sleep 1
sudo reboot


