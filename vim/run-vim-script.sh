#!/bin/bash

test 1 -eq $# || { "usage: $0 <source>.vim"; exit 1;}

vim -e -c ":source $1"

