#! /bin/bash
bash --version 
env 
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}
ps -e -f
ps -ef
df --human-readable
df -h
bash blackhatbash1.sh
# Run the script blackhatbash1.sh.
bash -r blackhatbash1.sh
# Run Bash in restricted mode to limit certain operations.

bash -n blackhatbash1.sh