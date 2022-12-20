#!/bin/bash

cd
echo "Enter sudo password"
read password

nix-env -iA nixos.git
git clone https://github.com/saracenrhue/nixos
bash ./nixos/setup.sh $password