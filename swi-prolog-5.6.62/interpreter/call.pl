
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 asserta( a(4)),
 ( call( a( X1)) -> 4=X1, testOk ; testFail),
 ( call( a, X2) -> 4=X2, testOk ; testFail),
 retractall( a(4)),

 asserta( a(1, 2)),
 ( call( a( X3, Y3)) -> 1=X3, 2=Y3, testOk ; testFail),
 ( call( a( X4), Y4) -> 1=X4, 2=Y4, testOk ; testFail),
 ( call( a, X5, Y5) -> 1=X5, 2=Y5, testOk ; testFail),
 retractall( a(1, 2)),


 % see also : apply.pl, call.pl, topic-assert-clause-retract.pl

 checkComplainAndAdjustExpected( 5),

 result( S), 
 format( S, []),

 true.

