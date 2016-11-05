
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( permutation( [a, b, c], [c, b, a]) -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

