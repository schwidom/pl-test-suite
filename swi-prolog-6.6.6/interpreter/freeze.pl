
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 ( freeze( A, A=B) -> testOk; testFail),

 test( var( B)),

 A=1,

 test( nonvar( B)),
 test( 1==B),

 checkComplainAndAdjustExpected( 4),

 result(S), 
 format( S, []),

 true.

