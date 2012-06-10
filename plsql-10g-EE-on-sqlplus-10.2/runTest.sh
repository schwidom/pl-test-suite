#!/bin/bash

test ! 1 -eq $# && { echo "test ! 1 (is $# \$#), exiting"; exit 1;}
test -z "${ORACLE_TEST_CONNECTION}" && { echo 'test -z "${ORACLE_TEST_CONNECTION}", exiting'; exit 1;}

FILE="${1}"

{

echo 'set serveroutput on'
echo
cat testenv.sql
echo
cat "${FILE}"
echo
} | sqlplus -S "${ORACLE_TEST_CONNECTION}" 

