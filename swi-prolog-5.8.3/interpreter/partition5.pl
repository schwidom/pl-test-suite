
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( p( a, <)),
 assert( p( b, =)),
 assert( p( c, >)),
 
 ( partition( p, [ a, b, c], Less, Equal, Greater) -> [ a]= Less, [ b]=Equal, [ c]=Greater, testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : partition.pl, partition5.pl
 
 result(S), 
 format( S, []),

 true.

