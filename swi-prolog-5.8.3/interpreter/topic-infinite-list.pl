
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( A=[ 1 | A], nth0( 100, A, VAL), 1= VAL -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

