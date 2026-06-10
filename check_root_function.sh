#!/bin/bash
# This function checks if the current user ID equals zero.
check_if_root(){ #check_root_function.sh 
if [[ "${EUID}" -eq "0" ]]; then #(EUID) Effective user ID this code use for know if is true or is false 
 return 0
 else
 return 1
 fi
}
if check_if_root; then
 echo "User is root!"
else
 echo "User is not root!"
fi

#Create a new user "boo" with useradd 
#later comprobate with su -"boo" and whoami
