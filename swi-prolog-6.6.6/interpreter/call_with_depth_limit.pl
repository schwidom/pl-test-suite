
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( repeat_forever),
 assert( repeat_forever :- repeat_forever),

 ( call_with_depth_limit( repeat_forever, 3, R1), 3=R1 -> testOk; testFail),
 ( call_with_depth_limit( repeat_forever, 3, R2), 4=R2 -> testFail; testOk),

 checkComplainAndAdjustExpected( 2),

 result(S), 
 format( S, []),

 true.

