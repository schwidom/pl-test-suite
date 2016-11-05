
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( a :- b),
 assert( a :- c),

 ( bagof( X1, clause( a, X1), LX1) -> [ b, c]=LX1, testOk; testFail),

 assert( d( I) :- 1=I),

 ( clause( d( K2), X2) -> (1=K2)=X2, testOk; testFail),

 ( clause( d( 1), X3) -> (1=1)=X3, testOk; testFail),

 checkComplainAndAdjustExpected( 3),

 result(S), 
 format( S, []),

 true.

