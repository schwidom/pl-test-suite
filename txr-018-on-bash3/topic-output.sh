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
outpot
@(end)
EOF

  txr script.txr >output.txt
  tst_test test "outpot" = "$(cat output.txt)"

  cat <<EOF >script.txr
@(output)
outpot1
@(end)
@(output)
outpot2
@(end)
EOF

  txr script.txr >output.txt
  tst_test test "outpot1${NEWLINE}outpot2" = "$(cat output.txt)"

  cat <<EOF >script.txr
@(output "outfile.txt")
outpot
@(end)
EOF

  txr script.txr >output.txt
  tst_test test "outpot" = "$(cat outfile.txt)"
  tst_test test "" = "$(cat output.txt)"

  cat <<EOF >script.txr
@(bind OF "outfile2.txt")
@(output OF)
outpot
@(end)
EOF

  txr script.txr >output.txt
  tst_test test "outpot" = "$(cat outfile2.txt)"
  tst_test test 'OF="outfile2.txt"' = "$(cat output.txt)"

  cat <<EOF >script.txr
@(bind OF "outfile3.txt")
@(output)! cat > @OF
outpot
@(end)
EOF

  txr script.txr >output.txt
  tst_test test "outpot" = "$(cat outfile3.txt)"
  tst_test test 'OF="outfile3.txt"' = "$(cat output.txt)"

  cat <<EOF >script.txr
@(bind OF "outfile4.txt")
@(output) @OF
outpot
@(end)
EOF

  txr script.txr >output.txt
  tst_test test "outpot" = "$(cat outfile3.txt)"
  tst_test test 'OF="outfile4.txt"' = "$(cat output.txt)"

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 10

echo $(tst_result)

