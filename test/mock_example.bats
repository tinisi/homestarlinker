#!/usr/bin/env bats

load helper

# this is the "code under test"
# it would normally be in another file
format_date() {
  date -r 222
}

DESCRIBE="date format util"

setup() {
  _DATE_ARGS='-r 222'
  stub date \
      "${_DATE_ARGS} : echo 'I am stubbed!'" \
      "${_DATE_ARGS} : echo 'Wed Dec 31 18:03:42 CST 1969'"
}

teardown() {
  unstub date
}

@test "${DESCRIBE} formats date with expected arguments" {
  result="$(format_date)"
  [ "$result" = 'I am stubbed!' ]

  result="$(format_date)"
  [ "$result" = 'Wed Dec 31 18:03:42 CST 1969' ]
}
