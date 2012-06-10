
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( ( A=1; A=2 ), !, 2=A -> testFail; testOk),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

