#!/usr/bin/env bats

load helper

# echo "${BATS_MOCK_TMPDIR}" >&2

# this is the "code under test"
# it would normally be in another file
get_timestamp() {
  date -r 222
}

setup() {
  _DATE_ARGS='-r 222'
  stub date \
      "${_DATE_ARGS} : echo 'I am stubbed!'" \
      "${_DATE_ARGS} : echo 'Wed Dec 31 18:03:42 CST 1969'"
}

teardown() {
  unstub date
}

@test "get_timestamp" {
  result="$(get_timestamp)"
  [ "$result" == 'I am stubbed!' ]

  result="$(get_timestamp)"
  [ "$result" == 'Wed Dec 31 18:03:42 CST 1969' ]
}
