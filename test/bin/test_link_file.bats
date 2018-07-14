#!/usr/bin/env bats

load ../helper

source "${PROJECT_DIR}"/bin/link_file.sh

HOME_DIR="${PROJECT_DIR}/test/tmp"
FILES_DIR="${PROJECT_DIR}/test/tmp/files"

DESCRIBE="link_file function"

setup() {
  mkdir -p ${FILES_DIR}
  touch "${HOME_DIR}"/existingfile
  touch "${FILES_DIR}"/anotherfile
}

teardown() {
  rm -rf "${HOME_DIR}"/existingfile*
  rm -rf "${HOME_DIR}"/anotherfile*
  rm -rf "${FILES_DIR}"
}

@test "${DESCRIBE} moves existing file to backup" {
  run link_file "${HOME_DIR}" "${FILES_DIR}" "existingfile"
  [ -e "$HOME_DIR/existingfile.backup" ]
}

@test "${DESCRIBE} creates a soft link of file in home folder" {
  run link_file "${HOME_DIR}" "${FILES_DIR}" "anotherfile"
  [ "$(readlink "$HOME_DIR/anotherfile")" == "$(find "${FILES_DIR}" -type f -name "anotherfile")" ]
}
