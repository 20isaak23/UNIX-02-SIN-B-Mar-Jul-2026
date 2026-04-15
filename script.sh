#Part 1 
#Estructure = Command/ options/ arguments 
ls -a and ls --all # List all the files and directories

#Part2
ls -l -a -h
ls -l -ah
ls -lah
#The result is the same, the diference is: If you want save
#script, write the command large if you want make to do fast, 
#write the comand short. the result is the same in the three

#Part3 
mkdir -- -rf #Create a file call -rf
rmdir -- -rf #Delete the file -rf

#Part4
ls --help # Quick summary, fits on one screen
man ls # Full Manual 
man git-clone # Show a manual of git
--depth # To show the last commit 

#Part5
chmod +x script.sh #all users can execute (Is equall to a+x)
chmod u+x script.sh #Only the owner can execute
chmod o-r script.sh #remove the lecture
chmod u+rw,go-rwx script.sh #Only the owner can execute 

#Sudo: Superuser
#Part A
#Does works or not?
sudo echo "hola" > /etc/archivo_protegido #No, doesn´t works because it need other sudo for 
#the second part (/etc/archivo_protegido)

#Part B
echo "hola" | sudo tee /etc/archivo_protegido>/dev/null
# This command execute with privileges of root, for that the scripture in the protected file
#is with high level permits 
echo "hola" | sudo tee /etc/archivo_protegido
# This command y almost similar with the first command but don´t execute priviligetes with root
Cat /etc/archivo_protegido # Is for confirm

#Part c
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
# It is an instruction that uses root privileges to append the text "chao" to the end 
#of a protected system file without failing write permissions.
cat /etc/archivo_protegido
# Is for verificate

#Part d
#There ara full sudos, this is only one
sudo su - #It works to log us in as root
exit # It´s for leave of root