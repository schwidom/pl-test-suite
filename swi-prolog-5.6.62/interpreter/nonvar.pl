
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (nonvar( A) -> testFail; testOk),

 A=1,
 (nonvar( A) -> testOk; testFail),

 checkComplainAndAdjustExpected( 2),


 % see also nonvar.pl, var.pl

 result(S), 
 format( S, []),

 true.

