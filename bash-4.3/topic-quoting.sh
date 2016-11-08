#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(
 A="a \"b\""
 set $A
 tst_test test a == $1
 tst_test test '"b"' == $2
 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

