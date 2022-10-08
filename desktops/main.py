from os import replace, system as cmd
from os import listdir
import sys

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

tasks = listdir(f'./{system}')
tasks.sort()
def trigger(index):
    cmd(f'bash ./{system}/'+tasks[index])
    print(index)

print('What tasks would you like to set up?')
for i in tasks:
    print(str(tasks.index(i))+') '+tasks[tasks.index(i)].replace('.sh','').replace('_',' ').replace('#',''))

selection = str(input('> '))

if selection == 'all':
    for i in tasks:
        trigger(tasks.index(i))
elif len(selection) == 1:
    trigger(int(selection))
else:
    selection = [int(i) for i in selection.split() if i.isdigit()]
    selection.sort()
    for i in selection:
        trigger(selection[selection.index(i)])