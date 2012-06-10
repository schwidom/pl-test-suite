m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

checkComplainAndAdjustExpected( 0)
test( true)
test( true)
checkComplainAndAdjustExpected( 2)
test( true)
test( true)
test( true)
checkComplainAndAdjustExpected( 3)

test( m4_ifelse( [true], equal( 1, 1), [true], [false]))
test( m4_ifelse( [false], equal( 1, 2), [true], [false]))
test( equal( 1, 1))

checkComplainAndAdjustExpected( 3)

m4_divert( m4_incr( m4_divnum))m4_dnl
result()

