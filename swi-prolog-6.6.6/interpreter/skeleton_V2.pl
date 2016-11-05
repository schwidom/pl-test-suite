
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( true),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

