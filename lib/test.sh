#!/bin/bash

test $# -eq 0 && { echo "usage: $0 <test-binary>.sh"; exit 1;}

TESTBINARY=$1

BASE=$(basename ${TESTBINARY} ".sh")

test "${BASE}" == "${TESTBINARY}" && { echo "filename ${TESTBINARY} ends not to .sh"; echo "usage: $0 <test-binary>.sh"; exit 1;}

test -x "${TESTBINARY}" || { echo "${TESTBINARY} is not executable"; exit 1;}
test -f "${TESTBINARY}" || { echo "${TESTBINARY} is no file"; exit 1;}


OUTFILE="${BASE}.out"
EXPECTED="${BASE}.exp"


"./${TESTBINARY}" > "${BASE}.out"

diff "${BASE}.out" "${BASE}.exp" && echo "test of $TESTBINARY succeeded" || echo "test of $TESTBINARY failed"

