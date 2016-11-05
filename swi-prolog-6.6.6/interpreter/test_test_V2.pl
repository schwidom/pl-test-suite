
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 (true -> testOk; testFail),
 (false -> testFail; testOk),

 checkComplainAndAdjustExpected( 2),

 test( true),
 test( \+ false),
 testOk,

 checkComplainAndAdjustExpected( 3),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

