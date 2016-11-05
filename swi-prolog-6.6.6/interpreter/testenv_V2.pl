
:- module( testenv, [checkComplainAndAdjustExpected/1,test/1,testOk,testFail,result/1]).

% todo: testN( CNT, TERM)

:- nb_setval( countOk, 0).
:- nb_setval( countFail, 0).
:- nb_setval( countLatest, 0).

checkComplainAndAdjustExpected( Count) :- true

 , nb_getval( countOk, CountOk)
 , nb_getval( countFail, CountFail)
 , nb_getval( countLatest, CountLatest)
 

 , CountTests is CountOk + CountFail
 , CountTestsLocal is CountTests - CountLatest

 , assertz( teststate( CountOk, CountFail, CountTests))

 % , nb_setval( countOk, CountOk)
 % , nb_setval( countFail, CountFail)
 , nb_setval( countLatest, CountTests)

 , (
  Count = CountTestsLocal -> true
  ;
  format( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal: ~d count: ~d~n", [ CountTestsLocal, Count])
 )
 .

test( TERM) :- true
 , nb_getval( countOk, CountOk)
 , nb_getval( countFail, CountFail)
 , nb_getval( countLatest, CountLatest)

 , copy_term( TERM, TERM2CALL)
 , ( \+ \+ call( TERM2CALL) 
   -> CountOk_ is 1 + CountOk, CountFail_ is CountFail
   ; CountOk_ is CountOk, CountFail_ is 1 + CountFail
  )
 
 , nb_setval( countOk, CountOk_)
 , nb_setval( countFail, CountFail_)
 , nb_setval( countLatest, CountLatest)
 .

result( OUT) :- true
 , nb_getval( countOk, CountOk)
 , nb_getval( countFail, CountFail)
 , nb_getval( countLatest, CountLatest)
 , sformat( OUT, "tests: ok: ~d fail: ~d countLatest: ~d~n", [ CountOk, CountFail, CountLatest])
 .

testOk :- test( true).
testFail :- test( fail).

