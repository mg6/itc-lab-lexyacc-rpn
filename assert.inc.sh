#!/bin/bash

nl='
'

test_pass() {
  local input="$1"
  local actual="$2"

  cat >&2 <<EOF
OK  [input => ${input//$nl/ <lf> }] [actual ${actual//$nl/ <lf> }]
EOF
}

test_fail() {
  local input="$1"
  local actual="$2"
  local expected="$3"

  cat >&2 <<EOF
Err [input => ${input//$nl/ <lf> }] [actual ${actual//$nl/ <lf> }] [expected ${expected//$nl/ <lf> }]
EOF
  exit 1
}

assert_grep() {
  local input="$1"
  local expected="$2"
  local actual
  export err=0

  actual="$(./lab <<< "$input")" || err=$?

  if ! [ "$err" -eq 0 ]; then
    test_fail "$input" "<exit code=${err}>" "$expected"
  fi

  grep -Eq "^${expected}$" <<< "${actual}" \
    && test_pass "$input" "$actual" "$expected" \
    || test_fail "$input" "$actual" "$expected"
}
