from os import system as cmd
import yaml

with open('data.yml', 'r') as file:
    data = yaml.safe_load(file)
    containers = data['containers']
    

container_values = list(containers.values())

print('What container would you like to set up?')
index = 0
for container in containers:
    print(f"{index}) {container}")
    index += 1

selection = str(input('> '))
selection = [int(i) for i in selection.split() if i.isdigit()]
selection.sort()
for i in selection:
    cmd(container_values[i])