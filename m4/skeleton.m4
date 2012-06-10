m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

checkComplainAndAdjustExpected( 0)
test( true)
checkComplainAndAdjustExpected( 1)

m4_divert( m4_incr( m4_divnum))m4_dnl
result()

