
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( findall( X1, ( X1=1; X1=2), RES1), [ 1, 2] = RES1 -> testOk; testFail),

 ( findall( [ a, X2], ( X2=1; X2=2), RES2), [ [ a, 1], [ a, 2]] = RES2 -> testOk; testFail),

 ( findall( X3, ( X3=1, X3=2), RES3), [] = RES3 -> testOk; testFail),

 ( findall( X4, member( X4, [a, b, c]), L4, [d, e]) -> [a, b, c, d, e]=L4, testOk; testFail),

 checkComplainAndAdjustExpected( 4),

% see also bagof.pl, findall.pl, forall.pl

 result(S), 
 format( S, []),

 true.

