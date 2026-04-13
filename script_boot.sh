# boot
cd: Change the directory root, create this symnol ~
cd /cd /home/codespace: Acces to the folder of user specific 
cd ~ : Return to folder of home 
cd $HOME: change the driectory personal, we use the variable entorn
#Directory . -> Is hard link, represent the actual directory
#Directory .. -> Is hard link, represent the father directory 
#ls -lai -> List in format list, all the Inodos 
#total 12
#925559 drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:42 .
#918515 drwxr-x--- 1 codespace codespace 4096 Apr  6 12:42 ..
# ➜ ~/proyecto $ stat . -> If I have Device 0 its means that 
# my computer dont have Sould disc, summary show the metadata 
# dataill the actual directory 
# mkdir -p /tmp/prueba/sub1/tmp/prueba/sub2 stat/tmp/prueba
# -> The first command confirms the existence of the path, 
# The first command confirms the existence of the path, 
# and the second command validates its security and status properties.
# man mkdir -> Its a manual for soport us, have the information of mkdir 
# pwd -> Where I am?
# Whoami -> Who I am?

 #ls 
 #ls -> List the files or file
 #ls -l -> Show all the infomation in columns
 #ls -la -> List all the hide files 
 #ls -lh -> List the file Displays 
 #a detailed list of files, 
 #translating the size in bytes into understandable units.
 #ls -lt-> List with the time 
 #ls / -> list the FHS 

 # Head 20
 #ls /etc | head -20 -> List the contents of the system 
 #configuration folder, showing only the first 20 items.
 #ls /dev | head -20 -> Displays hardware device files
 #show the first 20 lines 
 #ls -la -> It performs a detailed listing that includes hidden 
 #files (those that begin with a dot) and shows permissions, 
 #owners, and sizes of the entire directory.

#Part 4: Compile Busy Box

git clone --depth 1 https://git.busybox.net/busybox
cd busybox -> #It contains all the basic Unix utilities (ls, grep, vi, etc.) in a single executable.
# Note: Cloning BusyBox takes you to a new repository.

# It's important to remember to return to the main directory (cd ..)
# to continue working on your custom branch.

make menuconfig -> # We launch the menu to define BusyBox as a static binary
# This avoids dependencies on external libraries in our minimal distro

make -j 2 -> #We compiled using 2 cores to speed up the process

# Install in the directory of initramfs

sudo mkdir /boot-files/initramfs
sudo make CONFIG_PREFIX=/boot-files/initramfs install

# Part 5: Create the initramfs

cd /boot-files/initramfs -> # We enter the directory where the initial file system files are located.

sudo vi init # Create the main startup script. The content #!/bin/sh followed by /bin/sh 
# tells the system: "as soon as you load, launch a command prompt."

#!/bin/sh # You create the main startup script. The content #!/bin/sh followed by /bin/sh 
/bin/sh #tells the system: "as soon as you load, launch a command console."

sudo rm linuxrc #Remove the old startup executable (used in very old versions of Linux) to avoid conflicts.
sudo chmod +x init #You give the new script execution permissions so that the kernel can run it.

sudo find . | cpio -o -H newc > ../init.cpio
cd ..
# You package all the files in the current directory into a special format 
# (cpio) that the Linux kernel can read during boot.

#Part 6 
sudo su -> #Switch to root for the following steps

dd if=/dev/zero of=boot bs=1M count=50 -> #Create an empty 50 MB file that will 
#serve as a virtual disk

mkfs -t fat boot -> #Create a FAT filesystem in that file

syslinux boot -> #Install the Syslinux bootloader on the image

mkdir m
mount boot m
cp bzImage init.cpio m
umount m
-> #Monta la imagen y copia el kernel y el initramfs:

#Part 7: Try using Qemu

qemu-system-x86_64 -nographic -append "console=ttyS0" \
 -kernel bzImage -initrd init.cpio -drive file=boot,format=raw -> #This command passes the kernel 
 # and initramfs directly to QEMU instead of booting from Syslinux.






