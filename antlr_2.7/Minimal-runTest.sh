#!/bin/bash

mkdir -p work
rm -f work/*

antlr -o work Minimal_.g 

CLASSPATH+=":$PWD/work"

javac Minimal_Test.java

java Minimal_Test <<EOF
x
EOF

