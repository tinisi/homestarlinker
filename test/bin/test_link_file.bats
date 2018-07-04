#!/usr/bin/env bats

load ../helper

# shellcheck disable=SC1090
source "${PROJECT_DIR}"/bin/temp_link_file.sh

HOME="${PROJECT_DIR}/test/tmp"

setup() {
  touch "${HOME}"/somefile
}

teardown() {
  rm -rf "${HOME}"/somefile*
}

@test "moves existing file to backup" {
  run link_file "somefile"
  [ -e "$HOME/somefile.backup" ]
}

@test "creates a soft link of file in home folder" {
  run link_file "somefile"
  [ -h "$HOME/somefile" ]
}
