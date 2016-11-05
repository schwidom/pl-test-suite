
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( A=1, 1=A)),
 test( ( A=2, 2=A)),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

