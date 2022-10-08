#!/bin/bash

cd ./setuptool

    clear
    cat<<EOF
    Please enter your choice:
     (0) MacOS
     (1) Arch
     (2) Debian
     (3) Fedora
     (4) Windows
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash ./mac.sh;;
        "1")bash ./arch.sh;;
        "2")bash ./debian.sh;;
        "3")bash ./fedora.sh;;
        "4")bash ./windows.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1

cd
    #clear
    cat<<EOF
    Do you want to setup the project creator script?:
     (0) yes
     (1) no
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash -c "$(curl https://raw.githubusercontent.com/SaracenRhue/projectGenerator/main/setup.sh)"
            source ~/.zshrc
            rm -fr ./setuptool
            ;;
        "1")rm -fr ./setuptool;;
     * )  echo "invalid option" ;;
    esac
    sleep 1



echo "  __  __      ___ "
echo " /  )/  )/| )(_   "
echo "/(_/(__// |/ /__  "


#reboot
echo "Rebooting in 3 Seconds ..." && sleep 1
echo "Rebooting in 2 Seconds ..." && sleep 1
echo "Rebooting in 1 Second ..." && sleep 1
sudo reboot


