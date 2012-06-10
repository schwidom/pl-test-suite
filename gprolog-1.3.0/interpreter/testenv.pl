
testOk :- 
 catch( teststate( CountOk, CountFail, CountLatest), error(existence_error(_,_),_), 
  ( CountOk= 0, CountFail= 0, CountLatest= 0)
 ),
 retractall( teststate( _, _, _)),
 CountOk_ is 1 + CountOk,
 assertz( teststate( CountOk_, CountFail, CountLatest)),
 true.

testFail :- 
 catch( teststate( CountOk, CountFail, CountLatest), error(existence_error(_,_),_), 
  ( CountOk= 0, CountFail= 0, CountLatest= 0)
 ),
 retractall( teststate( _, _, _)),
 CountFail_ is 1 + CountFail,
 assertz( teststate( CountOk, CountFail_, CountLatest)),
 format( "test failed~n", []),
 true.

checkComplainAndAdjustExpected( Count) :-

 catch( teststate( CountOk, CountFail, CountLatest), error(existence_error(_,_),_), 
  ( CountOk= 0, CountFail= 0, CountLatest= 0)
 ),

 CountTests is CountOk + CountFail,
 CountTestsLocal is CountTests - CountLatest,

 retractall( teststate( _, _, _)),
 assertz( teststate( CountOk, CountFail, CountTests)),

 (
  Count = CountTestsLocal -> true
  ;
  format( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal: ~d cound: ~d~n", [ CountTestsLocal, Count])
 ),

 true.

result( OUT) :-
 %open_output_chars_stream( S),
 open_output_codes_stream( S),
 catch( teststate( CountOk, CountFail, CountLatest), error(existence_error(_,_),_), 
  ( CountOk= 0, CountFail= 0, CountLatest= 0)
 ),
 format( S, "tests: ok: ~d fail: ~d countLatest: ~d~n", [ CountOk, CountFail, CountLatest]),
 %close_output_chars_stream( S, OUT),
 close_output_codes_stream( S, OUT),
 true.

