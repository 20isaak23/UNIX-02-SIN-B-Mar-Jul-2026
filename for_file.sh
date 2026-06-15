#! /bin/bash 
for file in example_file*; do # Here show a bucle
 if [[ "${file}" == "example_file1" ]]; then
 echo "Skipping the first file" #This condition is that example_file1 skip 
continue #But the code follow with the command 
 fi
 echo "${RANDOM}" > "${file}" #Later print a random number 
done
