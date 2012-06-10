:- module inversible_multiplication.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module string.
:- import_module testenv.
:- import_module int.

:- func mul( int, int) = int.
:- mode mul( in, in) = out is det.
:- mode mul( in, out) = in is det.
:- mode mul( out, in) = in is det.

:- pragma promise_pure( mul/2).

mul( A::in, B::in)= (C::out) :-
 C= A * B 
.

mul( A::in, B::out)= (C::in) :-
 B= C / A
.

mul( A::out, B::in)= (C::in) :-
 A= C / B
.


:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.
runtest( !TD, !IO) :-
 checkComplainAndAdjustExpected( !TD, 0, !IO),


 (
  mul( 2, 3) = C, ( C= 6 -> testOk( !TD, !IO) ; testFail( !TD, !IO))
 ),

 (
  mul( 2, B) = 6, ( B= 3 -> testOk( !TD, !IO) ; testFail( !TD, !IO))
 ),

 (
  mul( A, 3) = 6, ( A= 2 -> testOk( !TD, !IO) ; testFail( !TD, !IO))
 ),

 ( mul( 2, 3) = 6 -> testOk( !TD, !IO) ; testFail( !TD, !IO)),

 checkComplainAndAdjustExpected( !TD, 4, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module inversible_multiplication.

% see also inversible_addition.m inversible_multiplication.m

