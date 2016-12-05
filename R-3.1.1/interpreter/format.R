
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( '13.7'==format( 13.7))
te$test( '14'==format( 13.7, digits=2))
te$test( '14'==format( 13.7, digits=1))
te$test( '13.7'==format( 13.7, digits=3))
te$test( '13.7'==format( 13.7, digits=4))
te$test( '13.700'==format( 13.7, digits=2, nsmall=3))

te$test( all( c( " 6", "13") == format( c(6.0, 13.1), digits = 2)))
te$test( all( c( " 6.0", "13.1") == format( c(6.0, 13.1), digits = 2, nsmall=1)))
te$test( all( c( "  6.0", " 13.1") == format( c(6.0, 13.1), digits = 2, nsmall=1, width=5)))

te$test( all( c( "1", "2", "3") == format( 1:3)))
te$test( all( c( " 1", " 2", " 3") == format( 1:3, width=2)))

te$test( "2147483647" == format(2^31-1))
te$test( "2.147484e+09" == format(2^31-1, scientific = TRUE))

te$checkComplainAndAdjustExpected( 13)

print( te$result())

