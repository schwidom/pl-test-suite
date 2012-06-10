exec( 'testenv.sci', -1)

checkComplainAndAdjustEx( 0)

tst_test( 'boolean'==typeof( %T))
tst_test( 'boolean'==typeof( %t))
tst_test( 'boolean'==typeof( %F))
tst_test( 'boolean'==typeof( %f))
tst_test( 'polynomial'==typeof( %s))

function []= f()
endfunction

tst_test( 'function'==typeof( f))

clear f

tst_test( 'string'==typeof( ''))

checkComplainAndAdjustEx( 7)

printf( tst_result())

exit
