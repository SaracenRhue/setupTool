#!/bin/bash
curl -L https://nixos.org/nix/install | sh
. ./home/$USER/.nix-profile/etc/profile.d/nix.sh
echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.bashrc
echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc

nix-env -iA nixpkgs.brave
nix-env -iA nixpkgs.vscode
nix-env -iA nixpkgs.github-desktop
