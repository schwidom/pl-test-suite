
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 catch( throw( a), a, (true -> testOk; testFail)),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

