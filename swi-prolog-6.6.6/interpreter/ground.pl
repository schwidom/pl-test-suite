
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( ground( a( 1)) -> testOk; testFail),
 ( ground( a( _A)) -> testFail; testOk),

 checkComplainAndAdjustExpected( 2),

 result(S), 
 format( S, []),

 true.

