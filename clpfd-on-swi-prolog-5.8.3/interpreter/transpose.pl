
:- use_module(library(clpfd)).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (transpose( [[1, 2], [3, 4]], [[1, 3], [2, 4]]) -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

