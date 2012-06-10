#!/bin/bash

test 1 -ne $# && { echo "test 1 -ne (is $# \$#), exiting"; exit 1;}

DIR=$1

test ! -d $DIR && { echo "test ! -d (is $DIR \$DIR), exiting"; exit 1;}

cd $DIR

java Main

