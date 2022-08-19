#!/bin/bash

# echo -ne "
# -------------------------------------------------------------------------
#                     Network Setup 
# -------------------------------------------------------------------------
# "
# pacman -S --noconfirm --needed networkmanager dhclient
# systemctl enable --now NetworkManager

# echo -ne "
# -------------------------------------------------------------------------
#                     Setting up mirrors for optimal download 
# -------------------------------------------------------------------------
# "
# pacman -S --noconfirm --needed pacman-contrib curl
# pacman -S --noconfirm --needed reflector rsync grub arch-install-scripts git
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# nc=$(grep -c ^processor /proc/cpuinfo)

sudo pacman -Syu --noconfirm

git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes 
cd Top-5-Bootloader-Themes
sudo ./install.sh
cd
sudo rm -fr Top-5-Bootloader-Themes

# yay setup
sudo pacman -Syu --noconfirm # update system
sudo pacman -S --noconfirm git base-devel # install yay
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:users ./yay
sudo chown -W $USER:users ./yay
cd yay
makepkg -si
cd
sudo rm -fr yay
source ~/.bashrc

# setup zsh
yay -S --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting neofetch
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
curl -L http://install.ohmyz.sh | sh
chsh -s $(which zsh)
source ~/.zshrc

# setup zsh aliases
echo "neofetch" >> ~/.zshrc
echo "alias i='yay -S --noconfirm'" >> ~/.zshrc
echo "alias r='yay -R --noconfirm'" >> ~/.zshrc
echo "alias s='yay -Ss'" >> ~/.zshrc
echo "done..."
source ~/.zshrc

#needed packages
PKGS=(
'xorg'
'xorg-server'
'nano'
'curl'
'baobab'
'eog'
'evince'
'file-roller'
'gdm'
'gedit'
'gnome-backgrounds'
'gnome-control-center'
'gnome-menus'
'gnome-remote-desktop'
'gnome-session'
'gnome-settings-daemon'
'gnome-shell'
'gnome-tweaks'
'gnome-shell-extensions'
'gnome-terminal'
'gnome-themes-standard'
'gnome-tweak-tool'
'gnome-user-share'
'grilo-plugins'
'gvfs'
'gvfs-afc'
'gvfs-goa'
'gvfs-google'
'gvfs-gphoto2'
'gvfs-ntp'
'gvfs-nfs'
'gvfs-smb'
'malcontent'
'mutter'
'nautilus'
'orca'
'rygel'
'tracker3-miners'
'vino'
'xdg-user-dirs-gtk'
'grub'
'grub-btrfs'
)
for PKG in "${PKGS[@]}"; do
    yay -S --needed --noconfirm $PKG
done



#optional packages
PKGS=(
'arc'
'bash-completion'
'brave-browser'
'vlc'
'cmatrix'
'discord'
'grub-customizer'
'firefox'
'github-desktop-bin'
'gparted'
'htop'
'krusader'
'nodejs'
'npm'
'jre-openjdk'
'nextcloud-client'
'python3'
'python-pip'
'pyenv'
'thunderbird'
'timeshift'
'tor-browser'
'gnome-boxes'
'tree'
'visual-studio-code-bin'
'wget'
'zoom'
'minecraft-launcher'
'papirus-icon-theme'
)
for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done


# # Graphics Drivers find and install
# gpu_type=$(lspci)
# if grep -E "NVIDIA|GeForce" <<< ${gpu_type}; then
#     pacman -S --noconfirm --needed nvidia
# 	nvidia-xconfig
# elif lspci | grep 'VGA' | grep -E "Radeon|AMD"; then
#     pacman -S --noconfirm --needed xf86-video-amdgpu
# elif grep -E "Integrated Graphics Controller" <<< ${gpu_type}; then
#     pacman -S --noconfirm --needed libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
# elif grep -E "Intel Corporation UHD" <<< ${gpu_type}; then
#     pacman -S --needed --noconfirm libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
# fi


# install packages in packages.txt
yay -S --noconfirm - < ./riarch/packages.txt


# #enable bluetooth
# sudo systemctl enable bluetooth.service
# #enable networkmanager
# sudo systemctl enable NetworkManager.service

# install python packages
PKGS=(
'requests'
'pyttsx3'
'pygame'
'pyaudio'
'beautifulsoup4'
'selenium'
'pyautogui'
)
for PKG in "${PKGS[@]}"; do
    pip install $PKG
done
source ~/.zshrc



# set dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# set background image
mkdir .backgrounds && cd .backgrounds
wget https://cdn.wallpapersafari.com/37/88/Ibc6Vd.jpg
cd
gsettings set org.gnome.desktop.background picture-uri 'file:///home/.backgrounds/Ibc6Vd.jpg'

# # install gnome material shell
# git clone https://github.com/PapyElGringo/material-shell.git 
# ~/.local/share/gnome-shell/extensions/material-shell@papyelgringo

# # enable material shell
# gnome-extensions enable material-shell@papyelgringo

#enable gnome display manager
sudo systemctl enable gdm.service

#reboot
echo "Rebooting in 3 Seconds ..." && sleep 1
echo "Rebooting in 2 Seconds ..." && sleep 1
echo "Rebooting in 1 Second ..." && sleep 1
sudo reboot