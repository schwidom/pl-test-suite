#!/bin/bash

for i in *.c; do echo "$i"; ./runTest.sh "$i"; done

