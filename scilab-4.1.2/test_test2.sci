exec( 'testenv.sci', -1)


checkComplainAndAdjustEx( 0)
tst_test( %T)
checkComplainAndAdjustEx( 1)
tst_test( 0==tst_countOk)
global tst_countOk
tst_test( 2==tst_countOk)
checkComplainAndAdjustEx( 2)

printf( tst_result())

exit
