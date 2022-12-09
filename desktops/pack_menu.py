import sys
from os import system as cmd
from pick import pick

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

nix_install = 'curl -L https://nixos.org/nix/install | sh && . ./home/$USER/.nix-profile/etc/profile.d/nix.sh && echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc && export NIXPKGS_ALLOW_UNFREE=1'


inst = 'yay -S '
yay = {
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
    'pia': f'{inst}private-internet-access-vpn',
    'zoom': f'{inst}zoom',
    'nodejs': f'{inst}nodejs npm',
    'java': f'{inst}jre-openjdk',
    'virsh': f'{inst}libvirt',
    'tree': f'{inst}tree',
    'timeshift': f'{inst}grub grub-btrfrs timeshift',
    'cmatrix': f'{inst}cmatrix',
}
yay = dict(sorted(yay.items(), key=lambda item: item[1]))
yay.update({'everything': ' && '.join(list(yay.values()))})


inst = 'nix-env -iA nixpkgs.'
nix = {
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
    'sshpass': f'{inst}sshpass',
    'cmatrix': f'{inst}cmatrix',
    }
nix = dict(sorted(nix.items(), key=lambda item: item[1]))
nix.update({'everything': ' && '.join(list(nix.values()))})


inst = 'brew install '
brew = {
    'alfred': f'{inst}--cask alfred',
    'discord': f'{inst}--cask discord',
    'github': f'{inst}--cask github',
    'iTerm2': f'{inst}--cask iterm2',
    'vscode': f'{inst}--cask visual-studio-code',
    #'cmdLine-tools': 'xcode-select --install',
    'docker': f'{inst}docker docker-compose',
    'nodejs': f'{inst}nodejs npm',
    'java': f'{inst}openjdk',
    'go': f'{inst}go',
    'rust': f'{inst}rust',
    'kotlin': f'{inst}kotlin',
}
brew = dict(sorted(brew.items(), key=lambda item: item[1]))
brew.update({'everything': ' && '.join(list(brew.values()))})


inst = 'scoop install '
scoop = {
    'vscode': f'{inst}vscode',
    'discord': f'{inst}discord',
    'docker': f'{inst}docker && {inst}docker-compose',
    'github': f'{inst}github',
    'firefox': f'{inst}firefox',
    'brave': f'{inst}brave',
    'tor': f'{inst}tor',
    'vlc': f'{inst}vlc',
    'zoom': f'{inst}zoom',
    'gcc': f'{inst}gcc',
    'nodejs': f'{inst}nodejs',
    'java': f'{inst}java',
    'go': f'{inst}go',
    'rust': f'{inst}rust',
    'kotlin': f'{inst}kotlin',
}
scoop = dict(sorted(scoop.items(), key=lambda item: item[1]))
scoop.update({'everything': ' && '.join(list(scoop.values()))})


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
pip = dict(sorted(pip.items(), key=lambda item: item[1]))
pip.update({'everything': ' && '.join(list(pip.values()))})


inst = 'npm install -g '
npm = {
    'typescript': f'{inst}typescript',
    'sass': f'{inst}sass',
    'angular': f'{inst}@angular/cli',
}
npm = dict(sorted(npm.items(), key=lambda item: item[1]))
npm.update({'everything': ' && '.join(list(npm.values()))})

if system == 'arch':
    options = list(yay.keys())
elif system == 'debian':
    options = list(nix.keys())
    cmd(nix_install)
elif system == 'fedora':
    options = list(nix.keys())
    cmd(nix_install)
elif system == 'mac':
    options = list(brew.keys())
elif system == 'windows':
    options = list(scoop.keys())
elif system == 'pip':
    options = list(pip.keys())
elif system == 'npm':
    options = list(npm.keys())


title = 'Choose options (press SPACE to mark, ENTER to continue): '
selected = pick(options, title, multiselect=True, min_selection_count=0)
keys = []
for i in range(len(selected)):
    key = selected[i][0]
    keys.append(key)

if 'everything' in keys:
    cmd(eval(f'{system}[everything]'))
else:
    for key in keys:
        cmd(eval(f'{system}[key]'))
