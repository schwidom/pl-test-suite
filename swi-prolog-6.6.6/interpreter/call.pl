
main :- 

 consult( 'testenv_V2.pl'),

 checkComplainAndAdjustExpected( 0),

 asserta( a(4)),

 test( ( call( a( X)) -> 4=X) ),
 test( ( call( a, X) -> 4=X) ),

 test( ( call( call( a), X) -> 4=X) ),
 test( ( call( call( call( a), X)) -> 4=X) ),

 retractall( a(4)),

 asserta( a(1, 2)),

 test( ( call( a( X, Y)) -> 1=X, 2=Y ) ),
 test( ( call( a( X), Y) -> 1=X, 2=Y ) ),
 test( ( call( a, X, Y) -> 1=X, 2=Y ) ),

 test( ( call( call( a, X), Y) -> 1=X, 2=Y ) ),
 test( ( call( call( call( a), X), Y) -> 1=X, 2=Y ) ),
 test( ( call( call( call( call( a), X), Y)) -> 1=X, 2=Y ) ),

 retractall( a(1, 2)),


 % see also : apply.pl, call.pl, topic-assert-clause-retract.pl

 checkComplainAndAdjustExpected( 10),

 result( S), 
 format( S, []),

 true.

