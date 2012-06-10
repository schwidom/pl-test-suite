#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

 tst_test test '-a+ -b+ -c+' = "$(echo -{a,b,c}+)"
 tst_test test ',3: ,4: ,5:' = "$(echo ,{3..5}:)"
 tst_test test '*D/ *E/ *F/' = "$(echo *{D..F}/)"

 tst_test test '-q-5- -q-6- -z-5- -z-6-' = "$(echo -{q,z}-{5..6}-)"

 tst_test test '-a- -b- -c-' = "$(echo -{a,{b,c}}-)"
 tst_test test '-a- -b- -c-' = "$(echo -{{a,b},c}-)"
 tst_test test '-a- -b- --' = "$(echo -{{a,b},}-)"
 tst_test test '-a- -- -c-' = "$(echo -{{a,},c}-)"

 tst_test test '-{a}- -{b}- -{c}-' = "$(echo -{{a,b,c}}-)"

 tst_test test '-{a}- -b- -c-' = "$(echo -{{a},b,c}-)"
 tst_test test '-a- -{b}- -c-' = "$(echo -{a,{b},c}-)"
 tst_test test '-a- -b- -{c}-' = "$(echo -{a,b,{c}}-)"

 tst_test test '-a- -b..c-' = "$(echo -{a,b..c}-)"
 tst_test test '-a..b- -c-' = "$(echo -{a..b,c}-)"

 tst_test test '-a- -b- -c-' = "$(echo -{a,{b..c}}-)"
 tst_test test '-a- -b- -c-' = "$(echo -{{a..b},c}-)"
 
 tst_test test '-a- -b- -c-' = "$(echo -{a,{b,c}}-)"
 tst_test test '-a- -b- -c-' = "$(echo -{{a,b},c}-)"
 

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 18

echo $(tst_result)

