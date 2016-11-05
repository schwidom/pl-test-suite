
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( A=[ 1 | A], nth0( 100, A, VAL), 1= VAL ) ),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

