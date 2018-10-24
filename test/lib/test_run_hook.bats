#!/usr/bin/env bats

load ../helper

DESCRIBE="run_hook function"

source "${PROJECT_DIR}"/lib/run_hook.sh

FILES_DIR="${PROJECT_DIR}/test/tmp"

setup() {
  cat <<END > "${FILES_DIR}"/some_hook.sh
echo "I am a hook!"
END
  chmod u+x "${FILES_DIR}"/some_hook.sh
}

teardown() {
  rm -rf "${FILES_DIR}"/some_hook.sh
}

@test "${DESCRIBE} runs hook if file exists" {
  result="$(run_hook "${FILES_DIR}" "some_hook.sh")"
  [ "$result" = "I am a hook!" ]
}

@test "${DESCRIBE} does not error if file does not exist" {
  result="$(run_hook "${FILES_DIR}" "bad_file_name.sh" && echo $?)"
  echo $result
  [ "$result" = "0" ]
}
