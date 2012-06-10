:- module topic_function_inversion.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module string.
:- import_module int.
:- import_module testenv.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.

:- func f(int::out)= (int::in) is det.

f( O) = I :- I= 2 - O.

runtest( !TD, !IO) :-
 checkComplainAndAdjustExpected( !TD, 0, !IO),

 ( 1 = f( 1) -> testOk( !TD, !IO); testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 1, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module topic_function_inversion.
