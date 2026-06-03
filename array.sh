#! /bin/bash


# Sets an array 
IP_ADDRESSES=(192.168.1.1 192.168.1.2 192.168.1.3)
# Prints all elements in the array 
echo "${IP_ADDRESSES[*]}" 
# Prints only the first element in the array 
echo "${IP_ADDRESSES[0]}"

# Delete de IP in the second position of the array
unset IP_ADDRESSES[1] 

#Print the array again to see the change
echo "${IP_ADDRESSES[*]}"


IP_ADDRESSES[0]="192.168.1.10" #Change the first element of the array



