#!/bin/bash

test $# -eq 1 || { echo "usage: $0 <file>.pl, exiting"; exit 1;}

FILE="${1}"

perl -w "$FILE"

