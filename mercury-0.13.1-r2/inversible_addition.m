:- module inversible_addition.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- import_module string.
:- import_module testenv.
:- import_module int.

:- func add( int, int) = int.
:- mode add( in, in) = out is det.
:- mode add( in, out) = in is det.
:- mode add( out, in) = in is det.

add( A, B)= (C) :-
 C= A + B 
.

:- pred runtest( testdata, testdata, io.state, io.state).
:- mode runtest( in, out, di, uo) is det.
runtest( !TD, !IO) :-
 checkComplainAndAdjustExpected( !TD, 0, !IO),


 (
  add( 2, 3) = C, ( C= 5 -> testOk( !TD, !IO) ; testFail( !TD, !IO))
 ),

 (
  add( 2, B) = 5, ( B= 3 -> testOk( !TD, !IO) ; testFail( !TD, !IO))
 ),

 (
  add( A, 3) = 5, ( A= 2 -> testOk( !TD, !IO) ; testFail( !TD, !IO))
 ),

 ( add( 2, 3) = 5 -> testOk( !TD, !IO) ; testFail( !TD, !IO)),


 checkComplainAndAdjustExpected( !TD, 4, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module inversible_addition.

% see also inversible_addition.m inversible_multiplication.m

