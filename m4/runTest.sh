#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 (is $# \$#), exiting"; exit 1;}

FILE="${1}"

test "$( realpath "$FILE" )" == "$( realpath "testenv.m4" )" && exit 0

m4 --prefix-builtins "${1}"

