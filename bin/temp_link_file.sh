#!/usr/bin/env bash

FILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../files && pwd)

link_file () {
  if [ -e "$HOME/$1" ]; then
    mv "$HOME/$1" "$HOME/$1.backup"
  fi
  ln -s "$FILES_DIR/$1" "$HOME/$1"
}

export link_file
