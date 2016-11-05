
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (X= a( A, b(R), A), term_variables( X, L), L=[e,u] -> X= a( e, b(u), e), A=e, R=u, testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

