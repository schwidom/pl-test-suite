
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 'a', 'b', 'c', 'd') == letters[ 1:4]))

te$checkComplainAndAdjustExpected( 1)

# see also:

print( te$result())

