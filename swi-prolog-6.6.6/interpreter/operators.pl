
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( ((a+ b)+ c)=(a+ b+ c) -> testOk; testFail),
 ( (a-> (b-> c))=(a-> b-> c) -> testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

