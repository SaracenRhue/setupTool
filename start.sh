#!/bin/bash

cd unixtool

    clear
    cat<<EOF
    Please enter your choice:
     (0) server
     (1) desktop
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash ./server.sh;;
        "1")bash ./desktop.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1


#reboot
echo "Rebooting in 3 Seconds ..." && sleep 1
echo "Rebooting in 2 Seconds ..." && sleep 1
echo "Rebooting in 1 Second ..." && sleep 1
sudo reboot
