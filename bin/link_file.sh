#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

link_file () {
  HOME_DIR=${1:-}
  FILES_DIR=${2:-}
  FILE=${3:-}
  if [ -e "$HOME_DIR/$FILE" ]; then
    mv "${HOME_DIR}/${FILE}" "${HOME_DIR}/${FILE}.backup"
  fi
  ln -s "${FILES_DIR}/${FILE}" "${HOME_DIR}/${FILE}"
}
