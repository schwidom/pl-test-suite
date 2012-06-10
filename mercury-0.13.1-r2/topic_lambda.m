:- module topic_lambda.
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

 (pred( _::in, TDI::in, TDO::out, I::di, O::uo) is det :- testOk( TDI, TDO, I, O), true)( 1, !TD, !IO),
 %(pred( A::in, TDI::in, TDO::out, I::di, O::uo) is semidet :- testOk( TDI, TDO, I, O), 1=A)(1, !TD, !IO)


 call( (pred) is det :- true),

 (
  call( (pred) is semidet :- true) -> testOk( !TD, !IO)
  ;
  testFail( !TD, !IO)
 ),

 (
  1= apply( (func) = 1 :- true ) -> testOk( !TD, !IO)
  ;
  testFail( !TD, !IO)
 ),

 (
  (pred( A::in) is semidet :- 1=A)( 1) -> testOk( !TD, !IO)
  ;
  testFail( !TD, !IO)
 ),

 (
  (pred( A::in) is semidet :- 1=A)( 2) -> testFail( !TD, !IO)
  ;
  testOk( !TD, !IO)
 ),

 checkComplainAndAdjustExpected( !TD, 5, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module topic_lambda.
