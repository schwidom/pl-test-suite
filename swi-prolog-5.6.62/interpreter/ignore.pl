
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (ignore( fail) -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

