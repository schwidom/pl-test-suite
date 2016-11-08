#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 tst_test test '-1+ -4+ -7+ -10+' = "$(echo -{1..11..3}+)"

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 1

echo $(tst_result)

