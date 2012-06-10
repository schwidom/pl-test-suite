
:- use_module(library(clpfd)).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( lex_chain( []) -> testOk; testFail),
 ( lex_chain( [[]]) -> testOk; testFail),
 ( lex_chain( [[], []]) -> testOk; testFail),
 ( lex_chain( [[], [1]]) -> testFail; testOk),
 ( lex_chain( [[1], []]) -> testFail; testOk),
 ( lex_chain( [[1], [0]]) -> testFail; testOk),
 ( lex_chain( [[1], [1]]) -> testOk; testFail),
 ( lex_chain( [[1], [2]]) -> testOk; testFail),

 ( lex_chain( [[2], [0]]) -> testFail; testOk),
 ( lex_chain( [[2], [1]]) -> testFail; testOk),
 ( lex_chain( [[2], [2]]) -> testOk; testFail),

 ( lex_chain( [[3, 2], [3, 0]]) -> testFail; testOk),
 ( lex_chain( [[3, 2], [3, 1]]) -> testFail; testOk),
 ( lex_chain( [[3, 2], [3, 2]]) -> testOk; testFail),

 ( lex_chain( [[3, 2], [3, 2, 0]]) -> testFail; testOk),
 ( lex_chain( [[3, 2, 0], [3, 2]]) -> testFail; testOk),

 ( lex_chain( [[3, 2, 1], [3, 2, 2], [3, 2, 3], [3, 3, 0]]) -> testOk; testFail),

 checkComplainAndAdjustExpected( 17),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

