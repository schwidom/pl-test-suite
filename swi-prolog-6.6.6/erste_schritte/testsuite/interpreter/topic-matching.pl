
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( ( A = B) = ( 1 = 2), 1 = A, 2 = B ) ),

 test( ( A + B = 3 + 4, 3 = A, 4 = B ) ),

 test( ( A = a(5, b(6)), A= a( B, b( C)), 5 = B, 6 = C ) ),

 checkComplainAndAdjustExpected( 3),

 result(S), 
 format( S, []),

 true.

