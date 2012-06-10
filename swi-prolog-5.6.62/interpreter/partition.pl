
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( p( a)),
 assert( p( c)),
 
 ( partition( p, [ a, b, c, d], IN, EX) -> [ a, c]=IN, [ b, d]=EX, testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : include.pl, exclude.pl, partition.pl, partition5.pl
 
 result(S), 
 format( S, []),

 true.

