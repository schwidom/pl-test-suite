exec( 'testenv.sci', -1)

checkComplainAndAdjustEx( 0)
tst_test( %T)
tst_test( %T)
checkComplainAndAdjustEx( 2)
tst_test( %T)
tst_test( %T)
tst_test( %T)
checkComplainAndAdjustEx( 3)

printf( tst_result())

exit
