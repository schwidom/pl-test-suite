
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (explain( a, ANSWER1) -> string_to_list( ANSWER1, "\"a\" is an atom"), testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

