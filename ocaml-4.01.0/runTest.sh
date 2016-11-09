#!/bin/bash

test 1 -eq $# || { echo "usage: $0 fname.ml, exiting"; exit 1;}

FILE="${1}"

test "$( realpath "$FILE" )" == "$( realpath "testenv.ml" )" && exit 0


FNAME_ML="$FILE"
FNAME_BIN="$( basename "$FNAME_ML" .ml).bin"


test "X$FNAME_ML".bin == "X$FNAME_BIN" && { echo "$FNAME_ML dont end with .ml, exiting"; exit 1;}

test -f $FNAME_ML || { echo "$FNAME_ML dont exists, exiting"; exit 1;}

ocamlc testenv.mli testenv.ml $FNAME_ML -o $FNAME_BIN &&

./$FNAME_BIN

