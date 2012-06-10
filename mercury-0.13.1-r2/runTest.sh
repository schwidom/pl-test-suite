#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 -eq (is $# \$#), exiting"; exit 1;}

SOURCEFILE="$1"
EXECUTABLE=${SOURCEFILE/%.m/}
test "${SOURCEFILE}" == "${EXECUTABLE}" && { echo "test (is ${SOURCEFILE} \${SOURCEFILE}) -eq (is ${EXECUTABLE} \${EXECUTABLE}), exiting"; exit 1;}

rm -f ./"${EXECUTABLE}"

mmc -i testenv.m
mmc -c testenv.m

mmc "${SOURCEFILE}" testenv.m

./"${EXECUTABLE}"

