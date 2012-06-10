
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (ignore( fail) -> testOk; testFail),
 ( X1= 2, ignore( X1= 3) -> 2= X1, testOk; testFail),
 ( ignore( X2= 3), X2= 2 -> testFail; testOk),

 checkComplainAndAdjustExpected( 3),

 result(S), 
 format( S, []),

 true.

