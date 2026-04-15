echo '#!/bin/sh' > hola.sh #This command creates a file called hello.sh and inserts the "shebang" 
#header which defines sh as the interpreter to run the script.
echo 'echo "Hola desde mi primer script"' >> hola.sh #Add the text printing instruction 
#to the end of the hola.sh file without deleting the previous content
ls -l hola.sh # Displays detailed information about the hola.sh file, 
#including its permissions, owner, size, and modification date
./hola.sh # Run the script from the current directory so that the interpreter processes 
#the saved commands and displays the message in the terminal.
 solution # We use chmod x hola.sh for give permitions 

 Part 2
ls /etc #List the system configuration files
touch /etc/prueba.txt # Try creating an empty file called test.txt inside the system configuration folder
#But this need a sudo because /etc is root
