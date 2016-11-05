
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (true -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

