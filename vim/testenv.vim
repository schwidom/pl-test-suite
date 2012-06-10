let TRUE = 1
let FALSE = 0

let s:countOk= 0
let s:countFail= 0
let s:countLatest= 0


function Test( b)
 
 if a:b
  let s:countOk = 1+ s:countOk
 else
  let s:countFail = 1+ s:countFail
  echo "FAIL" 
 endif
endfunction

function CheckComplainAndAdjustExpected( count)

 let a:countTests = s:countOk + s:countFail
 let a:countTestsLocal = a:countTests - s:countLatest

 let s:countLatest = a:countTests
 
 if a:count == a:countTestsLocal
  return g:TRUE
 else
  echo "CheckComplainAndAdjustExpected a:countTestsLocal " a:countTestsLocal " a:count " a:count
  return g:FALSE
 endif

endfunction

function Result()
 return "tests: ok: ". s:countOk. " fail: ". s:countFail. " countLatest: ". s:countLatest
endfunction

