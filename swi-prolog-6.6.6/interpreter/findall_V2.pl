
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( findall( X, ( X=1; X=2), RES), [ 1, 2] = RES ) ),

 test( ( findall( [ a, X], ( X=1; X=2), RES), [ [ a, 1], [ a, 2]] = RES ) ),

 test( ( findall( X, ( X=1, X=2), RES), [] = RES ) ),

 test( ( findall( X, member( X, [a, b, c]), L, [d, e]) -> [a, b, c, d, e]=L ) ),

 checkComplainAndAdjustExpected( 4),

% see also bagof.pl, findall.pl, forall.pl, bagof_V2.pl, findall_V2.pl

 result(S), 
 format( S, []),

 true.

