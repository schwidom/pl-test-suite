
:- use_module(library(clpfd)).

combination1( X) :- X=[_,_], X ins 1..3, label(X).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( bagof( X, combination1(X), L) -> L=[[1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3]], testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 % see also : topic-permutation1.pl, topic-combination1.pl
 
 result(S), 
 format( S, []),

 true.

