
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( clause( a(_), _) -> testFail ; testOk),

 qcompile( qcompile_testdata),

 ( clause( a(1), _) -> testOk ; testFail),

 qcompile( qcompile_testdata),

 ( clause( a(1), _) -> testOk ; testFail),

 qcompile( qcompile_testdata2),

 ( clause( a(1), _) -> testFail ; testOk),
 ( clause( a(2), _) -> testOk ; testFail),

 qcompile( qcompile_testdata3),

 ( clause( a(1), _) -> testOk ; testFail),
 ( clause( a(2), _) -> testOk ; testFail),

 checkComplainAndAdjustExpected( 7),

% see also : qcompile.pl, consult.pl

 result(S), 
 format( S, []),

 true.

