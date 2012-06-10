tst_countOk= 0
tst_countFail= 0
tst_countLatest= 0

function []= tst_test( b)

 global tst_countOk tst_countFail tst_countLatest 

 if ~ 'boolean' == typeof( b ) then 
  //print( %io(2), 'tst_test: parameter not of type boolean: ' + typeof( b )+ ' '+ string( b))
  printf( 'tst_test: parameter not of type boolean: ' + typeof( b )+ ' '+ string( b)+ "\n")
  return
 end

 if b then
  tst_countOk= 1+ tst_countOk
 else
  tst_countFail= 1+ tst_countFail
  printf('tst_test: failed\n')
 end

endfunction

// function [ret]= checkComplainAndAdjustExpected( count)
function [ret]= checkComplainAndAdjustEx( count) // scilab truncates the function name 

 global tst_countOk tst_countFail tst_countLatest 

 ret= 1

 countTests= tst_countOk + tst_countFail
 countTestsLocal= countTests - tst_countLatest
 
 tst_countLatest= countTests

 if count == countTestsLocal then 
  
  return
 else

    printf( 'Expected Test Count (from last checkpoint to here) doesn''t match: countTestsLocal:%d count: %d\n', countTestsLocal, count)

  ret= 0
  return
 end
endfunction

function [res]= tst_result()
 
 global tst_countOk tst_countFail tst_countLatest 

 res= sprintf( 'tests: ok: %d fail: %d countLatest: %d', tst_countOk, tst_countFail, tst_countLatest);

endfunction



