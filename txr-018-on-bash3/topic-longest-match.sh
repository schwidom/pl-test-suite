#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(

export NEWLINE="
"

 (
  rm -rf txr-work
  mkdir txr-work
  cd txr-work

  cat <<EOF >script.txr
a @*{LM1}cd
a @*{LM2}cd@/.*/
a @{LM3}cd@/.*/
@(output)
@@LM1=@LM1
@@LM2=@LM2
@@LM3=@LM3
@(end)
EOF

  INPUT="a b cdcdcd"
  echo "${INPUT}${NEWLINE}${INPUT}${NEWLINE}${INPUT}" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test '@LM1=b cdcd'"$NEWLINE"'@LM2=b cdcd'"$NEWLINE"'@LM3=b ' = "$(cat output.txt)"


  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

