exec( 'testenv.sci', -1)

checkComplainAndAdjustEx( 0)
tst_test( %T)
checkComplainAndAdjustEx( 1)

printf( tst_result())

exit
