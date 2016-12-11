#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 readarray -t A <<<"$(seq 1 10)"

 tst_test test 10 -eq "${#A[@]}"
 tst_test test "1 2 3 4 5 6 7 8 9 10" == "${A[*]}"

 readarray -t A <<EOF
$(seq 1 9)
EOF

 tst_test test 9 -eq "${#A[@]}"
 tst_test test "1 2 3 4 5 6 7 8 9" == "${A[*]}"

 readarray -t A -fd 0 < <(seq 1 8)

 tst_test test 8 -eq "${#A[@]}"
 tst_test test "1 2 3 4 5 6 7 8" == "${A[*]}"

 

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 6

echo $(tst_result)

