
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (true -> testOk; testFail),
 (false -> testFail; testOk),

 checkComplainAndAdjustExpected( 2),

 testOk,
 testOk,
 testOk,

 checkComplainAndAdjustExpected( 3),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

