#!/bin/bash
#
# download_images.sh - This script downloads images reading links in a file
#
# Site : www.github.com/gabriel-russo/Void-Wallpapers
# Author: Gabriel Russo <gabrielrusso@protonmail.com>
#
# -------------------------------------------------------------
# This script requires: curl
#
# This script download images from url in .txt file
# reading every line and doing a http request.
#
# Expected format inside .txt file:
# +----------links.txt-----------+
# | https://<link>.com/<img1>.png|
# | https://<link>.com/<img2>.png|
# | <empty line>                 |
# +------------------------------+
#
# Examples:
# $ ./download_images.sh links.txt
# Files will be in assets/walls/
# --------------------------------------------------------------
#
# Changelog:
# v1.0 03/06/2022, gabriel:
#     - Lorem ipsum
#
# License: CC-BY-4.0
#

# Silent Pushd and Popd
pushd() {
  command pushd "$@" >/dev/null
}

popd() {
  command popd "$@" >/dev/null
}

FILE=$1

if [ -e "${FILE}" ]; then

  while read line; do
    LINK="${line}"
    pushd "assets/walls"

    # If file have extension ...
    if $(echo "${LINK}" | grep -Eq '\.(png|jpg)'); then
      CODE=$(curl "${LINK}" -s -w '%{http_code}' -O)

    else # If file does not have extension ...

      FILE_NAME=$(echo ${LINK} | grep -Eo '[^/]+$')
      FILE_NAME="${FILE_NAME}.png"
      CODE=$(curl "${LINK}" -s -w '%{http_code}' -o "${FILE_NAME}")

    fi

    if [[ "$CODE" =~ ^2 ]]; then
      echo "SUCESS - ${LINK}"
    elif [[ "$CODE" = 404 ]]; then
      echo "FAILED - ${LINK}"
    else
      echo "ERROR: server returned HTTP code $CODE"
      exit 1
    fi

    popd
  done <${FILE}

else
  echo "File does not exist!"
fi
