#!/bin/bash

test $# -ne 1 && { echo "usage: $0 filename.clp, exiting"; exit 1;}

#clips -f2 test-env.clp -f2 $1 -f2 exiting.clp
clips -f2 $1 -f2 exiting.clp
