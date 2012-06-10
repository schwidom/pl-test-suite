:- module hello_world.
:- interface.

:- import_module io.
:- pred main( io.state, io.state).

:- implementation.

:- mode main( di, uo) is det.
main( !IO) :- io.write_string( "Hello World", !IO).

:- end_module hello_world.
