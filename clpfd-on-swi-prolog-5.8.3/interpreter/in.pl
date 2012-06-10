
:- use_module(library(clpfd)).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (1 in 1 -> testOk; testFail),
 (1 in 1..1 -> testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

