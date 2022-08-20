#!/bin/bash

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
        "0")bash ./post/mac.sh;;
        "1")bash ./archprepost.sh;;
        "2")bash ./debianprepost.sh;;
        "3")bash ./fedoraprepost.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1
