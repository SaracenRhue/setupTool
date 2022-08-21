#!/bin/bash

PKGS=(
'xorg'
'xorg-server'
'nano'
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
'papirus-icon-theme'
)
for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done


# set dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#enable gnome display manager
sudo systemctl enable gdm.service