
:- op( 900, xfx, >=<=>>=<).
:- op( 900, xfx, myoperator).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),
 
 assert( >=<=>>=<( A, A)),
 assert( A myoperator A),

 ( 1 >=<=>>=< 1 -> testOk; testFail),
 ( >=<=>>=<( 2, 2) -> testOk; testFail),

 ( 3 myoperator 3 -> testOk; testFail),
 ( myoperator( 4, 4) -> testOk; testFail),

 retractall( A >=<=>>=< A),
 retractall( myoperator( A, A)),

 ( 1 >=<=>>=< 1 -> testFail; testOk),
 ( >=<=>>=<( 2, 2) -> testFail; testOk),

 ( 3 myoperator 3 -> testFail; testOk),
 ( myoperator( 4, 4) -> testFail; testOk),

 checkComplainAndAdjustExpected( 8),

 result(S), 
 format( S, []),

 true.

