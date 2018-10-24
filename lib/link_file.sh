#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

format_date() {
  date -u +%Y-%m-%dT%H-%M-%S
}

link_file () {
  HOME_DIR=${1:-}
  FILES_DIR=${2:-}
  FILE=${3:-}
  if [ -e "$HOME_DIR/$FILE" ]; then
    SUFFIX=$(format_date)
    mv "${HOME_DIR}/${FILE}" "${HOME_DIR}/${FILE}.homestarlinker.${SUFFIX}"
  fi
  ln -s "${FILES_DIR}/${FILE}" "${HOME_DIR}/${FILE}"
}
