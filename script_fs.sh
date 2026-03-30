sudo apt update #Update the packet list and version availables 
# in the respositores
sudo apt upgrade #Install all the packets more recent
sudo apt install parted #dowload and install parted
sudo parted -l && echo -e "ln---\n" && lsblk -f && echo -e #
#If the first part (mean since -l until &&) is true, follow
# to next comand