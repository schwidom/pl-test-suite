
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 (true -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

