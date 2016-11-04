
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),


 assert( g( a, z)),
 assert( g( b, y)),

 ( maplist( g, [ b, a], RES1), [ y, z]= RES1 -> testOk; testFail),

 ( maplist( g, RES2, [ z, y]), [ a, b]= RES2 -> testOk; testFail),

 ( maplist( g( a), RES3), [ z]= RES3 -> testOk; testFail),

 ( maplist( g, [ b, c], _) -> testFail; testOk),

 retractall( g( _, _)),

 checkComplainAndAdjustExpected( 4),

 result(S), 
 format( S, []),

 true.

