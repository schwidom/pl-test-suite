
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( nth( 1, [a, b], a) -> testOk; testFail),
 ( nth( 2, [a, b], b) -> testOk; testFail),

 ( nth( 2, [a, b, a], b) -> testOk; testFail),
 ( nth( 1, [a, b, a], a) -> testOk; testFail),
 ( nth( 3, [a, b, a], a) -> testOk; testFail),

 ( nth( _, [a, b], c) -> testFail; testOk),

 ( nth( 1, [a], _) -> testOk; testFail),
 ( nth( 0, [a], _) -> testFail; testOk),
 ( nth( 2, [a], _) -> testFail; testOk),

 checkComplainAndAdjustExpected( 9),

 result(S), 
 format( S, []),

 true.

