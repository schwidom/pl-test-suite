#!/bin/bash

test $# -eq 2 || { echo "usage: $0 base1 base2; copies base1.* to base2.*, when base1.sh exists; exiting"; exit 1;}


test -f $1.sh || { echo "$1.sh is not a file; exiting"; exit 1;}
test -x $1.sh || { echo "$1.sh is not executable; exiting"; exit 1;}

test -e $2.sh && { echo "$2.sh already exists; exiting"; exit 1;}

for i in $1.*; do
 EXT=${i/$1/}
 cp -vdp $1$EXT $2$EXT
done

