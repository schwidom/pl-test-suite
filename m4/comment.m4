m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

checkComplainAndAdjustExpected( 0)

m4_dnl this is a comment
m4_dnl test( false)

checkComplainAndAdjustExpected( 0)

m4_divert( m4_incr( m4_divnum))m4_dnl
m4_dnl
m4_pushdef( [divnum_tmp], m4_divnum)m4_dnl
m4_divert( -1)m4_dnl

this will not expand but executes code

test( true)
test( m4_ifelse( 1, m4_eval( -1 == m4_divnum), [true], [false]))

checkComplainAndAdjustExpected( 2)

[ this will not expand and not execute
 test( false)
]

m4_divert( divnum_tmp)m4_dnl
m4_popdef( [divnum_tmp])m4_dnl
m4_dnl
checkComplainAndAdjustExpected( 0)m4_dnl
m4_dnl
[ this will expand and not execute
 test( false)
]m4_dnl
m4_dnl
checkComplainAndAdjustExpected( 0)m4_dnl
m4_dnl
result()
m4_dnl
