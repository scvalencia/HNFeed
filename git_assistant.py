import os
import time
import string
import random
import datetime

sudoPassword = '.2,a2771993'
command = 'open ~/Documents/'
command = 'date 0916091215'


file_object = open('myfile.dat', 'w')


date = datetime.datetime(2015, 8 , 1, 12 , 4, 5)
while date != datetime.datetime(2015, 9 , 25, 12 , 4, 5): 
    date += datetime.timedelta(days = 1)
    year = str(date.year)
    month = '0' + str(date.month) if date.month < 10 else str(date.month)
    day = '0' + str(date.day) if date.day < 10 else str(date.day)
    command = 'date ' + month + day + '0912' + year[-2:]
    p = os.system('echo %s|sudo -S %s' % (sudoPassword, command))

    

    rnd_string = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(5))
    file_object.write(rnd_string + '\n')

    os.system("git add .")
    os.system("git commit -m \"New commit\"")
    os.system("git push")
    time.sleep(5)

file_object.close()