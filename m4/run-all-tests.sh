#!/bin/bash

for i in *.m4; do echo "$i"; ./runTest.sh "$i"; done

