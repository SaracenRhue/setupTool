#!/bin/bash

cd ./setuptool/desktops
    clear
    cat<<EOF
    Please enter your choice:
     (0) MacOS
     (1) Arch
     (2) Debian
     (3) Fedora
     (4) NixOS
     (5) Windows
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash ./mac.sh;;
        "1")bash ./arch.sh;;
        "2")bash ./debian.sh;;
        "3")bash ./fedora.sh;;
        "4")bash ./nix.sh;;
        "5")bash ./windows.sh;;
     * )  echo "invalid option" ;;
    esac
sleep 1 && cd && sleep 1
echo "  __  __      ___ "
echo " /  )/  )/| )(_   "
echo "/(_/(__// |/ /__  "
#reboot
echo "Rebooting in 3 Seconds ..." && sleep 1
echo "Rebooting in 2 Seconds ..." && sleep 1
echo "Rebooting in 1 Second ..." && sleep 1
sudo reboot