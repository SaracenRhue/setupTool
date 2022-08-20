#!/bin/bash

cd ./servers

do
    clear
    cat<<EOF
    Please enter your choice:
     (0) Debian
     (1) Fedora
EOF
    read -n1 -s
    case "$REPLY" in
        "0")bash ./debian.sh;;
        "1")bash ./fedora.sh;;
     * )  echo "invalid option" ;;
    esac
    sleep 1