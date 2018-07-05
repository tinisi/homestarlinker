#!/usr/bin/env bats

load ../helper

# shellcheck disable=SC1090
source "${PROJECT_DIR}"/bin/link_file.sh

HOME="${PROJECT_DIR}/test/tmp"
FILES_DIR="${PROJECT_DIR}/test/tmp/files"

DESCRIBE="link_file function"

setup() {
  mkdir -p ${FILES_DIR}
  touch "${HOME}"/existingfile
  touch "${FILES_DIR}"/anotherfile
}

teardown() {
  rm -rf "${HOME}"/existingfile*
  rm -rf "${HOME}"/anotherfile*
  rm -rf "${FILES_DIR}"
}

@test "${DESCRIBE} moves existing file to backup" {
  run link_file "existingfile"
  [ -e "$HOME/existingfile.backup" ]
}

@test "${DESCRIBE} creates a soft link of file in home folder" {
  run link_file "anotherfile"
  [ "$(readlink "$HOME/anotherfile")" == "$(find "${FILES_DIR}" -type f -name "anotherfile")" ]
}
