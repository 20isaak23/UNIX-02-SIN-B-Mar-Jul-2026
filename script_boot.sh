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
 