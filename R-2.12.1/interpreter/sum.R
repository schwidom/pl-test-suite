
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 5 == sum( 2, 3))
te$test( 12 == sum( 2, 3, 7))

te$checkComplainAndAdjustExpected( 2)

# see also: mean.R

print( te$result())

