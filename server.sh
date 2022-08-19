#!/bin/bash

do
    clear
    cat<<EOF
    Please enter your choice:
     (0) Arch
     (1) Debian
     (2) Fedora
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash ./servers/arch.sh;;
        "1")bash ./servers/debian.sh;;
        "2")bash ./servers/fedora.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1