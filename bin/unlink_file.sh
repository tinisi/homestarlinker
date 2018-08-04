#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

unlink_file () {
  HOME_DIR=${1:-}
  FILES_DIR=${2:-}
  FILE=${3:-}
  if [ "$(readlink "$HOME_DIR/${FILE}")" == "$(find "${FILES_DIR}" -type f -name "${FILE}")" ] || [ "$(readlink "$HOME_DIR/${FILE}")" == "$(find "${FILES_DIR}" -type d -name "${FILE}")" ]; then
    rm "${HOME_DIR}/${FILE}"
  fi
}
