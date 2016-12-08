m4_include( testenv.m4)m4_dnl
m4_divert( m4_decr( m4_divnum))m4_dnl

m4_syscmd( [mkdir -p work])
m4_syscmd( [echo -n '$USER ' > work/cmpfile])
m4_syscmd( [echo -n '\ , """ '"'''" >> work/cmpfile])

m4_define( [QUOTE_COMMA], [m4_patsubst( m4_defn( [$1]), [,], [[[,]]])]) [ prerequisite for comma problem, currently solved  - it seems to be that the following ist necessary: before beginning of an m4_project finger out the correct round trip encoding and quoting style and applicable macro prefixes]
m4_define( [MACRO_TO_CMDLINE1], ['m4_patsubst( QUOTE_COMMA( [$1]), ['], ['"'"'])'])
m4_define( [MACRO_TO_CMDLINE2], ['m4_patsubst( QUOTE_COMMA( [$1]), [\('+\)], ['"\1"'])'])

[the following macro expands bash variables:]
m4_define( [MACRO_TO_CMDLINE3], ["m4_patsubst( QUOTE_COMMA( [$1]), [\(\\\|"\)], [\\\1])"])

m4_define( [MACRO_TO_EXPAND], [$USER \ , """ '''])

m4_syscmd( [echo -n ]MACRO_TO_CMDLINE1( [MACRO_TO_EXPAND])[ >work/cmpfile1])
m4_syscmd( [echo -n ]MACRO_TO_CMDLINE2( [MACRO_TO_EXPAND])[ >work/cmpfile2])
m4_syscmd( [echo -n ]MACRO_TO_CMDLINE3( [MACRO_TO_EXPAND])[ >work/cmpfile3])

m4_define( [INCLUDE_NOT_EXPANDING], [m4_esyscmd( [echo -n "[$(cat '$1')]"])])

checkComplainAndAdjustExpected( 0)

m4_dnl beware: m4_include expands read macros

test( equal( [$USER \ , """ '''], INCLUDE_NOT_EXPANDING( [work/cmpfile])))
test( equal( [false], equal( m4_include( [/dev/null]), INCLUDE_NOT_EXPANDING( [work/cmpfile]))))
test( equal( INCLUDE_NOT_EXPANDING( [work/cmpfile]), INCLUDE_NOT_EXPANDING( [work/cmpfile1])))
test( equal( INCLUDE_NOT_EXPANDING( [work/cmpfile]), INCLUDE_NOT_EXPANDING( [work/cmpfile2])))
test( equal( [false], equal( INCLUDE_NOT_EXPANDING( [work/cmpfile]), INCLUDE_NOT_EXPANDING( [work/cmpfile3]))))
test( equal( m4_esyscmd( [echo -n $USER])[ \ , """ '''], INCLUDE_NOT_EXPANDING( [work/cmpfile3])))

checkComplainAndAdjustExpected( 6)

[see also: expandToFile.m4 expandToFile2.m4]

m4_divert( m4_incr( m4_divnum))m4_dnl
result()
