:- module testenv.
:- interface.

:- import_module io.

:- type testdata --->     
 testdata( % without whitespace between testdata and ( % )
  countOk :: int,
  countFail :: int,
  countLatest :: int
 )
.

:- pred testOk( testdata, testdata).
:- mode testOk(in, out) is det.

:- pred testOk( testdata, testdata, io.state, io.state).
:- mode testOk(in, out, di, uo) is det.

:- pred testFail( testdata, testdata, io.state, io.state).
:- mode testFail(in, out, di, uo) is det.

:- pred checkComplainAndAdjustExpected( testdata, testdata, int, io.state, io.state).
:- mode checkComplainAndAdjustExpected( in, out, in, di, uo) is det.

:- func result( testdata) = string .
:- mode result( in) = out is det.

:- implementation.

:- import_module int.
:- import_module string.

testOk( testdata( OK, F, L), testdata( 1 + OK, F, L)) :- true.
testOk( testdata( OK, F, L), testdata( 1 + OK, F, L), !IO) :- 
 io.write_string( "", !IO),
 true
.
testFail( testdata( OK, F, L), testdata( OK, 1 + F, L), !IO) :- 
 io.write_string( "test failed\n", !IO),
 true
.

checkComplainAndAdjustExpected( testdata( OK, F, L), testdata( OK, F, CountTests), Count, !IO) :- 
 CountTests= OK + F,
 CountTestsLocal= CountTests - L,

 (
  Count = CountTestsLocal -> S = ""
  ;
  S= "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" ++ string( CountTestsLocal) ++ " count: "++ string( Count) ++ "\n"
 ),
 io.write_string( S, !IO),
 true
.

result( testdata( OK, F, L)) = S :-
 S= "tests: ok: "++ string( OK)++ " fail: "++ string( F)++ " countLatest: "++ string( L)
 ,
 true
.

:- end_module testenv.
