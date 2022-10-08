#!/bin/bash

sudo yum groupinstall 'Development Tools'
sudo yum install procps-ng curl file git
sudo yum install libxcrypt-compat # needed by Fedora 30 and up

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
