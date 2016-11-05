
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( \+ ( ( A=1; A=2 ), !, 2=A ) ),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

