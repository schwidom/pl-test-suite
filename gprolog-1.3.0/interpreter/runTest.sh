#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 (is $# \$#), exiting"; exit 1;}

FILE="${1}"

test ! -f "${FILE}" && { echo "test ! -f (is \"${FILE}\" \"$\{FILE}\"), exiting"; exit 1;}

test "${FILE}" == "${FILE/%.pl/}" && { echo 'test "${FILE}" == "${FILE/%.pl/}", exiting'; exit 1;}

gprolog --init-goal "consult( '${FILE/%.pl/}')" --query-goal "main" --query-goal "halt"

