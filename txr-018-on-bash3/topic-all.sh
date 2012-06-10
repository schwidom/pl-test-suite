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
@(all)
@{A /ab/}@{B /c/}
@(and)
@{C /a/}@{D /bc/}
@(end)
@(output)
@A @B @C @D
@(end)
EOF

  echo "abc" | txr script.txr - >output.txt
  tst_test test "ab c a bc" = "$(cat output.txt)"

  cat <<EOF >script.txr
@(all)
@{A /ab/}@{B /c/}
@(or)
@{C /a/}@{D /bc/}
@(end)
@(output)
@A @B @C @D
@(end)
EOF

  echo "abc" | txr script.txr - >output.txt
  tst_test test "ab c a bc" = "$(cat output.txt)"

# and behaves like or and vice versa in this language

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

