#!/bin/bash

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc

brew install python@3.11 pyenv wget openjdk htop nodejs npm watchman go rust kotlin
alias python='python3.11'
alias pip='pip3.11'
source ~/.zshrc

#zsh
brew install zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
curl -L http://install.ohmyz.sh | sh
echo "neofetch" >> ~/.zshrc


#install programs
brew install --cask visual-studio-code firefox github

# setup program generator
wget https://raw.githubusercontent.com/SaracenRhue/projectGenerator/main/.generator.py
echo "alias pg='python3 ./.generator.py'" >> ~/.zshrc
source ~/.zshrc

npm install -g typescript
npm install -g sass
npm install -g @angular/cli
pip3 install selenium eel pyautogui pyyaml pygame Pillow