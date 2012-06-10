
:- use_module(library(clpfd)).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( [1, 2] ins 1..2 -> testOk; testFail),
 ( [1, 3] ins 1..2 -> testFail; testOk),
 ( [0, 2] ins 1..2 -> testFail; testOk),

 checkComplainAndAdjustExpected( 3),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

