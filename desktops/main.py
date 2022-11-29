from os import system as cmd
from os import listdir
import sys
from pick import pick

arguments = sys.argv #returns a list of arguments
arguments.pop(0) #remove the first argument (the script name)
system = arguments[0]

tasks = listdir(f'./{system}')
tasks.sort()
def trigger(index):
    cmd(f'bash ./{system}/'+tasks[index])

options = []
for i in range(len(tasks)):
    options.append(tasks[i].replace('.sh','').replace('#','').replace('_', ' '))

title = 'Choose options (press SPACE to mark, ENTER to continue): '
selected = pick(options, title, multiselect=True, min_selection_count=0)

indices = []
for i in range(len(selected)):
    index = selected[i][1]
    indices.append(index)

for i in indices:
    trigger(i)