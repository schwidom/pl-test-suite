#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 (is $# \$#), exiting"; exit 1;}

FILE="${1}"

test "$( realpath "$FILE" )" == "$( realpath "testEnv.R" )" && exit 0

test ! -f "${FILE}" && { echo "test ! -f (is \"${FILE}\" \"$\{FILE}\"), exiting"; exit 1;}

test "${FILE}" == "${FILE/%.R/}" && { echo 'test "${FILE}" == "${FILE/%.R/}", exiting'; exit 1;}

#gprolog --init-goal "consult( ${FILE/%.pl/})" --query-goal "main" --query-goal ""

LANG=C R --no-save --no-readline --quiet --slave -f "${FILE}"


