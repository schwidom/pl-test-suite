
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( bagof( X1, ( X1=1; X1=2), RES1), [ 1, 2] = RES1 -> testOk; testFail),

 ( bagof( X11, ( X11=1; X11=2; X11=1), RES11), [ 1, 2, 1] = RES11 -> testOk; testFail),

 ( bagof( [ a, X2], ( X2=1; X2=2), RES2), [ [ a, 1], [ a, 2]] = RES2 -> testOk; testFail),

 ( bagof( [ a, X21], ( X21=1; X21=2; X21=1), RES21), [ [ a, 1], [ a, 2], [ a, 1]] = RES21 -> testOk; testFail),

 ( bagof( X3, ( X3=1, X3=2), _) -> testFail; testOk),

 checkComplainAndAdjustExpected( 5),

 assert( a( a, 1)),
 assert( a( a, 2)),
 assert( a( b, 2)),
 assert( a( b, 3)),

 ( bagof( LE1, bagof( E1, A1^a( A1, E1), LE1), LLE1), [ [ 1, 2, 2, 3]]=LLE1 -> testOk; testFail),
 ( bagof( LE2, A2^bagof( E2, a( A2, E2), LE2), LLE2), [ [1, 2], [2, 3]]=LLE2 -> testOk; testFail),

 checkComplainAndAdjustExpected( 2),

% see also bagof.pl, findall.pl, forall.pl, setof.pl

 result(S), 
 format( S, []),

 true.

