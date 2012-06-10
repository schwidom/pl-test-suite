#!/bin/bash

test $# == 1 || { echo "usage $0 <file>.cs; exiting"; exit 1;}

FILE_CS=$1
FILE_EXE="Test.exe"

mcs -out:"${FILE_EXE}" $FILE_CS TestEnv.cs &&

mono $FILE_EXE

