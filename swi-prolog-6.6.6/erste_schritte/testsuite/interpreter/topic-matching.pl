
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( ( A1 = B1) = ( 1 = 2), 1 = A1, 2 = B1 -> testOk; testFail),

 ( A2 + B2 = 3 + 4, 3 = A2, 4 = B2 -> testOk; testFail),

 ( A3 = a(5, b(6)), A3= a( B3, b( C3)), 5 = B3, 6 = C3 -> testOk; testFail),

 checkComplainAndAdjustExpected( 3),

 result(S), 
 format( S, []),

 true.

