#!/usr/bin/env bats

load ../helper

DESCRIBE="link_file function when target file exists in ~"

source "${PROJECT_DIR}"/lib/link_file.sh

HOME_DIR="${PROJECT_DIR}/test/tmp"
FILES_DIR="${PROJECT_DIR}/test/tmp/files"

setup() {
  mkdir -p ${FILES_DIR}
  touch "${FILES_DIR}"/existingfile
  touch "${HOME_DIR}"/existingfile
  _DATE_ARGS='-u +%Y-%m-%dT%H-%M-%S'
  stub date \
      "${_DATE_ARGS} : echo '2018-07-20T05-56-41'"
}

teardown() {
  rm -rf "${HOME_DIR}"/existingfile*
  rm -rf "${FILES_DIR}"
  unstub date
}

@test "${DESCRIBE} moves existing file to backup with unique date stamp" {
  run link_file "${HOME_DIR}" "${FILES_DIR}" "existingfile"
  [ -e "$HOME_DIR/existingfile.homestarlinker.2018-07-20T05-56-41" ]
}
