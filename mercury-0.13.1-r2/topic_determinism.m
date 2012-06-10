:- module topic_determinism.
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

% erroneous left

 call( (pred) is det :- true),

 not call( (pred) is failure :- fail),

 (
  call( (pred) is semidet :- true) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),

 (
  call( (pred) is nondet :- true) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),

 (
  call( ( pred( 1::in) is semidet :- true), 1) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),

 (
  call( ( pred( 1::in) is semidet :- true), 1) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),

 (
  call( ( pred( A::out) is multi :- 1=A ; 2=A), 1) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),
 
 (
  call( ( pred( A::in) is semidet :- 1=A ; 2=A), 1) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),
 
 (
  call( ( pred( A::out) is multi :- 1=A ; 2=A), 2) -> testOk( !TD, !IO);
  testFail( !TD, !IO)
 ),
 
 (
  call( ( pred( A::out) is multi :- 1=A ; 2=A), 3) -> testFail( !TD, !IO);
  testOk( !TD, !IO)
 ),
 
 (
  call( ( pred( A::in) is semidet :- 1=A ; 2=A), 3) -> testFail( !TD, !IO);
  testOk( !TD, !IO)
 ),
 
 checkComplainAndAdjustExpected( !TD, 9, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module topic_determinism.
