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
a b c @VAR i j k
@(output)
@@VAR=@VAR
@(end)
EOF

  echo "a b c def gh i j k" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test '@VAR=def gh' = "$(cat output.txt)"

  cat <<EOF >script.txr
@A:@B:@A
@(output)
@@A=@A, @@B=@B
@(end)
EOF

  echo "oo:ppp:oo" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test '@A=oo, @B=ppp' = "$(cat output.txt)"

  echo "a:b:a:b:a" | txr script.txr - >output.txt
  tst_test test 1 -eq $?
  tst_test test 'false' = "$(cat output.txt)"

  cat <<EOF >script.txr
@A::@B::@A
@(output)
@@A=@A, @@B=@B
@(end)
EOF

  echo "a::b:a:b::a" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test '@A=a, @B=b:a:b' = "$(cat output.txt)"

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 8

echo $(tst_result)

