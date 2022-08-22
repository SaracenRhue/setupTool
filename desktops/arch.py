from os import replace, system as cmd
from os import listdir

tasks = listdir('./arch')

def trigger(index):
    cmd('bash ./arch/'+tasks[index])
    print(index)

print('What tasks would you like to set up?')
for i in tasks:
    print(str(tasks.index(i))+') '+tasks[tasks.index(i)].replace('.sh','').replace('_',' ').replace('a_',''))

selection = str(input('> '))

if selection == 'all':
    for i in tasks:
        trigger(tasks.index(i))
elif len(selection) == 1:
    trigger(int(selection))
else:
    selection = [int(i) for i in selection.split() if i.isdigit()]
    for i in selection:
        trigger(selection[selection.index(i)])