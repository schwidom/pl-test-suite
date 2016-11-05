
:- style_check( -no_effect ).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (var( A) -> testOk; testFail),

 A=1,
 (var( A) -> testFail; testOk),

 checkComplainAndAdjustExpected( 2),


 % see also nonvar.pl, var.pl

 result(S), 
 format( S, []),

 true.

