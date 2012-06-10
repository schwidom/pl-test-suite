
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( A=[ 1 | A], nth( 100, A, VAL), 1= VAL -> testOk; testFail), % won't work on console!

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

