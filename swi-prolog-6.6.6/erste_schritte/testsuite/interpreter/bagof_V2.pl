
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( bagof( X, ( X=1; X=2), RES), [ 1, 2] = RES ) ),

 test( ( bagof( X, ( X=1; X=2; X=1), RES), [ 1, 2, 1] = RES ) ),

 test( ( bagof( [ a, X], ( X=1; X=2), RES), [ [ a, 1], [ a, 2]] = RES ) ),

 test( ( bagof( [ a, X], ( X=1; X=2; X=1), RES), [ [ a, 1], [ a, 2], [ a, 1]] = RES ) ),

 test( \+ ( bagof( X, ( X=1, X=2), _) ) ),

 checkComplainAndAdjustExpected( 5),

 assert( a( a, 1)),
 assert( a( a, 2)),
 assert( a( b, 2)),
 assert( a( b, 3)),

 test( ( bagof( LE1, bagof( E1, A1^a( A1, E1), LE1), LLE1), [ [ 1, 2, 2, 3]]=LLE1 ) ),
 test( ( bagof( LE2, A2^bagof( E2, a( A2, E2), LE2), LLE2), [ [1, 2], [2, 3]]=LLE2 ) ),

 checkComplainAndAdjustExpected( 2),

% see also bagof.pl, findall.pl, forall.pl, setof.pl, setof_V2.pl, bagof_V2.pl

 result(S), 
 format( S, []),

 true.

