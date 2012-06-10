package provide testenv 1.0 

proc {#} { p } {
}

set countOk 0
set countFail 0
set countLatest 0

proc test { b } {

 global countOk
 global countFail

 if { $b } {
  incr countOk
 } else {
  incr countFail
  puts "test failed"
 }
}

proc checkComplainAndAdjustExpected { count } {
 
 global countOk
 global countFail
 global countLatest

 set countTests $countOk
 incr countTests $countFail

 set countTestsLocal $countTests
 incr countTestsLocal -$countLatest

 set countLatest $countTests

 if { $count == $countTestsLocal } {
  return true
 } else {
 puts [ format "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal: %d count: %d" $countTestsLocal $count ]
  return false
 }
}

proc result { } {

 global countOk
 global countFail
 global countLatest

 format "tests: ok: %d fail: %d countLatest: %d" $countOk $countFail $countLatest 
}

