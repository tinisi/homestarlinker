#!/usr/bin/env bash

FILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../files && pwd)

link_file () {
  if [ "$(readlink "$HOME/$1")" == "$(find "${FILES_DIR}" -type f -name "$1")" ]; then
    rm "$HOME/$1"
  fi
}

export link_file
