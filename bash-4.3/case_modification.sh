#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 Y="abcd"
 Z="ABCD"

 tst_test test "Abcd" == "${Y^}" # upper first
 tst_test test "ABCD" == "${Y^^}" # upper all

 tst_test test "aBCD" == "${Z,}" # lower first
 tst_test test "abcd" == "${Z,,}" # lower all

 V="dadedidodu"

 tst_test test "DaDeDiDoDu" == "${V^^d}" # upper all selected
 # tst_test test "DaDeDiDoDu" == "${{V^^d}^^u}" # won't work.
 tst_test test "DADEDIDODU" == "${V^^?}" # upper all 
 tst_test test "DADEDIDODU" == "${V^^*}" # upper all 

 A1=(aa bb cc)

 tst_test test "AA-BB-CC" == "$(printf "%s-%s-%s" "${A1[@]^^}")"
 tst_test test "Aa-Bb-Cc" == "$(printf "%s-%s-%s" "${A1[@]^}")"

 tst_test test "AA BB CC" == "${A1[*]^^}" # see also array.sh
 tst_test test "Aa Bb Cc" == "${A1[*]^}" # see also array.sh

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 11

echo $(tst_result)

