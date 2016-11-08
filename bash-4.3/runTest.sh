#!/bin/bash

test $# -eq 1 || { echo "usage: $0 <file>.pl, exiting"; exit 1;}

FILE="${1}"

# test "$( realpath "$FILE" )" == "$( realpath "runTest.sh" )" && exit 0
# test "$( realpath "$FILE" )" == "$( realpath "run-all-tests.sh" )" && exit 0
test -x "$FILE" && exit 0 # all tests shound have execution bit disabled

bash --noprofile --norc "$FILE"

