#!/bin/bash

sudo apt install -y build-essential procps file

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"" >> ~/.bashrc
echo "eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"" >> ~/.zshrc