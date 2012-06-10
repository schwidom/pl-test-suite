#!/bin/bash

test 1 -eq $# || { "usage: $0 <source>.icn"; exit 1;}

FILENAME=$( basename $1 .icn)

icont $FILENAME testenv &&

echo "-------------------------" &&

./$FILENAME

