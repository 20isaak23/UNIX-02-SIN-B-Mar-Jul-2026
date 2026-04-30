#List of commands on linux
#Part 1
#This command lists the files and directories located in the Documents folder of the home directory. 
ls ~/Documents

#Part 2
#This command list all the files in this directory
ls 

#Part 3
#This command works only for draw a cow its a joke but dont they have no functionality.
aptitude moo

#Part 4
#ls -l: Show the list files in format more large
ls -l
#ls -r: show the list files but in reverse 
ls -r
#ls -l -r: Show the list of files in format large but in reverse 
ls -l -r
#ls -lr: Show the list of files in format large in reverse, but is more short the command
ls -lr
#If we put (-v) we say to system "Hey I want see th cow" always the system tell you diferrent 
#results
aptitude -v moo 
aptitude -vv moo
aptitude -vvv moo
aptitude -vvvv moo
aptitude -vvvvv moo

#Part5
#Show your actual directory
pwd

#Part6
#This command change directory
cd 
#This command show thw directory documents 
cd Documents 
#It takes you to the highest level of the entire Linux file system.
cd /
#With this command, return to home directory
cd /home/codespace
#This command routes the document directory to school and gives art there
cd School/art

#Shortcuts
#This command back one directory 
cd ..
#This command return to home directory or directory original 
cd ~

#Part7
#Whit this command show a list more large and organizate 
ls -l /var/log/
#The -t option will sort the files by their timestamp.
ls -lt /var/log/
#The -S (size) option will sort the files by file size
ls -l -s /var/log
#The -r (reverse) option will reverse the order of any sorting type.
ls -lsr /var/log
#Using only the -r option with the file list in reverse alphabetical order

#Part8
#The `su` command allows you to temporarily act as a different user.
su -
#This command is for leave of su
exit 
#We configured the steam locomotive, sl command to require administrative access.
sl
#The sudo command allows a user to run a command as another user without having to create a new shell; it can also be used to switch to other user accounts.
sudo

#Part9
#list only the files in that file
ls -l hello.sh   

#Part10
#Permits
r = read (4)
w = write (2)
x = execute (1)
#Persons
#User /Group /Others
#Symbols
+ = add
- = less
#This command is for change permitions
chmod
#This command add execute to user in hello.sh
chmod u+x hello.sh
#This indicates that the “command” must be executed from the current directory.
./hello.sh
