#!/bin/bash

source testenv.source


tst_checkComplainAndAdjustExpected 0

(

 coproc X while true; do stdbuf -i 0 -e 0 -o L echo 1; stdbuf -i 0 -e 0 -o L echo 2; done; 
 XPID="$!"

 coproc Y while true; do stdbuf -i 0 -e 0 -o L echo 3; stdbuf -i 0 -e 0 -o L echo 4; done; 
 YPID="$!"

 # tst_test [[ "${X[@]}" =~ ^[[:digit:]]+\ [[:digit:]]+$ ]] # works in console inexplicably
 tst_test [[ "${X[*]}" =~ ^[[:digit:]]+\ [[:digit:]]+$ ]] 
 tst_test [[ "${Y[*]}" =~ ^[[:digit:]]+\ [[:digit:]]+$ ]] 

 # VAR1="$( head -n 3 <&"${X[0]}")" 
 # VAR2="$( printf "1\n2\n1\n")"

 # echo "VAR1 $VAR1"
 # echo "VAR2 $VAR2"

 # tst_test test "$VAR1" == "$VAR2"

 tst_test test "$( head -c 6 <&"${X[0]}")" == "$( printf "1\n2\n1\n")"

 tst_test test "$( head -c 6 <&"${Y[0]}")" == "$( printf "3\n4\n3\n")"

 tst_test test "$( head -c 6 <&"${X[0]}")" == "$( printf "2\n1\n2\n")"

 tst_test test "$( head -c 6 <&"${Y[0]}")" == "$( printf "4\n3\n4\n")"

 # "${X[0]}" <&-
 # "${Y[0]}" <&-

 # eval "${X[1]}<&-"
 # eval "${X[0]}>&-"
 # eval "${Y[1]}<&-"
 # eval "${Y[0]}>&-"

 kill "$YPID"
 kill "$XPID" 

 wait "$YPID" 2>/dev/null # creates errormessage here, when 'wait' is not given, then afterwards
 wait "$XPID" 2>/dev/null # creates errormessage here, when 'wait' is not given, then afterwards

 # tst_test [[ "${X[*]}" =~ ^$ ]] # still fails
 # tst_test [[ "${Y[*]}" =~ ^$ ]] # still fails

 tst_state_save

 # I was not able to entirely close both coprocs 

) 2>/dev/null # warning: execute_coproc: coproc [<nr>:X] still exists

tst_state_load

tst_checkComplainAndAdjustExpected 6

echo $(tst_result)



