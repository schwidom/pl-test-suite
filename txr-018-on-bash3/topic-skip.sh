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
@{A /a/}
@(skip)
@{B /b/}
@(output)
@A @B
@(end)
EOF

  txr script.txr input-data.txt >output.txt
  tst_test test "a b" = "$(cat output.txt)"

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 1

echo $(tst_result)

