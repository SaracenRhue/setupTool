# setupTool

## Description

This tool tool helps you set up your Arch, Debian, Fedora, MacOS and Windows system.<br>

## Usage

For Windows run this in powershell first:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex
scoop install git
scoop bucket add extras
scoop bucket add versions
```

Paste this in your terminal / powershell:

```bash
git clone https://github.com/saracenrhue/setuptool.git
bash ./setuptool/start.sh
```

or (doesn't work on windows):

```bash
bash -c "$(curl https://raw.githubusercontent.com/SaracenRhue/setupTool/main/cstart.sh)"
```

## Features

* setup zsh and neofetch
* install yay for AUR
* install nix for Debian and Fedora
* setup homebrew for Debian Fedora and MacOS
* setup docker for Debian and Fedora (with a selection of Containers to install)
* install pip and npm packages
* change your grub theme ([ChrisTitusTech/Top-5-Bootloader-Themes](https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes))
* (re)install linux graphic drivers
* enable Debian root user
* install a clean gnome desktop
* install xfce desktop
* purge unnecessary packages from a already installed gnome desktop
* install various packages I like to use

### Docker Ports

* code-server `http://localhost:5500`
* dashdot `http://localhost:3001`
* filebot `http://localhost:5700`
* firefox `http://localhost:3000`
* guacamole `http://localhost:8067`
* heimdall `http://localhost:5080`
* krusader `http://localhost:6080/vnc.html?resize=remote&host=localhost&port=6080&&autoconnect=1`
* mediainfo `http://localhost:5877`
* mc-server `http://server-ip:25565`
* nextcloud `https://localhost:444`
* nginx `http://localhost:7818`
* organizr `http://localhost:9983`
* plex `http://localhost:23400/web/index.html`
* portainer `http://localhost:9000`
* resilio-sync `http://localhost:8888`

To setup nginx forward port `80` to `1880` and `443` to `18443` on your router

### Developers

You can add new features by adding a new `.sh` file into the distro folder.
the menu gets generated automaticly by reading the filenames in that folder.
(use `_` for spaces in your filenames)<br>
If you want to change the menu order you can add a `#` in front of the filename.

#### Walkthrough

##### start

* You start in `start.sh` where you select your OS
* The menu calls the corresponding `.sh` file in `/desktops`
* This file installs python and other dependencies and calls the `main.py` with an argument that parses along the selected OS
* From here the menu with all availible tasks gets generated based in the files in the OS folder (e.g. /debian)

##### docker menu

* If you select the docker install from the task menu the script will call the `docker_menu.py`
* From here a menu gets generated from the files in `dockerScripts`
* Here you can select some containers you may want to install

##### package menu

* If you select `install packages`, `install npm packages` or `install pip packages` the `pack_menu.py` gets called with an argument corresponding to the selected os to determine the install commands
* From here a menu gets generated from list in the `packages.yml`
* The keys in this file will be shown in the menu and the values are the actual package names.
