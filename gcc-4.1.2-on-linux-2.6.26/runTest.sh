#!/bin/bash

test $# -eq 1 || { echo "usage: $0 <file>.c, exiting"; exit 1;}

gcc testenv.c $1 && ./a.out

