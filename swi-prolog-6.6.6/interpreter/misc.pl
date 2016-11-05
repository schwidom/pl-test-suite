
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ({1,2,3} = {(1,2,3)} -> testOk; testFail),
 ({1,2,3} = {(((((1,2,3)))))} -> testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

