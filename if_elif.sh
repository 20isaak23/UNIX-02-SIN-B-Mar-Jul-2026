#!/bin/bash
USER_INPUT="${1}"
if [[ -z "${USER_INPUT}" ]]; then #That checks wheter the variable User_Input is null
echo "You must provide an argument!"
exit 1
fi
if [[ -f "${USER_INPUT}" ]]; then # That checks if there are a file
 echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then #That checks if there are a directory
 echo "${USER_INPUT} is a directory."
else
echo "${USER_INPUT} is not a file or a directory." #Print the arguments 
fi
