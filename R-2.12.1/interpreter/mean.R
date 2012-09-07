
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 2.5 == mean( c( 2, 3)))
te$test( 2.5 == mean( c( 2, 3, NA), na.rm=TRUE))

te$test( 3 == mean( c( 1, 2, 3, 7, 12), trim=0.5))
te$test( 4 == mean( c( 1, 2, 3, 7, 12), trim=0.3))
te$test( 5 == mean( c( 1, 2, 3, 7, 12), trim=0.1))
te$test( 4 == mean( c( -1, 2, 3, 7, 100), trim=0.3))
te$test( 3 == mean( c( -1, -1, 3, 100, 100), trim=0.5))

te$checkComplainAndAdjustExpected( 7)

# see also: sum.R

print( te$result())

