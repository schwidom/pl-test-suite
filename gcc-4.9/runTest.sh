#!/bin/bash

test $# -eq 1 || { echo "usage: $0 <file>.c, exiting"; exit 1;}

FILE="${1}"

test "$( realpath "$FILE" )" == "$( realpath "testenv.c" )" && exit 0

export LANG=C
export LC_ALL=C

gcc -Wall testenv.c "$FILE" && ./a.out

