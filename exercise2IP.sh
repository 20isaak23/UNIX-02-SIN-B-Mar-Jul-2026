#!/bin/bash
# Define variables from the positional arguments provided by the user 
NAME="${1}"  
DOMAIN="${2}"
OUTPUT_FILE="results.csv"

# Validate that both arguments were provided; exit with an error message if either is missing
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  echo "You must provide two arguments to this script."
  echo "Example: ${0} mysite nostarch.com"
  exit 1
fi

# Write the CSV header line to the output file (overwrites any existing file)
echo "status,name,domain,timestamp" > ${OUTPUT_FILE}

# Ping the domain once; if it succeeds, log "success" — otherwise log "failure" — with a timestamp
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
else
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
fi