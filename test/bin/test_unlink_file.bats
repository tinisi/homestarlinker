#!/usr/bin/env bats

load ../helper

source "${PROJECT_DIR}"/bin/unlink_file.sh

HOME_DIR="${PROJECT_DIR}/test/tmp"
FILES_DIR="${PROJECT_DIR}/test/tmp/files"

DESCRIBE="unlink_file function"

setup() {
  mkdir -p "${FILES_DIR}"
  touch "${FILES_DIR}"/somefile
  ln -s "${FILES_DIR}"/somefile "${HOME_DIR}"
}

teardown() {
  rm -rf "${HOME_DIR}"/somefile
  rm -rf "${FILES_DIR}"
}

@test "${DESCRIBE} deletes link if it matches the source" {
  run unlink_file "${HOME_DIR}" "${FILES_DIR}" "somefile"
  [ ! -e "$HOME_DIR/somefile" ]
}

@test "${DESCRIBE} does not error out if the file does not match" {
  RESULT=$(run unlink_file "${HOME_DIR}" "${FILES_DIR}" "anotherfile" && echo $?)
  [ "$RESULT" == "0" ]
}
