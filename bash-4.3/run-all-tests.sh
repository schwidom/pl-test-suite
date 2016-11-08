#!/bin/bash

for i in *.sh; do echo "$i"; ./runTest.sh "$i"; done

