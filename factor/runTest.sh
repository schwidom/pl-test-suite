#!/bin/bash

test ! -d $1 && { echo "test ! -d (is $1 \$1), exiting"; exit 1;}

unset DISPLAY

export FACTOR_ROOTS="$PWD"

DIR=$1

factor "${DIR}/$( basename "${DIR}").factor"

