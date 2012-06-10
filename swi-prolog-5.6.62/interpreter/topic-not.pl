
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( a(1)),
 assert( a(2)),

 assert( b(2)),
 assert( b(3)),

 ( a(X1), not( b(X1)) -> X1=1, testOk; testFail),
 ( b(X2), not( a(X2)) -> X2=3, testOk; testFail),

 ( not( b(X3)), a(X3) -> testFail; testOk),
 ( not( a(X4)), b(X4) -> testFail; testOk),

 checkComplainAndAdjustExpected( 4),

 result(S), 
 format( S, []),

 true.

