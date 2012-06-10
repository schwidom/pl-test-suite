:- module test_test.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module string.
:- import_module testenv.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.
runtest( !TD, !IO) :-
 checkComplainAndAdjustExpected( !TD, 0, !IO),
 testOk( !TD, !IO),
 testOk( !TD, !IO),
 checkComplainAndAdjustExpected( !TD, 2, !IO),
 testOk( !TD, !IO),
 testOk( !TD, !IO),
 testOk( !TD, !IO),
 checkComplainAndAdjustExpected( !TD, 3, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module test_test.
