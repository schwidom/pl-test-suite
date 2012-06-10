#!/bin/bash

mkdir -p work
rm -f work/*

antlr -o work T_.g 

CLASSPATH+=":$PWD/work"

javac T_Test.java

java T_Test <<EOF
x
EOF

