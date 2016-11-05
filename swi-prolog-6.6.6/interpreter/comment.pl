
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 % this is a line comment

 /*
  this is a block comment
 */

 checkComplainAndAdjustExpected( 0),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

