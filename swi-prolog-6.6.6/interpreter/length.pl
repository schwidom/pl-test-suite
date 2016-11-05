
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( length( [a, b, c], N1) -> 3=N1, testOk; testFail),
 ( length( L2, 4) -> length( L2, 4), testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

