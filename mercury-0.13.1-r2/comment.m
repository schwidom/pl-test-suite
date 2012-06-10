:- module comment.
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

 % this is a line comment

 /*
  this is a block comment
 */

 checkComplainAndAdjustExpected( !TD, 0, !IO),
 true
.

:- mode main( di, uo) is det.
main( !IO) :- 
 runtest( testdata( 0, 0, 0), TD, !IO),
 io.write_string( result( TD)++"\n", !IO),
 true
.

:- end_module comment.
