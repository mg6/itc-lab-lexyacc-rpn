#!/bin/bash

set -euo pipefail

. assert.inc.sh

run_suite() {
  # single argument
  assert_grep '7' '=> 7'
  assert_grep '-5' '=> -5'

  # single operation
  assert_grep '1 2 +' '=> 3'
  assert_grep '1 2 -' '=> -1'
  assert_grep '1 2 *' '=> 2'
  assert_grep '1 2 /' '=> 0'
  assert_grep '2 1 /' '=> 2'
  assert_grep '-1 -3 +' '=> -4'

  # multiple operations
  assert_grep '1 2 3 + +' '=> 6'
  assert_grep '3 2 - 1 +' '=> 2'
  assert_grep '1 5 3 / 2 6 + - 4 * 8 + *' '=> -20'
}

run_suite
