USING: io namespaces kernel prettyprint sequences math ;
IN: testenv

! <PRIVATE

SYMBOLS: countOk countFail countLatest ;

: init ( -- )
 0 countOk set 
 0 countFail set 
 0 countLatest set 
;

: test ( b -- ) 
 [ countOk inc ]
 [ countFail inc "test failed" print ]
 if
;

: checkComplainAndAdjustExpected ( count -- b )

 countOk get countFail get + ! count countTests
 dup countLatest get - ! count countTests countTestsLocal
 swap ! count countTestsLocal countTests
 countLatest set ! count countTestsLocal
 2dup ! count countTestsLocal count countTestsLocal
 = ! count countTestsLocal (= count countTestsLocal)
 [ t ]
 [ f 
  2dup
  " Expected Test Count (from last checkpoint to here) doesn't match: "
  " countTestsLocal: " append
  swap unparse append
  " count: " append
  swap unparse append
  print
 ]
 if

 rot drop drop
;

: result ( -- ret )
 "tests: " 
 " ok: " append
 countOk get unparse append
 " fail: " append
 countFail get unparse append
 " countLatest: " append
 countLatest get unparse append
;


