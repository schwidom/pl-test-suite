
term_expansion( a( A, B), a( A, B, d)).

a( 1,2).

% term_expansion( a( A, B), a( A, B)). % without effect
:- retract( term_expansion( a( A, B), a( A, B, d))). % with effect
term_expansion( b( A, B), b( A, B, d)).

a( 3, 4).
b( 3, 4).

term_expansion( a( A, B, d), a( A, B)).
a( 5, 6, d).
a( 7, 8, e).



main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (a( 1, 2, D) -> d=D, testOk; testFail),
 (a( 3, 4) -> d=D, testOk; testFail),
 (b( 3, 4, D) -> d=D, testOk; testFail),
 (a( 5, 6) -> testOk; testFail),
 (a( 7, 8, e) -> testOk; testFail),

 checkComplainAndAdjustExpected( 5),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

