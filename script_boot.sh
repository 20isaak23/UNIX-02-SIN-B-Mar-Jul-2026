boot
cd: Change the directory root, create this symnol ~
cd /cd /home/codespace: Acces to the folder of user specific 
cd ~ : Return to folder of home 
cd $HOME: change the driectory personal, we use the variable entorn
Directory . -> Is hard link, represent the actual directory
Directory .. -> Is hard link, represent the father directory 
ls -lai -> List in format list, all the Inodos 
total 12
925559 drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:42 .
918515 drwxr-x--- 1 codespace codespace 4096 Apr  6 12:42 ..
 ➜ ~/proyecto $ stat . -> If I have Device 0 its means that 
 my computer dont have Sould disc, summary show the metadata 
 dataill the actual directory 
 mkdir -p /tmp/prueba/sub1/tmp/prueba/sub2 stat/tmp/prueba
 -> The first command confirms the existence of the path, 
 The first command confirms the existence of the path, 
 and the second command validates its security and status properties.
 man mkdir -> Its a manual for soport us, have the information of mkdir 
 pwd -> Where I am?
 Whoami -> Who I am?

 #ls 
 ls -> List the files or file
 ls -l -> Show all the infomation in columns
 ls -la -> List all the hide files 
 ls -lh -> List the file Displays 
 a detailed list of files, 
 translating the size in bytes into understandable units.
 ls -lt-> List with the time 
 ls / -> list the FHS 

 # Head 20
 ls /etc | head -20 -> List the contents of the system 
 configuration folder, showing only the first 20 items.
 ls /dev | head -20 -> Displays hardware device files
 show the first 20 lines 
 ls -la -> It performs a detailed listing that includes hidden 
 files (those that begin with a dot) and shows permissions, 
 owners, and sizes of the entire directory.
