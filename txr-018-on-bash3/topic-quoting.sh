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
@(output)
@@
@(end)
EOF

  txr script.txr >output.txt
  tst_test test '@' = "$(cat output.txt)"

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 1

echo $(tst_result)

