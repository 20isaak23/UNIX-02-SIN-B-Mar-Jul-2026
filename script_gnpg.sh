# comados ejecutados 
gpg --version 
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long

gpg --armor --export 7F946AAB2BE9B927 > mi_llave_publica.asc
gpg --import llave_publica_henry.asc 
gpg --list-keys 
echo (" Mensaje secreto") > doc_no_cifrado.txt 
gpg --encrypt --recipient chineado12@gmail.com doc_no_cifrado.txt
gpg --decrypt "doc_cifrado (1).txt"
gpg --local-user 7F946AAB2BE9B927 --clearsign doc_no_cifrado.txt
gpg --local-user 7F946AAB2BE9B927 --sign doc_no_cifrado.txt
gpg --local-user 7F946AAB2BE9B927 --detach-sign doc_no_cifrado.txt

gpg --verify firma_henry.asc
gpg --verify firma_henry.gpg
gpg --verify firma_henry.sig doc_cifrado.txt
gpg --edit-key chineado12@gmail.com
gpg --local-user 7F946AAB2BE9B927 --sign-key 82B292987F6AD054B6435BD4B0E4743042965E13
#Here I used mi key ID for sign and used the ID of my companion 
gpg --decrypt mensaje_seguro.gpg > resultado_final.txt
#Decryp comand of henry 
cat resultado_final.txt
#Show the message of henry 
$ umask 
#default mask
0022

#Part 2
$ umask 027
$ touch archivo2
mkdir directorio2
ls -l
# We see the default mask of 027, later we create a file empty
# next created a directory and verificate 

#Part 3
sudo apt-get update 
sudo apt-get install acl
sudo chown -R $(whoami) .
sudo setfacl -bnR .
# This code is beacuse don´t works the back code
umask 077
touch secreto2.txt
mkdir secreto2 
ls -l
#We write this code for that we have the permiss more privade

#Part 4
chown # Change the propiertary
chgrp # change the group 

umask 022
whoami 
echo "Hola" > mi_archivo
ls -l mi_archivo
# Configure default permissions so others can only read, 
# show that you are the current user, and create a file with the text "Hello" 
# to verify your details.

useradd -m -s /usr/bin/zsh luna
sudo useradd -m -s /usr/bin/zsh luna
sudo chown luna mi_archivo
ls -l mi_archivo 
#Create the user luna with its own folder and zsh terminal, 
#give it ownership of my_file and verify the change

#Part 5
sudo usermod -a -G grupo_test luna
chgrp grupo_test comun
touch comun
sudo chgrp grupo_test comun
ls -l comun
#Add luna to the group group_test, create the common file and 
#assign it to that group, finally verifying the change of ownership.

newgrp
sudo newgrp grupo_test
