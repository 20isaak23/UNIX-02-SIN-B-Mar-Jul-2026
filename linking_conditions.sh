#!/bin/bash

DIR_NAME="dir_test"
mkdir "${DIR_NAME}"


if [[ -f "${DIR_NAME}" ]] || [[ -d "${DIR_NAME}" ]]; then
    echo "${DIR_NAME} is either a file or a directory."
fi


if touch test123; then
    echo "OK: file created"
fi

