#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

run_hook () {
  FILES_DIR=${1:-}
  HOOK=${2:-}
  if [ -e "${FILES_DIR}/${HOOK}" ]; then
  	"${FILES_DIR}/${HOOK}"
  fi
}
