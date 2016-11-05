#!/bin/bash

for i in *.pl; do echo "$i"; ./runTest.sh "$i"; done

