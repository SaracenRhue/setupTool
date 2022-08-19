from os import system as cmd
from os import listdir

containers = listdir('./dockerScripts')

def trigger(index):
    cmd('bash ./dockerScripts/'+containers[index])
    print(index)

print('What containers would you like to set up?')
for i in containers:
    print(str(containers.index(i))+') '+containers[containers.index(i)].replace('.sh',''))

selection = str(input('> '))

if selection == 'all':
    for i in containers:
        trigger(containers.index(i))
elif len(selection) == 1:
    trigger(int(selection))
else:
    selection = [int(i) for i in selection.split() if i.isdigit()]
    for i in selection:
        trigger(selection[selection.index(i)])