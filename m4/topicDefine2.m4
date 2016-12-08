m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

m4_define( [A], [1])

m4_define( [F1], [-$1-])
m4_define( [F2], [-[$1]-])
m4_define( [F3], [-[[$1]]-])

checkComplainAndAdjustExpected( 0)

test( equal( [1], A))
test( equal( [A], [A]))

test( equal( [F1][([A])], [F1([A])]))
test( equal( [F1][]([A]), [F1]([A])))
test( equal( [-1-], F1([A])))
test( equal( [-A-], F2([A])))
test( equal( [-[A]-], F3([A])))

checkComplainAndAdjustExpected( 7)

m4_divert( m4_incr( m4_divnum))m4_dnl
result()

