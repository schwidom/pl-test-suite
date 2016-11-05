
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( list_to_set( [a, b, a], S1) -> [a, b]= S1, testOk; testFail),
 ( list_to_set( [b, a, a], S2) -> [b, a]= S2, testOk; testFail),
 ( list_to_set( [b, a, b], S3) -> [b, a]= S3, testOk; testFail),
 ( list_to_set( [b, b, a], S4) -> [b, a]= S4, testOk; testFail),

 ( list_to_set( [ a(1), a(U5), a(I5)], S5) -> [a(1)]= S5, U5=1, I5=1, testOk; testFail),
 ( list_to_set( [ a(2,U6), a(I6, 3)], S6) -> [a(2, 3)]= S6, U6=3, I6=2, testOk; testFail),

 checkComplainAndAdjustExpected( 6),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

