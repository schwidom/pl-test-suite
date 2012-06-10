
:- use_module(library(clpfd)).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (chain( [1, 2, 3], #<) -> testOk; testFail),
 (chain( [1, 3, 2], #<) -> testFail; testOk),

 (chain( [3, 2, 1], #>) -> testOk; testFail),

 (chain( [2, 2, 2], #=) -> testOk; testFail),
 (chain( [2, 2, 3], #=) -> testFail; testOk),
 (chain( [2, 2, 3], #=<) -> testOk; testFail),

 checkComplainAndAdjustExpected( 6),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

