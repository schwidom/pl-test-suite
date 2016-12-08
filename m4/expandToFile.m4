m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

m4_syscmd( [mkdir -p work])
m4_syscmd( [echo -n '$USER ' > work/cmpfile])
m4_syscmd( [echo -n '\ """ '"'''" >> work/cmpfile])

m4_define( [QUOTE_COMMA], [m4_patsubst( [$1], [,], [[[,]]])]) [ prerequisite for comma problem, currently not solved ]
m4_define( [MACRO_TO_CMDLINE1], ['m4_patsubst( [$1], ['], ['"'"'])'])
m4_define( [MACRO_TO_CMDLINE2], ['m4_patsubst( [$1], [\('+\)], ['"\1"'])'])

[the following macro expands bash variables:]
m4_define( [MACRO_TO_CMDLINE3], ["m4_patsubst( [$1], [\(\\\|"\)], [\\\1])"])

m4_define( [MACRO_TO_EXPAND], [$USER \ """ '''])

m4_syscmd( [echo -n ]MACRO_TO_CMDLINE1( MACRO_TO_EXPAND)[ >work/cmpfile1])
m4_syscmd( [echo -n ]MACRO_TO_CMDLINE2( MACRO_TO_EXPAND)[ >work/cmpfile2])
m4_syscmd( [echo -n ]MACRO_TO_CMDLINE3( MACRO_TO_EXPAND)[ >work/cmpfile3])

checkComplainAndAdjustExpected( 0)

m4_dnl beware: m4_include expands read macros

test( equal( [$USER \ """ '''], m4_include( [work/cmpfile])))
test( equal( [false], equal( m4_include( [/dev/null]), m4_include( [work/cmpfile]))))
test( equal( m4_include( [work/cmpfile]), m4_include( [work/cmpfile1])))
test( equal( m4_include( [work/cmpfile]), m4_include( [work/cmpfile2])))
test( equal( [false], equal( m4_include( [work/cmpfile]), m4_include( [work/cmpfile3]))))
test( equal( m4_esyscmd( [echo -n $USER])[ \ """ '''], m4_include( [work/cmpfile3])))

checkComplainAndAdjustExpected( 6)

[see also: expandToFile.m4 expandToFile2.m4]

m4_divert( m4_incr( m4_divnum))m4_dnl
result()
