#!/bin/bash

set -e

./cleanup.sh 

for i in *.ml; do echo "$i"; ./runTest.sh "$i"; done

