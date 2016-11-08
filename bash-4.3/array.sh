#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 ARRAY=( a b c)

 tst_test test "a" == "${ARRAY[ 0 ]}"
 tst_test test "b" == "${ARRAY[ 1 ]}"
 tst_test test "c" == "${ARRAY[ 2 ]}"

 tst_test test 3 -eq "${#ARRAY[*]}"
 tst_test test 3 -eq "${#ARRAY[@]}"

 set "${ARRAY[*]}"

 tst_test test "a b c" == "${1}"

 set "${ARRAY[@]}"

 tst_test test "a" == "${1}"
 tst_test test "b" == "${2}"
 tst_test test "c" == "${3}"
 
 tst_test test 3 -eq "${#*}"
 tst_test test 3 -eq "${#@}"

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 11

echo $(tst_result)

