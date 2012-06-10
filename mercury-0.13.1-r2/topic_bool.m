:- module topic_bool.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module string.
:- import_module testenv.
:- import_module bool.
:- import_module list.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.
runtest( !TD, !IO) :-
 checkComplainAndAdjustExpected( !TD, 0, !IO),

 bool.yes=bool.yes,
 yes=bool.yes,
 no=bool.no,

 testOk( !TD, !IO),

 checkComplainAndAdjustExpected( !TD, 1, !IO),

 ( no= not( yes) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( yes= not( no) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( not( no, yes) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( not( yes, no) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 4, !IO),

 ( and( yes, no, no) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( or( yes, no, yes) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( no= and( yes, no) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( yes= or( yes, no) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 4, !IO),

 ( no= and_list( [ yes , no, yes]) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( yes= or_list( [ yes , no, no]) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( no= and_list( [ yes , no, yes]) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( yes= or_list( [ yes , no, no]) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 4, !IO),

 ( no= xor( yes, yes) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( no= xor( no, no) -> testOk( !TD, !IO); testFail( !TD, !IO)),
 ( yes= xor( yes, no) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 3, !IO),

 ( yes= pred_to_bool( ((pred) is semidet :- true) ) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 P= ((pred) is semidet :- true),
 ( yes= pred_to_bool( P ) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 P2= ((pred) is semidet :- false),
 ( no= pred_to_bool( P2 ) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 3, !IO),

 checkComplainAndAdjustExpected( !TD, 0, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module topic_bool.
