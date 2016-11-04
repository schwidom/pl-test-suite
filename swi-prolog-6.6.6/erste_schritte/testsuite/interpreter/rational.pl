
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( rational( 2, 2, 1) -> testOk; testFail),
 ( rational( 2 rdiv 3, 2, 3) -> testOk; testFail),

 ( rational( 0.5, _, _) -> testFail; testOk),
 ( rational( _, 2, 3) -> testFail; testOk),

 ( rational( 2) -> testOk; testFail),
 ( rational( 2 rdiv 3) -> testOk; testFail),

 ( rational( 0.5) -> testFail; testOk),
 ( rational( _) -> testFail; testOk),

 checkComplainAndAdjustExpected( 8),

 ( A1 is rational( 3/2) -> A1 = 3 rdiv 2, testOk; testFail),
 ( A2 is rationalize( 3/2) -> A2 = 3 rdiv 2, testOk; testFail),
 ( A3 is rational( 1.5) -> A3 = 3 rdiv 2, testOk; testFail),
 ( A4 is rationalize( 1.5) -> A4 = 3 rdiv 2, testOk; testFail),

 ( A5 is rational( 3.1), A5_1 is rationalize( A5) 
   -> A5 = 6980579422424269 rdiv 2251799813685248, A5_1 = 6980579422424269 rdiv 2251799813685248, testOk; testFail),
 ( A6 is rationalize( 3.1), A6_1 is rational( A6)
  -> A6 = 31 rdiv 10, A6_1 = 31 rdiv 10, testOk; testFail),

 checkComplainAndAdjustExpected( 6),

 % see also : topic-types.pl
 
 result(S), 
 format( S, []),

 true.

