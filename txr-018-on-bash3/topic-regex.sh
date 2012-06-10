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
a @{A /a*/}@{B /b*/}
@(output)
@@A=@A, @@B=@B
@(end)
EOF

  echo "a aaaabbbbb" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test '@A=aaaa, @B=bbbbb' = "$(cat output.txt)"

  echo "a bbb" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test '@A=, @B=bbb' = "$(cat output.txt)"


  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 4

echo $(tst_result)

