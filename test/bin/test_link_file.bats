#!/usr/bin/env bats

load ../helper

DESCRIBE="link_file function"

source "${PROJECT_DIR}"/bin/link_file.sh

HOME_DIR="${PROJECT_DIR}/test/tmp"
FILES_DIR="${PROJECT_DIR}/test/tmp/files"

setup() {
  mkdir -p ${FILES_DIR}
  touch "${FILES_DIR}"/somedotfile
}

teardown() {
  rm -rf "${HOME_DIR}"/somedotfile
  rm -rf "${FILES_DIR}"
}

@test "${DESCRIBE} creates a soft link of file in home folder" {
  run link_file "${HOME_DIR}" "${FILES_DIR}" "somedotfile"
  [ "$(readlink "$HOME_DIR/somedotfile")" = "$(find "${FILES_DIR}" -type f -name "somedotfile")" ]
}
