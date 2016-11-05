
% definite clause grammar
a --> b, c.
d --> e, [x2], f.

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( clause( a( Q1, S1), X1) -> ( b( Q1, R1), c( R1, S1))=X1, testOk; testFail),
 ( clause( d( Q2, T2), X2) -> ( e( Q2, R2), R2=[ x2| S2], f( S2, T2))=X2, testOk; testFail),

 assertz( b( B1, [ y1 | B1])),
 assertz( c( C1, [ x1 | C1])),

 ( a( [z1], L1) -> [x1, y1, z1]=L1, testOk; testFail),

 assertz( e( [ w2| E1], E1)),
 assertz( f( [ y2| F1], F1)),

 ( d( L2, [ z2]) -> [ w2, x2, y2, z2]= L2, testOk; testFail),
 ( d( [ w2, x2, y2, z2], L3) -> [ z2]= L3, testOk; testFail),
 ( d( [ w2, q2, y2, z2], _L4) -> testFail; testOk),

 checkComplainAndAdjustExpected( 6),

 result(S), 
 format( S, []),

 true.

