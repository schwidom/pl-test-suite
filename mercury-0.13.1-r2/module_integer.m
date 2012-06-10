:- module module_integer.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

% :- import_module int.
:- import_module integer.

:- import_module string.
:- import_module testenv.

:- pred count_left_shift_steps( integer, integer, integer).
:- mode count_left_shift_steps( in, out, in) is det.

count_left_shift_steps( I, CNT2, MAX) :-
 I2= I << 1,
 (
  ( integer( 1)=MAX ; integer( 0)=I2) -> CNT2=integer( 1)
  ; count_left_shift_steps( I2, CNT, MAX - integer( 1)), CNT2= CNT + integer( 1)
 )
.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.

runtest( !TD, !IO) :-

 checkComplainAndAdjustExpected( !TD, 0, !IO),

 (
  count_left_shift_steps( integer( 1), integer( 100), integer( 100)) -> testOk( !TD, !IO)
  ; testFail( !TD, !IO)
 ),

 ( % module_integer_operators
  integer( 10) << 1 = integer( 10) >> -1 -> testOk( !TD, !IO) ;
  testFail( !TD, !IO)
 ),

 ( % module_integer_operators
  integer( 10) >> 1 = integer( 10) << -1 -> testOk( !TD, !IO) ;
  testFail( !TD, !IO)
 ),

 

 checkComplainAndAdjustExpected( !TD, 3, !IO),

 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module module_integer.
