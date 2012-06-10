:- module operators.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module string.
:- import_module testenv.
:- import_module int.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.
runtest( !TD, !IO) :-

 checkComplainAndAdjustExpected( !TD, 0, !IO),

 (
  10 << 1 = 10 >> -1 -> testOk( !TD, !IO) ;
  testFail( !TD, !IO)
 ),

 (
  10 >> 1 = 10 << -1 -> testOk( !TD, !IO) ;
  testFail( !TD, !IO)
 ),

 checkComplainAndAdjustExpected( !TD, 2, !IO),

 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module operators.
