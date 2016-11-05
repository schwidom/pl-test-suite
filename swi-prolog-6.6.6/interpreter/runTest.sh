#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 (is $# \$#), exiting"; exit 1;}

FILE="${1}"

test "$( realpath "$FILE" )" == "$( realpath "testenv.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "testenv_V2.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "consult_testdata.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "consult_testdata2.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "consult_testdata3.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "qcompile_testdata.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "qcompile_testdata2.pl" )" && exit 0
test "$( realpath "$FILE" )" == "$( realpath "qcompile_testdata3.pl" )" && exit 0

test ! -f "${FILE}" && { echo "test ! -f (is \"${FILE}\" \"$\{FILE}\"), exiting"; exit 1;}

test "${FILE}" == "${FILE/%.pl/}" && { echo 'test "${FILE}" == "${FILE/%.pl/}", exiting'; exit 1;}

#gprolog --init-goal "consult( ${FILE/%.pl/})" --query-goal "main" --query-goal ""

#pl -s "${FILE}" -g main -t halt # gentoo
swipl -q -f none -s "${FILE}" -g main -t halt # debian

