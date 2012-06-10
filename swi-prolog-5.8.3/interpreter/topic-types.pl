
main :- 

 string_to_list( STRING_ABC, "abc"),

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 (integer( 9) -> testOk; testFail),
 (integer( 9.0) -> testFail; testOk),

 (number( 9) -> testOk; testFail),
 (number( 9.0) -> testOk; testFail),

 (float( 9) -> testFail; testOk),
 (float( 9.0) -> testOk; testFail),

 (is_list( "abc") -> testOk; testFail),
 (is_list( 'abc') -> testFail; testOk),

 (string( STRING_ABC) -> testOk; testFail),
 (string( "abc") -> testFail; testOk),
 
 (atom( abc) -> testOk; testFail),
 (atom( 'abc') -> testOk; testFail),
 (atom( STRING_ABC) -> testFail; testOk),

 (callable( abc) -> testOk; testFail),
 (callable( abc(_)) -> testOk; testFail),

 (compound( abc(_)) -> testOk; testFail),

 (ground( abc) -> testOk; testFail),
 (ground( abc(_)) -> testFail; testOk),
 (ground( abc(d)) -> testOk; testFail),

 (atomic( abc) -> testOk; testFail),
 (atomic( 'abc') -> testOk; testFail),
 (atomic( STRING_ABC) -> testOk; testFail),
 (atomic( "abc") -> testFail; testOk),
 (atomic( abc(_)) -> testFail; testOk),

 CT=ct(CT),
 (cyclic_term( CT) -> testOk; testFail),
 (cyclic_term( ct( 1)) -> testFail; testOk),

 checkComplainAndAdjustExpected( 26),

 % see also : rational.pl
 
 result(S), 
 format( S, []),

 true.

