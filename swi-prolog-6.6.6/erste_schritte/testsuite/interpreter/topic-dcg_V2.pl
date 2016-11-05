
% definite clause grammar
a --> b, c.
d --> e, [x2], f.

main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( clause( a( Q, S), X) -> ( b( Q, R), c( R, S))=X ) ),
 test( ( clause( d( Q, T), X) -> ( e( Q, R), R=[ x2| S], f( S, T))=X ) ),

 assertz( b( B1, [ y1 | B1])),
 assertz( c( C1, [ x1 | C1])),

 test( ( a( [z1], L) -> [x1, y1, z1]=L ) ),

 assertz( e( [ w2| E1], E1)),
 assertz( f( [ y2| F1], F1)),

 test( ( d( L2, [ z2]) -> [ w2, x2, y2, z2]= L2 ) ),

 test( ( d( [ w2, x2, y2, z2], L3) -> [ z2]= L3 ) ),
 test( \+ ( d( [ w2, q2, y2, z2], L3) )),

 checkComplainAndAdjustExpected( 6),

 result(S), 
 format( S, []),

 true.

