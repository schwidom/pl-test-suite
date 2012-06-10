
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (format( atom( A1), "-~p-", [a(b)]) -> A1='-a(b)-', atom( A1), not( string( A1)), testOk; testFail),
 (format( string( A2), "-~p-", [a(b)]) -> string_to_list( A2, "-a(b)-"), string( A2), not( atom( A2)), testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

