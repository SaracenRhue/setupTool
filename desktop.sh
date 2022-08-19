#!/bin/bash

do
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
        "0")bash ./desktops/mac.sh;;
        "1")bash ./desktops/arch.sh;;
        "2")bash ./desktops/debian.sh;;
        "3")bash ./desktops/fedora.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1
