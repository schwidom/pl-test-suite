#!/bin/bash

mkdir -p work
rm -f work/*

test -f GeneralTest.class || javac GeneralTest.java

antlr -o work Aabcc_1_.g 

javac work/*.java

CLASSPATH+=":$PWD/work"

java GeneralTest Aabcc_1_Lexer Aabcc_1_Parser 4 1 <<EOF
abc;
EOF

java GeneralTest Aabcc_1_Lexer Aabcc_1_Parser 5 1 <<EOF
abcc;
EOF

java GeneralTest Aabcc_1_Lexer Aabcc_1_Parser 5 1 <<EOF
aabc;
EOF

java GeneralTest Aabcc_1_Lexer Aabcc_1_Parser 6 1 <<EOF
aabcc;
EOF

