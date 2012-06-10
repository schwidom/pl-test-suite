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


  cat <<EOF >input-data.txt
a
a
a
b
EOF

  cat <<EOF >script.txr
@(collect)
@{A /.*/}
@(end)
EOF
  
  cat <<EOF >output-data.exp
A[0]="a"
A[1]="a"
A[2]="a"
A[3]="b"
EOF

  txr script.txr input-data.txt >output.txt
  tst_test diff output-data.exp output.txt

  cat <<EOF >script.txr
@(collect)
@{A /.*/}
@(end)
@(bind (x y . z) A)
@(output)
@A @x @y @z
@(end)
EOF
  
  txr script.txr input-data.txt >output.txt
  tst_test test "aaab a a ab" = "$(cat output.txt)"

  cat <<EOF >script.txr
@(collect)
@{A /.*/}
@(until)
@{C /b/}@# until clause does not assign
@(end)
@{B /b/}
@(output)
@A:@B
@(end)
EOF
  
  txr script.txr input-data.txt >output.txt
  tst_test test "aaa:b" = "$(cat output.txt)"

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 3

echo $(tst_result)

