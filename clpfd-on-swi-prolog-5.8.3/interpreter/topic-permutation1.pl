
:- use_module(library(clpfd)).

permutation1( X) :- X=[_,_,_], X ins 1..3, all_distinct( X), label(X).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( bagof( X, permutation1(X), L) -> L=[[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]], testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : topic-permutation1.pl, topic-combination1.pl
 
 result(S), 
 format( S, []),

 true.

