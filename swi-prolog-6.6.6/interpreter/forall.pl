
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 ( forall( member( _, [ a, b]), true) -> testOk; testFail),

 ( forall( member( M2, [ 4, 5, 6]), 3 < M2) -> testOk; testFail),

 ( forall( member( M3, [ 3, 4, 5]), 3 < M3) -> testFail; testOk),

 ( forall( fail, fail) -> testOk ; testFail),

 checkComplainAndAdjustExpected( 4),

% see also bagof.pl, findall.pl, forall.pl
% see also : member.pl

 result(S), 
 format( S, []),

 true.

