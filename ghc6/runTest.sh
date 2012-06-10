#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 (is $# \$#), exiting"; exit 1;}

FILE="${1}"

test ! -f "${FILE}" && { echo "test ! -f (is \"${FILE}\" \"$\{FILE}\"), exiting"; exit 1;}

EXECUTABLE="${FILE/%.hs/}"

test "${FILE}" == "${EXECUTABLE}" && { echo 'test "${FILE}" == "${EXECUTABLE}", exiting'; exit 1;}

cat <<EOF > Main2.hs

module Main where

 import TestEnv
 import ${EXECUTABLE}

 main =

  startTests () >>=
  checkComplainAndAdjustExpected 0 >>=
  ${EXECUTABLE}.tests >>=
  checkComplainAndAdjustExpected 0 >>=
  result

EOF

ghc -o "${EXECUTABLE}" TestEnv.hs "${FILE}" Main2.hs &&
 ./"${EXECUTABLE}"

rm Main2.{hs,hi,o}

