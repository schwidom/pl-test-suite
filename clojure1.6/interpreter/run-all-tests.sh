#!/bin/bash

for i in *.clj; do echo "$i"; ./runTest.sh "$i"; done

