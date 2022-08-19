#!/bin/bash

do
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



