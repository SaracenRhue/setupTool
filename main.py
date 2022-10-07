import yaml
import sys
from os import system as cmd


arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

if system == 'arch':
    inst_cmd = 'yay -S --noconfirm'
    rm_cmd = 'yay -R --noconfirm'
    upd_cmd = 'yay -Syu --noconfirm'
elif system == 'debian':
    inst_cmd = 'sudo apt install -y'
    rm_cmd = 'sudo apt remove -y'
    upd_cmd = 'sudo apt update && apt upgrade -y'
elif system == 'fedora':
    inst_cmd = 'sudo dnf install -y'
    rm_cmd = 'sudo dnf remove -y'
    upd_cmd = 'sudo dnf update && sudo dnf upgrade -y'
elif system == 'macos':
    inst_cmd = 'brew install'
    rm_cmd = 'brew remove'
    upd_cmd = 'brew update && brew upgrade'
elif system == 'windows':
    inst_cmd = 'scoop install'
    rm_cmd = 'scoop uninstall'
    upd_cmd = 'scoop upgrade all'

def run_cmd(commands):
    try: # check for dependencies
        print(f"{inst_cmd} {data['tasks']['install_jekyll']['dependencies'][system]}")
    except KeyError:
        print('No dependencies found')
    full_command = ''
    for command in commands:
        command = command.replace('inst_cmd', inst_cmd).replace('rm_cmd', rm_cmd).replace('upd_cmd', upd_cmd)
        if 'yay -S' or 'yay -R' or 'install' or 'remove' in command:
            print(command)
        else: 
            full_command += command + ' && '
            print(full_command[:-4]) # remove last &&


with open('data.yml', 'r') as file:
    data = yaml.safe_load(file)
    tasks = data[system]


print('What tasks would you like to run?')
for i in tasks:
    print(str(tasks.index(i))+') '+tasks[tasks.index(i)].replace('_',' '))

selection = str(input('> '))

if selection == 'all':
    for i in tasks:
        run_cmd(data['tasks'][i]['main'])
else:
    selection = [int(i) for i in selection.split() if i.isdigit()]
    selection.sort()
    for i in selection:
        run_cmd(data['tasks'][tasks[i]]['main'])
