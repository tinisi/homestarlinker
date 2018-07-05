#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

FILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../files && pwd)

run_hook () {
  HOOK=${1:-}
  if [ -e "${FILES_DIR}/${HOOK}" ]; then
  	"${FILES_DIR}/${HOOK}"
  fi
}
