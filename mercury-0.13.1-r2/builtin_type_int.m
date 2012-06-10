:- module builtin_type_int.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module int.
% :- import_module integer.

:- import_module string.
:- import_module testenv.

:- pred count_left_shift_steps( int, int).
:- mode count_left_shift_steps( in, out) is det.

count_left_shift_steps( I, CNT) :-
 I2= I << 1,
 (
  0=I2 -> CNT=1 
  ; count_left_shift_steps( I2, CNT - 1)
 )
.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.

runtest( !TD, !IO) :-

 checkComplainAndAdjustExpected( !TD, 0, !IO),

 (
  count_left_shift_steps( 1, 32) -> testOk( !TD, !IO)
  ; testFail( !TD, !IO)
 ),

 checkComplainAndAdjustExpected( !TD, 1, !IO),

 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module builtin_type_int.
