
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( nth1( 1, [11, 12, 13], 11)),
 test( nth1( 3, [11, 12, 13], 13)),

 test( nth1( 1, [11, 12, 13], 11, [12,13])),
 test( nth1( 3, [11, 12, 13], 13, [11,12])),

 checkComplainAndAdjustExpected( 4),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

