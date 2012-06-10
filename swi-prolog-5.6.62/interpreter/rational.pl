
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( rational( 2, 2, 1) -> testOk; testFail),
 ( rational( 2 rdiv 3, 2, 3) -> testOk; testFail),

 ( rational( 0.5, _, _) -> testFail; testOk),
 ( rational( _, 2, 3) -> testFail; testOk),

 ( rational( 2) -> testOk; testFail),
 ( rational( 2 rdiv 3) -> testOk; testFail),

 ( rational( 0.5) -> testFail; testOk),
 ( rational( _) -> testFail; testOk),

 checkComplainAndAdjustExpected( 8),

 % see also : topic-types.pl
 
 result(S), 
 format( S, []),

 true.

