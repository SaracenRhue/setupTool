#!/bin/bash

curl -L https://nixos.org/nix/install | sh
. ./home/$USER/.nix-profile/etc/profile.d/nix.sh
echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc
export NIXPKGS_ALLOW_UNFREE=1
