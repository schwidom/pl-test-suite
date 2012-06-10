
:- use_module(library(clpfd)).

clpfd_term1( X) :- 1 #< X, X #< 4.

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (clpfd_term1( X1) -> fd_inf( X1, 2), fd_sup( X1, 3), testOk; testFail),
 (bagof( X2, X2^L2^(clpfd_term1( X2), label([X2])), L2) -> L2=[2, 3], testOk; testFail),

 checkComplainAndAdjustExpected( 2),

 % see also : 
 
 result(S), 
 format( S, []),

 true.

