#!/bin/bash

test $# -eq 1 || { echo "usage: $0 <file>.c, exiting"; exit 1;}

test "$( realpath "$1" )" == "$( realpath "testenv.c" )" && exit 0

export LANG=C
export LC_ALL=C

gcc -Wall testenv.c $1 && ./a.out

