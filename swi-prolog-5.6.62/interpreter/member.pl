
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (member( a, [a, b]) -> testOk; testFail),
 (member( c, [a, b]) -> testFail; testOk),

 (member( a(_), [a(1), b]) -> testOk; testFail),
 (member( a(2), [a(1), b]) -> testFail; testOk),

 checkComplainAndAdjustExpected( 4),

 result(S), 
 format( S, []),

 true.

