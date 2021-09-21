#!/bin/bash

#create a file containing the free memory on the computer
free -h | grep Mem: | awk -F " " '{print$4}' >> free_mem.txt

#create a file containing disk usage
du -h >> disk_use.txt

#list all open files
lsof >> open_list.txt

#create a file containing free disk storage
df -h --total | grep total | awk -F " " '{print$4}' >> free_disk.txt


#can add to cron directory to automate this action weekly
#sudo cp system_info_tool.sh /etc/cron.weekly
