
:- writeln( deprecated), halt( 1).

main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( block( l1, ( A1=1), E1) -> var(E1), 1=A1, testOk; testFail),
 ( block( l1, ( A2=1, exit( l1, 9)), E2) -> nonvar(E2), 1=A2, 9=E2, testOk; testFail),
 ( block( l1, ( A3=1, fail( l1)), E3) -> testFail ; testOk),

 checkComplainAndAdjustExpected( 3),

 result(S), 
 format( S, []),

 true.

