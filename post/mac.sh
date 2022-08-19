#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

#zsh
brew install zsh zsh-autosuggestions zsh-syntax-highlighting neofetch python
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
curl -L http://install.ohmyz.sh | sh
source ~/.zshrc

#install programs
    PKGS=(
        'visual-studio-code'
        'firefox'
    )

    for PKG in "${PKGS[@]}"; do
        brew install --cask $PKG
    done
