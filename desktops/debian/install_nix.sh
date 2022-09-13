#!/bin/bash
curl -L https://nixos.org/nix/install | sh
. ./home/$USER/.nix-profile/etc/profile.d/nix.sh
echo "allowUnfree = true;" >> ~/.config/nixpkgs/config.nix

nix-env -iA nixpkgs.brave
nix-env -iA nixpkgs.vscode
nix-env -iA nixpkgs.github-desktop
