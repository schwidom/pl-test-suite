
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 1, 1) == rep( 1, 2)))
te$test( all( c( 3, 4, 3, 4) == rep( c( 3, 4), 2)))

te$checkComplainAndAdjustExpected( 2)

# see also:

print( te$result())

