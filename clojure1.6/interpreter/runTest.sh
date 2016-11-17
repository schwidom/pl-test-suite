#!/bin/bash

test $# -eq 1 || { echo "usage: $0 <file>.c, exiting"; exit 1;}

FILE="${1}"

test "$( basename "$FILE" .clj).clj" == "$( basename "$FILE")" || { echo "wrong filename extension"; exit 1;}

test "$( realpath "$FILE" )" == "$( realpath "testenv.clj" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "testdata.clj" )" && exit 0

export LANG=C
export LC_ALL=C

clojure -i testenv.clj -i testdata.clj "$FILE"

