
:- writeln( deprecated), halt( 1).

:- arithmetic_function( mean/2).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( mean(A, B, C) :- C is (A+B)/2),

 ( 4.5 is mean( 4, 5) -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

