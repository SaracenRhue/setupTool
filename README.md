# unixTool

## Description

This tool tool helps you set up your Arch, Debian, Fedora and MacOS system 

## Usage

`bash ./unixtool/start.sh`

to install all input `all`
to select multiple input `0 1 2 3`


## Features 
* setup zsh and neofetch
* setup yay for Arch
* setup homebrew for Debian Fedora and MacOS
* setup docker for Debian and Fedora (with a selection of Containers to install)
* change your grub theme ([ ChrisTitusTech/Top-5-Bootloader-Themes ](https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes))
* (re)install linux graphic drivers
* enable Debian root user
* install a clean gnome desktop
* install xfce desktop
* purge unnecessary packages from a already installed gnome desktop
* install various packages I like to use



### Docker Ports
* filebot `http://localhost:5800`
* heimdall `http://localhost:5080`
* krusader `http://localhost:6080/vnc.html?resize=remote&host=localhost&port=6080&&autoconnect=1`
* mediainfo `http://localhost:5877`
* nextcloud `https://localhost:444`
* nginx `http://localhost:7818`
* organizr `http://localhost:9983`
* plex `http://localhost:23400/web/index.html`
* portainer `http://localhost:9000`
* resilio `http://localhost:55555`

### Developers

You can add new features by adding a new .sh file into the distro folder.
the menu gets generated automaticly by reading the filenames in that folder.
(use _ for spaces in your filenames)