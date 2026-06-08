#! /bin/bash
SCRIPT_NAME="$ {0}"
TARGET="${1}"
echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping "${TARGET}"

echo "The arguments are: $@"
echo "The total number of arguments is: $#"

# Change "$@" to "$*" to observe behavior.
for args in "$@"; do
echo "${args}"
done

# Later we have to make this command
#bash -x ping_with_arguments.sh 127.0.0.1 127.0.0.1 127.0.0.1