import sys
from os import system as cmd
from pick import pick
import yaml

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

nix_install = 'curl -L https://nixos.org/nix/install | sh && . ./home/$USER/.nix-profile/etc/profile.d/nix.sh && echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc && export NIXPKGS_ALLOW_UNFREE=1'
with open('packages.yml', 'r') as file:
    data = yaml.safe_load(file)


inst = 'yay -S '
yay = data['yay']
yay = dict(sorted(yay.items(), key=lambda item: item[1]))
yay.update({'everything': ' && '.join(list(yay.values()))})
for item in yay: yay[item] = inst+yay[item]


inst = 'nix-env -iA nixpkgs.'
nix = data['nix']
nix = dict(sorted(nix.items(), key=lambda item: item[1]))
nix.update({'everything': ' && '.join(list(nix.values()))})
for item in nix: nix[item] = inst+nix[item]


inst = 'brew install '
brew = data['brew']
brew = dict(sorted(brew.items(), key=lambda item: item[1]))
brew.update({'everything': ' && '.join(list(brew.values()))})
for item in brew: brew[item] = inst+brew[item]


inst = 'scoop install '
scoop = data['scoop']
scoop = dict(sorted(scoop.items(), key=lambda item: item[1]))
scoop.update({'everything': ' && '.join(list(scoop.values()))})
for item in scoop: scoop[item] = inst+scoop[item]


inst = 'pip3 install '
pip = data['pip']
pip = dict(sorted(pip.items(), key=lambda item: item[1]))
pip.update({'everything': ' && '.join(list(pip.values()))})
for item in pip: pip[item] = inst+pip[item]


inst = 'npm install -g '
npm = data['npm']
npm = dict(sorted(npm.items(), key=lambda item: item[1]))
npm.update({'everything': ' && '.join(list(npm.values()))})
for item in npm: npm[item] = inst+npm[item]


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
