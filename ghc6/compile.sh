#!/bin/bash


ghc -o Main $( ./ghc-parameters.sh) &&

echo &&
echo "run with ./Main" &&
true
