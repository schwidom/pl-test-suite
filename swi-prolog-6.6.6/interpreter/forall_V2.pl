
main :- 

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( forall( member( _, [ a, b]), true) ) ),

 test( ( forall( member( M, [ 4, 5, 6]), 3 < M) ) ),

 test( \+ ( forall( member( M, [ 3, 4, 5]), 3 < M) ) ),

 test( ( forall( fail, fail) ) ),

 checkComplainAndAdjustExpected( 4),

% see also bagof.pl, findall.pl, forall.pl, bagof_V2.pl, findall_V2.pl, forall_V2.pl
% see also : member.pl

 result(S), 
 format( S, []),

 true.

