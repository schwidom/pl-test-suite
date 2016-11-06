
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 when( (nonvar(B), nonvar(C)), (A is B+C)),

 test( var( A)),
 test( var( B)),
 test( var( C)),

 B=2,

 test( var( A)),
 test( nonvar( B)),
 test( var( C)),

 C=3,

 test( nonvar( A)),
 test( nonvar( B)),
 test( nonvar( C)),

 test( 5 == A),

 checkComplainAndAdjustExpected( 10),

 result(S), 
 format( S, []),

 true.

% see also: freeze.pl, when.pl
