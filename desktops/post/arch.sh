#!/bin/bash

while :
do
    clear
    cat<<EOF
    Please enter your choice:
     (1) basic setup
     (2) setup zsh
     (3) zsh aliases
     (4) bash aliases
     (5) gnome clean
     (9) cust grub
     (0) quit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
        "1") # basic setup
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
             cd archTool
             yay -Sy && yay -Su && yay -Qdt # update
             yay -R --noconfirm python #remove python 2.7
             yay -S --needed --noconfirm - < packages.txt # install packages in packages.txt
             # Graphics Drivers find and install
             if lspci | grep -E "NVIDIA|GeForce"; then
                 yay -S --noconfirm nvidia
             	nvidia-xconfig
             elif lspci | grep -E "Radeon"; then
                 yay -S --noconfirm xf86-video-amdgpu
             elif lspci | grep -E "Integrated Graphics Controller"; then
                 yay -S --noconfirm libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils
             fi
             yay -S --noconfirm virt-manager qemu vde2 dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpmr iptables # setup virt-manager
             sudo systemctl enable libvirtd.service
             sudo systemctl start libvirtd.service
             sudo usermod -a -G libvirt $USER
             ;;
        "2") # setup zsh
             yay -S --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting 
             echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc
             sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
             echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
             curl -L http://install.ohmyz.sh | sh
             chsh -s $(which zsh)
             source ~/.zshrc
             ;;
        "3") # setup zsh aliases
             echo "neofetch" >> ~/.zshrc
             echo "alias i='yay -S --noconfirm'" >> ~/.zshrc
             echo "alias r='yay -R --noconfirm'" >> ~/.zshrc
             echo "alias s='yay -Ss'" >> ~/.zshrc
             echo "done..."
             source ~/.zshrc
             ;;
        "4") # setup bash aliases
             echo "neofetch" >> ~/.bashrc 
             echo "alias i='yay -S --noconfirm'" >> ~/.bashrc
             echo "alias r='yay -R --noconfirm'" >> ~/.bashrc
             echo "alias s='yay -Ss'" >> ~/.bashrc
             echo "done..."
             source ~/.bashrc
             ;;
        "5") # gnome clean
             PKGS=(
             'cheese'
             'xdg-desktop-portal-gnome'
             'gnome-books' 
             'gnome-calculator'
             'gnome-calendar'
             'gnome-characters'
             'gnome-clocks'
             'gnome-color-manager'
             'gnome-contacts'
             'gnome-font-viewer'
             'gnome-getting-started-docs'
             'gnome-keyring'
             'gnome-logs'
             'gnome-maps'
             'gnome-music'
             'gnome-photos'
             'gnome-software'
             'gnome-system-monitor'
             'gnome-user-docs'
             'gnome-video-effects'
             'gnome-weather'
             'yelp'
             'python'
             'chromium'
             'totem'
             'epiphany'
             )
         
             for PKG in "${PKGS[@]}"; do
                 yay -R --noconfirm $PKG
             done
             echo "done..."
             ;;
        "9") # install cust grub
             git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes 
             cd Top-5-Bootloader-Themes
             sudo ./install.sh
             cd
             sudo rm -fr Top-5-Bootloader-Themes
             ;;
        "0") break && cd && sudo rm -rf archTool && exit ;;
     * )  echo "invalid option" ;;
    esac
    sleep 1
done





# r_gnome_packages(){
#     PKGS=(
#     'cheese'
#     'xdg-desktop-portal-gnome'
#     'gnome-books' 
#     'gnome-calculator'
#     'gnome-calendar'
#     'gnome-characters'
#     'gnome-clocks'
#     'gnome-color-manager'
#     'gnome-contacts'
#     'gnome-font-viewer'
#     'gnome-getting-started-docs'
#     'gnome-keyring'
#     'gnome-logs'
#     'gnome-maps'
#     'gnome-music'
#     'gnome-photos'
#     'gnome-software'
#     'gnome-system-monitor'
#     'gnome-user-docs'
#     'gnome-video-effects'
#     'gnome-weather'
#     'yelp'
#     'python'
#     'chromium'
#     'totem'
#     )

#     for PKG in "${PKGS[@]}"; do
#         yay -R --noconfirm $PKG
#     done

# }



# gonome_setup() {
#     yay -S --noconfirm gnome-tweaks chrome-gnome-shell gnome-shell-extension-dash-to-dock
#     cd Pictures
#     wget http://wallpoper.com/images/00/39/10/60/linux-arch_00391060.png
#     wget https://wallpapercave.com/wp/NyaITD5.png
#     wget https://wallpapercave.com/wp/PKt7K9T.jpg
#     wget https://wallpaperset.com/w/full/2/a/0/418263.jpg
#     cd
#     gsettings set org.gnome.mutter center-new-windows 'true'
#     gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
#     gsettings set org.gnome.desktop.background picture-uri 'file:///home/saracen/Pictures/PKt7K9T.jpg'
#     mv ~/themes/.themes ~/
#     mv ~/themes/.icons ~/
#     gsettings set org.gnome.desktop.interface gtk-theme "Orchris-green-dark"
#     gsettings set org.gnome.desktop.wm.preferences theme "Orchris-green-dark"
#     gsettings set org.gnome.desktop.interface icon-theme "Kora"
#     gsettings set org.gnome.desktop.interface cursor-theme 'macOSBigSur'
#     sudo rm -fr themes
#}