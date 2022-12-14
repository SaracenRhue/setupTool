import sys
from os import system as cmd
from pick import pick
import yaml

with open('packages.yml', 'r') as file:
    data = yaml.safe_load(file)

def get_dic(inst, key):
    dic = data[key]
    dic = dict(sorted(dic.items(), key=lambda item: item[1]))
    dic.update({'everything': ' && '.join(list(dic.values()))})
    for item in dic: dic[item] = inst+dic[item]
    return dic

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

nix_install = 'curl -L https://nixos.org/nix/install | sh && . ./home/$USER/.nix-profile/etc/profile.d/nix.sh && echo "export NIXPKGS_ALLOW_UNFREE=1" >> ~/.zshrc && export NIXPKGS_ALLOW_UNFREE=1'


yay = get_dic('yay -S ', 'yay')
nix = get_dic('nix-env -iA nixpkgs.', 'nix')
brew = get_dic('brew install ', 'brew')
scoop = get_dic('scoop install ', 'scoop')
pip = get_dic('pip3 install ', 'pip')
npm = get_dic('npm install -g ', 'npm')


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
