
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( nth0( 0, [11, 12, 13], 11)),
 test( nth0( 2, [11, 12, 13], 13)),

 test( nth0( 0, [11, 12, 13], 11, [12,13])),
 test( nth0( 2, [11, 12, 13], 13, [11,12])),

 checkComplainAndAdjustExpected( 4),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

