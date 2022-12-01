from os import system as cmd
from os import listdir
from pick import pick

containers = listdir('./dockerScripts')
print(containers)
options = []
for i in range(len(containers)):
    options.append(containers[i].replace('.sh',''))

title = 'Choose options (press SPACE to mark, ENTER to continue): '
selected = pick(options, title, multiselect=True, min_selection_count=0)

def trigger(index):
    cmd(f'bash ./dockerScripts/{containers[index]}')

indices = []
for i in range(len(selected)):
    index = selected[i][1]
    indices.append(index)

for i in indices:
    trigger(i)
