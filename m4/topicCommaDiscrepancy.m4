m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

m4_define( [QUOTE_COMMA], [m4_patsubst( m4_defn( [$1]), [,], [[[,]]])]) 

m4_define( [COMMA], [,])

checkComplainAndAdjustExpected( 0)

test( equal( [,], m4_defn( [COMMA])))
test( equal( [[,]], QUOTE_COMMA( [COMMA])))

[
 There is no other way to handle the COMMA macro because it expands to unquoted [,] and this is the 
 parameter delimiter used by macros. So macros with parameters cannot be used, if they expand unquoted commas.
]

checkComplainAndAdjustExpected( 2)

m4_divert( m4_incr( m4_divnum))m4_dnl
result()
