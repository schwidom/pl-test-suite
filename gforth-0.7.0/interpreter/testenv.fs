create tst_countOk 
create tst_countFail 
create tst_countLatest 

\ boolean : -1 true, 0 false

: tst_test 
 if
  tst_countOk @ 1 + tst_countOk !
 else
  tst_countFail @ 1 + tst_countFail !
  ." test failed"
  cr
 endif
;

: tst_checkComplainAndAdjustExpected
 \ count
 tst_countOk @ tst_countFail @ + \ count countTests
 dup tst_countLatest @ - \ count countTests countTestsLocal
 swap \ count countTestsLocal countTests
 tst_countLatest ! \ count countTestsLocal
 2dup \ count countTestsLocal count countTestsLocal
 = \ count countTestsLocal (= count countTestsLocal)
 
 if
  -1 \ count countTestsLocal ret
 else
  2dup \ count countTestsLocal count countTestsLocal
  ." Expected Test Count (from last checkpoint to here) doesn't match: "
  ." countTestsLocal: "
  .
  ." count: "
  .
  cr
  0 \ count countTestsLocal ret
 endif
 
 rot drop drop \ ret
;

: tst_result
 ." tests: "
 ." ok: "
 tst_countOk @ .
 ." fail: "
 tst_countFail @ .
 ." countLatest: "
 tst_countLatest @ .
 cr
;

0 tst_countOk !
0 tst_countFail !
0 tst_countLatest !

