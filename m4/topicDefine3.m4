m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

m4_define( [A], [B])

m4_define( [B], [1])



checkComplainAndAdjustExpected( 0)

test( equal( [1], A))
test( equal( [B], m4_defn( [A])))

m4_define( [A], [[B]])

test( equal( [B], A))

checkComplainAndAdjustExpected( 3)

m4_divert( m4_incr( m4_divnum))m4_dnl
result()

