#!/bin/bash
SIGNAL_TO_STOP_FILE="stoploop" #In other terminal put'll "stoploop" for finalied the bucle 
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do #Use the word while for create a bucle  using a file test operator. The loop won’t exit
#until the condition is satisfied
 echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exis
t..."
 echo "Checking again in 2 seconds..."
 sleep 2
done
echo "File was found! Exiting..." #Once the file is available, the loop will stop, and the script will continue to the echo command

