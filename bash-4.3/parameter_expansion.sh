#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 A=""
 B="b"

 tst_test test -z "${A}"
 tst_test test "b" = "${B}"

 tst_test test "z" = "${A:-z}"
 tst_test test "b" = "${B:-z}"

 tst_test test "" = "${A:+z}"
 tst_test test "z" = "${B:+z}"

 tst_test test -z "${A}"
 tst_test test "b" = "${B}"

 tst_test test "z" = "${A:=z}"
 tst_test test "b" = "${B:=z}"

 tst_test test "z" = "${A}"
 tst_test test "b" = "${B}"

 tst_checkComplainAndAdjustExpected 12

 A="ABCD"

 tst_test test "ABCD" = "${A:0}"
 tst_test test "BCD" = "${A:1}"

 tst_test test "BC" = "${A:1:2}"

 tst_test test "ABCD" = "${A}"

 tst_test test 4 -eq "${#A}"

 tst_checkComplainAndAdjustExpected 5


 for i in "${!A@}"; do unset $i; done

 tst_test test -z "${!A*}"

 A1=1 A2=2

 tst_test test "A1 A2" = "${!A*}"

 tst_checkComplainAndAdjustExpected 2

 PATH_LIKE="a:b:c:d:e"

 tst_test test "a b:c:d:e" = "${PATH_LIKE/:/ }"
 tst_test test "a b c d e" = "${PATH_LIKE//:/ }"

 tst_test test "a:b:c:d:e" = "$PATH_LIKE"

 tst_test test "a:b:c:d:e" = "${PATH_LIKE/#b:/}"
 tst_test test "-b:c:d:e" = "${PATH_LIKE/#a:/-}"

 tst_test test "a:b:c:d:e" = "${PATH_LIKE/%:d/}"
 tst_test test "a:b:c:d-" = "${PATH_LIKE/%:e/-}"

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 7

echo $(tst_result)

