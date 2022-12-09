#!/bin/bash

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc

brew install python@3.11 wget curl htop watchman
source ~/.zshrc

#zsh
brew install zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)
echo "neofetch" >> ~/.zshrc

alias python3='python3.11'
alias pip3='pip3.11'
pip3 install pick pyyaml
python main.py mac