#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

#zsh
brew install zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
curl -L http://install.ohmyz.sh | sh


brew install python openjdk wget htop pyenv nodejs npm
source ~/.zshrc
pyenv install 3.10.1
pyenv global 3.10.1
#install programs
brew install --cask visual-studio-code firefox github

# setup program generator
wget https://raw.githubusercontent.com/SaracenRhue/projectGenerator/main/.generator.py
echo "alias pg='python3 ./.generator.py'" >> ~/.zshrc
source ~/.zshrc