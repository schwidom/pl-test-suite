
main :- 

 consult( testenv),

 checkComplainAndAdjustExpected( 0),

 assert( mod:a),
 mod:assert( b),
 mod:assert( mod:c),
 mod2:assert( mod:d),
 %(mod:a, mod:b, mod:c, mod:d, mod2:mod:d, mod3:mod:d -> testOk; testFail), % is ok for swi-prolog-5.6.62 but not for swi-prolog-5.8.3
 (mod:a, mod:b, mod:c, mod:d -> testOk; testFail),

 checkComplainAndAdjustExpected( 1),

 result(S), 
 format( S, []),

 true.

