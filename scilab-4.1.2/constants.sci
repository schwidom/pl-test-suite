exec( 'testenv.sci', -1)

checkComplainAndAdjustEx( 0)

eps_factor= 10000000

tst_test( round( 3.1415927* eps_factor) == round( %pi* eps_factor))
tst_test( round( 2.7182818* eps_factor) == round( %e* eps_factor))

tst_test( 0==real( %i))
tst_test( -1==real( %i**2))

tst_test( 0==real( %e**(%i*%pi)+ 1))

checkComplainAndAdjustEx( 5)

printf( tst_result())

exit
