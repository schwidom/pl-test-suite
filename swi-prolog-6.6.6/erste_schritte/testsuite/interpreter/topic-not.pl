
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 assert( a(1)),
 assert( a(2)),

 assert( b(2)),
 assert( b(3)),

 test( ( a(X), not( b(X)) -> X=1 ) ),
 test( ( b(X), not( a(X)) -> X=3 ) ),

 test( \+ ( not( b(X)), a(X) ) ),
 test( \+ ( not( a(X)), b(X) ) ),

 checkComplainAndAdjustExpected( 4),

 result(S), 
 format( S, []),

 true.

% see also: clp(fd)

