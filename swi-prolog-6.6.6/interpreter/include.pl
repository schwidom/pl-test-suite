
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( p( a)),
 assert( p( c)),
 
 ( include( p, [ a, b, c, d], L) -> [ a, c]=L, testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : include.pl, exclude.pl, partition.pl
 
 result(S), 
 format( S, []),

 true.

