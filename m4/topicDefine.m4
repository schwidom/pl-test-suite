m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

checkComplainAndAdjustExpected( 0)

m4_define( [YZ], [X])
m4_define( [A], [Y])
m4_define( [B], [Z])

test( equal( [Y], A))
test( equal( [Z], B))
test( equal( [X], YZ))
test( equal( [AB], AB))

test( equal( [X], m4_indir( A[]B)))

test( equal( [YZ], A[]B))
test( equal( [YZ], A[]B()))
test( equal( [YB], A()B))
test( equal( [YB()], A()B()))
test( equal( [AZ], [A]B))
test( equal( [AZ], [A]B()))

m4_define( [YB], [W])

test( equal( [W], A()B))

checkComplainAndAdjustExpected( 12)

m4_divert( m4_incr( m4_divnum))m4_dnl
result()

