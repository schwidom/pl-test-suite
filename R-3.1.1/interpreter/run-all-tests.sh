#!/bin/bash

for i in *.R; do echo "$i"; ./runTest.sh "$i"; done

