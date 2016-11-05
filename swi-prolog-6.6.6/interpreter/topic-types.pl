
main :- 

 string_to_list( STRING_ABC, "abc"),

 consult( testenv_V2),

 checkComplainAndAdjustExpected( 0),

 test( ( integer( 9) ) ),
 test( \+ ( integer( 9.0) ) ),

 test( ( number( 9) ) ),
 test( ( number( 9.0) ) ),

 test( \+ ( float( 9) ) ),
 test( ( float( 9.0) ) ),

 test( ( is_list( "abc") ) ),
 test( \+ ( is_list( 'abc') ) ),

 test( ( string( STRING_ABC) ) ),
 test( \+ ( string( "abc") ) ),
 
 test( ( atom( abc) ) ),
 test( ( atom( 'abc') ) ),
 test( \+ ( atom( STRING_ABC) ) ),

 test( ( callable( abc) ) ),
 test( ( callable( abc(_)) ) ),

 test( ( compound( abc(_)) ) ),

 test( ( ground( abc) ) ),
 test( \+ ( ground( abc(_)) ) ),
 test( ( ground( abc(d)) ) ),

 test( ( atomic( abc) ) ),
 test( ( atomic( 'abc') ) ),
 test( ( atomic( STRING_ABC) ) ),
 test( \+ ( atomic( "abc") ) ),
 test( \+ ( atomic( abc(_)) ) ),

 CT=ct(CT),
 test( ( cyclic_term( CT) ) ),
 test( \+ ( cyclic_term( ct( 1)) ) ),

 checkComplainAndAdjustExpected( 26),

 % see also : rational.pl
 
 result(S), 
 format( S, []),

 true.

