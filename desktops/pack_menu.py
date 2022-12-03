import sys
from os import system as cmd
from pick import pick

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

nix = 'curl -L https://nixos.org/nix/install | sh && . ./home/$USER/.nix-profile/etc/profile.d/nix.sh && echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc && export NIXPKGS_ALLOW_UNFREE=1'


inst = 'yay -S '
arch = {
    'vscode': f'{inst}visual-studio-code-bin',
    'discord': f'{inst}discord',
    'github': f'{inst}github-desktop-bin',
    'gparted': f'{inst}gparted',
    'krusader': f'{inst}krusader',
    'nextcloud': f'{inst}nextcloud-client',
    'firefox': f'{inst}firefox',
    'brave': f'{inst}brave-browser',
    'vlc': f'{inst}vlc',
    'tor': f'{inst}tor-browser',
    'pia': 'wget https://insters.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run && sh pia-linux-3.3.1-06924.run && sudo rm -fr pia-linux-3.3.1-06924.run',
    'zoom': f'{inst}zoom',
    'nodejs': f'{inst}nodejs npm',
    'java': f'{inst}jre-openjdk',
    'virsh': f'{inst}libvirt',
    'tree': f'{inst}tree',
    'timeshift': f'{inst}grub grub-btrfrs timeshift',
    'cmatrix': f'{inst}cmatrix',
}

inst = 'nix-env -iA nixpkgs.'
debian = {
    'vscode': f'{inst}vscode',
    'discord': f'{inst}discord',
    'github': f'{inst}github-desktop',
    'gparted': f'{inst}gparted',
    'krusader': f'{inst}krusader',
    'nextcloud': f'{inst}nextcloud-client',
    'firefox': f'{inst}firefox',
    'brave': f'{inst}brave',
    'vlc': f'{inst}vlc',
    'tor': f'{inst}tor-browser',
    'pia': f'{inst}private-internet-access',
    'zoom': f'{inst}zoom',
    'nodejs': f'{inst}nodejs && {inst}nodePackages.npm',
    'java': f'{inst}jre8',
    'virsh': f'{inst}libvirt',
    'tree': f'{inst}tree',
    'timeshift': f'{inst}timeshift',
    'cmatrix': f'{inst}cmatrix',
    }

inst = 'nix-env -iA nixpkgs.'
fedora = {
    'vscode': f'{inst}vscode',
    'discord': f'{inst}discord',
    'github': f'{inst}github-desktop',
    'gparted': f'{inst}gparted',
    'krusader': f'{inst}krusader',
    'nextcloud': f'{inst}nextcloud-client',
    'firefox': f'{inst} irefox',
    'brave': f'{inst}brave',
    'vlc': f'{inst}vlc',
    'tor': f'{inst}tor-browser',
    'pia': f'{inst}private-internet-access',
    'zoom': f'{inst}zoom',
    'nodejs': f'{inst}nodejs && {inst}nodePackages.npm',
    'java': f'{inst}jre8',
    'virsh': f'{inst}libvirt',
    'tree': f'{inst}tree',
    'timeshift': f'{inst}timeshift',
    'cmatrix': f'{inst}cmatrix',
    }

inst = 'brew install '
mac = {
    'vscode': f'{inst}--cask visual-studio-code',
    'discord': f'{inst}--cask discord',
    'github': f'{inst}--cask github',
    'nodejs': f'{inst}nodejs npm',
    'java': f'{inst}openjdk',
    'go': f'{inst}go',
    'rust': f'{inst}rust',
    'kotlin': f'{inst}kotlin',

}

inst = 'scoop install '
windows = {
    'vscode': f'{inst}vscode',
    'discord': f'{inst}discord',
    'github': f'{inst}github',
    'firefox': f'{inst}firefox',
    'brave': f'{inst}brave',
    'tor': f'{inst}tor',
    'vlc': f'{inst}vlc',
    'nodejs': f'{inst}nodejs',
    'java': f'{inst}java',
    'go': f'{inst}go',
    'rust': f'{inst}rust',
    'kotlin': f'{inst}kotlin',

}

inst = 'pip3 install '
pip = {
    'yaml': f'{inst}pyyaml',
    'pick': f'{inst}pick',
    'eel': f'{inst}eel',
    'icecream': f'{inst}icecream',
    'discord': f'{inst}discord',
    'selenium': f'{inst}selenium',
    'pyautogui': f'{inst}pyautogui',
    'pygame': f'{inst}pygame'
}

inst = 'npm install -g '
npm = {
    'typescript': f'{inst}typescript',
    'sass': f'{inst}sass',
    'angular': f'{inst}@angular/cli',
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
    cmd(inst+'nodejs && '+inst+'nodePackages.npm')


title = 'Choose options (press SPACE to mark, ENTER to continue): '
selected = pick(options, title, multiselect=True, min_selection_count=0)
keys = []
for i in range(len(selected)):
    key = selected[i][0]
    keys.append(key)
for key in keys:
    cmd(eval(f'{system}[key]'))
