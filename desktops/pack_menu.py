import sys
from os import system as cmd
from pick import pick

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

nix = 'curl -L https://nixos.org/nix/install | sh && . ./home/$USER/.nix-profile/etc/profile.d/nix.sh && echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc && export NIXPKGS_ALLOW_UNFREE=1'


inst = 'yay -S '
arch = {
    'vscode': inst+'visual-studio-code-bin',
    'discord': inst+'discord',
    'github': inst+'github-desktop-bin',
    'gparted': inst+'gparted',
    'krusader': inst+'krusader',
    'nextcloud': inst+'nextcloud-client',
    'firefox': inst+'firefox',
    'brave': inst+'brave-browser',
    'vlc': inst+'vlc',
    'tor': inst+'tor-browser',
    'pia': 'wget https://insters.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run && sh pia-linux-3.3.1-06924.run && sudo rm -fr pia-linux-3.3.1-06924.run',
    'zoom': inst+'zoom',
    'nodejs': inst+'nodejs npm',
    'java': inst+'jre-openjdk',
    'virsh': inst+'libvirt',
    'tree': inst+'tree',
    'timeshift': inst+'grub grub-btrfrs timeshift',
    'cmatrix': inst+'cmatrix',
}

inst = 'nix-env -iA nixpkgs.'
debian = {
    'vscode': inst+'vscode',
    'discord': inst+'discord',
    'github': inst+'github-desktop',
    'gparted': inst+'gparted',
    'krusader': inst+'krusader',
    'nextcloud': inst+'nextcloud-client',
    'firefox': inst+'firefox',
    'brave': inst+'brave',
    'vlc': inst+'vlc',
    'tor': inst+'tor-browser',
    'pia': inst+'private-internet-access',
    'zoom': inst+'zoom',
    'nodejs': inst+'nodejs',
    'java': inst+'jre8',
    'virsh': inst+'libvirt',
    'tree': inst+'tree',
    'timeshift': inst+'timeshift',
    'cmatrix': inst+'cmatrix',
    }

inst = 'nix-env -iA nixpkgs.'
fedora = {
    'vscode': inst+'vscode',
    'discord': inst+'discord',
    'github': inst+'github-desktop',
    'gparted': inst+'gparted',
    'krusader': inst+'krusader',
    'nextcloud': inst+'nextcloud-client',
    'firefox': inst+'firefox',
    'brave': inst+'brave',
    'vlc': inst+'vlc',
    'tor': inst+'tor-browser',
    'pia': inst+'private-internet-access',
    'zoom': inst+'zoom',
    'nodejs': inst+'nodejs',
    'java': inst+'jre8',
    'virsh': inst+'libvirt',
    'tree': inst+'tree',
    'timeshift': inst+'timeshift',
    'cmatrix': inst+'cmatrix',
    }

inst = 'brew install '
mac = {
    'vscode': inst+'--cask visual-studio-code',
    'discord': inst+'--cask discord',
    'github': inst+'--cask github',
    'nodejs': inst+'nodejs npm',
    'java': inst+'openjdk',
    'go': inst+'go',
    'rust': inst+ 'rust',
    'kotlin': inst+ 'kotlin',

}

inst = 'scoop install '
windows = {
    'vscode': inst+'vscode',
    'discord': inst+'discord',
    'github': inst+'github',
    'firefox': inst+'firefox',
    'brave': inst+'brave',
    'tor': inst+'tor',
    'vlc': inst+'vlc',
    'nodejs': inst+'nodejs',
    'java': inst+'java',
    'go': inst+'go',
    'rust': inst+ 'rust',
    'kotlin': inst+ 'kotlin',

}

inst = 'pip3 install '
pip = {
    'yaml': inst+'pyyaml',
    'pick': inst+'pick',
    'eel': inst+'eel',
    'icecream': inst+'icecream',
    'discord': inst+'discord',
    'selenium': inst+'selenium',
    'pyautogui': inst+'pyautogui',
    'pygame': inst+'pygame'
}

inst = 'npm install -g '
npm = {
    'typescript': inst+'typescript',
    'sass': inst+'sass',
    'angular': inst+'@angular/cli',
}

if system == 'arch':
    options = list(arch.keys())
if system == 'debian':
    options = list(debian.keys())
    cmd(nix)
if system == 'fedora':
    options = list(fedora.keys())
    cmd(nix)
if system == 'mac':
    options = list(mac.keys())
if system == 'windows':
    options = list(windows.keys())
if system == 'pip':
    options = list(pip.keys())
if system == 'npm':
    options = list(npm.keys())
    

title = 'Choose options (press SPACE to mark, ENTER to continue): '
selected = pick(options, title, multiselect=True, min_selection_count=0)
keys = []
for i in range(len(selected)):
    key = selected[i][0]
    keys.append(key)
for key in keys:
    cmd(eval(f'{system}[key]'))
