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
matching
text
EOF

  txr script.txr /dev/null >output.txt
  tst_test test 1 -eq $?
  tst_test test "false" = "$(cat output.txt)"

  echo "matching" | txr script.txr - >output.txt
  tst_test test 1 -eq $?
  tst_test test "false" = "$(cat output.txt)"

  echo "matching${NEWLINE}text" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test "" = "$(cat output.txt)"

  echo "matching${NEWLINE}text too?" | txr script.txr - >output.txt
  tst_test test 1 -eq $?
  tst_test test "false" = "$(cat output.txt)"

  echo "matching${NEWLINE}text${NEWLINE}and more" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test "" = "$(cat output.txt)"

  echo "matching${NEWLINE}and more${NEWLINE}text${NEWLINE}and more" | txr script.txr - >output.txt
  tst_test test 1 -eq $?
  tst_test test "false" = "$(cat output.txt)"

  cat <<EOF >script.txr
matching@/.*/
text
EOF

  echo "matching more${NEWLINE}text" | txr script.txr - >output.txt
  tst_test test 0 -eq $?
  tst_test test "" = "$(cat output.txt)"

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 14

echo $(tst_result)

