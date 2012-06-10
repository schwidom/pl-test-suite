
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( freeze( A, A=B) -> testOk; testFail),
 A=1,

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

