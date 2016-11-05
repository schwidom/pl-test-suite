
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( clause( a(_), _) -> testFail ; testOk),

 checkComplainAndAdjustExpected( 1),

 (asserta( a(1)), clause( a(X), RES), retractall( a(1)) -> 1=X, true=RES, testOk ; testFail),

 checkComplainAndAdjustExpected( 1),

 ( clause( a(_), _) -> testFail ; testOk),

 checkComplainAndAdjustExpected( 1),


 % see also : apply.pl, call.pl, topic-assert-clause-retract.pl

 result( S), 
 format( S, []),

 true.

