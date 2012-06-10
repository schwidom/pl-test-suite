
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( TRUE)

te$checkComplainAndAdjustExpected( 1)

# see also:

print( te$result())

