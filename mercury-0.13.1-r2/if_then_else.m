:- module if_then_else.
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

 ( if true then testOk( !TD, !IO) else testFail( !TD, !IO)),
 ( if fail then testFail( !TD, !IO) else testOk( !TD, !IO)),

 ( true -> testOk( !TD, !IO) ; testFail( !TD, !IO)),
 ( fail -> testFail( !TD, !IO) ; testOk( !TD, !IO)),

 (
  if true then testOk( !TD, !IO) else
  if true then testFail( !TD, !IO) else
  testFail( !TD, !IO)
 ),
 
 (
  true -> testOk( !TD, !IO) ; 
  true -> testFail( !TD, !IO) ;
  testFail( !TD, !IO)
 ),

 (
  fail -> testFail( !TD, !IO) ; 
  true -> testOk( !TD, !IO) ;
  testFail( !TD, !IO)
 ),

 (
  fail -> testFail( !TD, !IO) ; 
  fail -> testFail( !TD, !IO) ;
  testOk( !TD, !IO)
 ),

 checkComplainAndAdjustExpected( !TD, 8, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module if_then_else.
