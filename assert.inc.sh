#!/bin/bash

assert_grep() {
  input="$1"
  expected="$2"
  actual="$(./lab <<< "$input")"

  grep -Eq "^${expected}$" <<< "${actual}" && {
    cat <<EOF
OK  [input => ${input}] [actual ${actual}]
EOF
  } || {
    cat <<EOF
Err [input => ${input}] [actual ${actual}] [expected ${expected}]
EOF
    exit 1
  }
}
