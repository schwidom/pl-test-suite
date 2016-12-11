#!/bin/bash

source testenv.source


tst_checkComplainAndAdjustExpected 0

(

 coproc X while true; do echo 1; echo 2; done; 
 XPID="$!"

 # tst_test [[ "${X[@]}" =~ ^[[:digit:]]+\ [[:digit:]]+$ ]] # works in console inexplicably
 tst_test [[ "${X[*]}" =~ ^[[:digit:]]+\ [[:digit:]]+$ ]] 

 # VAR1="$( head -n 3 <&"${X[0]}")" 
 # VAR2="$( printf "1\n2\n1\n")"

 # echo "VAR1 $VAR1"
 # echo "VAR2 $VAR2"

 # tst_test test "$VAR1" == "$VAR2"

 tst_test test "$( head -n 3 <&"${X[0]}")" == "$( printf "1\n2\n1\n")"

 kill "$XPID" &&

 wait "$XPID" 2>/dev/null # creates errormessage here, when 'wait' is not given, then afterwards

 tst_test [[ "${X[*]}" =~ ^$ ]]

 tst_state_save

)

tst_state_load

tst_checkComplainAndAdjustExpected 3

echo $(tst_result)



