
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (true -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

