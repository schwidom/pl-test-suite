#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 : this ... $( tst_test true; tst_state_save;) ... is a line comment with some action

 tst_state_load

 # this ... $( tst_test false; tst_state_save;) ... is a line comment without action

 tst_state_load

 # currently no block comments found
 # workaround for block comments:

cat <<EOF >/dev/null

 this ... $( tst_test true; tst_state_save;) ... is a block comment with some action

EOF

 tst_state_load
 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

