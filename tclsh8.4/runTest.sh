#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 -eq (is $# \$#), exiting"; exit 1;}

tclsh8.4 $1

