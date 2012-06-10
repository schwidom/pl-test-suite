#!/bin/bash

test $# -ne 1 && { echo "usage: $0 <file>.scala, exiting"; exit 1;}

set -x

! test -f TestEnv.class && javac TestEnv.java

rm -rf \"

scala -nocompdaemon $1

