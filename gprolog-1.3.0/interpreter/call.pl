
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 asserta( a(1)),
 ( call( a( X)) -> 1=X, testOk ; testFail),
 ( call( a, X) -> 1=X, testOk ; testFail),
 retractall( a(1)),

 asserta( a(1, 2)),
 ( call( a( X, Y)) -> 1=X, 2=Y, testOk ; testFail),
 ( call( a( X), Y) -> 1=X, 2=Y, testOk ; testFail),
 ( call( a, X, Y) -> 1=X, 2=Y, testOk ; testFail),
 retractall( a(1, 2)),


 % see also : apply.pl, call.pl, topic-assert-clause-retract.pl

 checkComplainAndAdjustExpected( 5),

 result( S), 
 format( S, []),

 true.

