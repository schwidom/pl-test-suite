#!/bin/bash

test $# == 1 || { echo "usage $0 <file>.java; exiting"; exit 1;}

FILE_JAVA=$1

javac $FILE_JAVA &&

java ${FILE_JAVA/%.java/}

