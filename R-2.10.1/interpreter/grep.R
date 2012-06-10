
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( 1== grep( 'a', '12a45')))
te$test( all( 3== grep( 'a', c( 'b', 'd', '12a45', 'e', 'r'))))

te$checkComplainAndAdjustExpected( 2)

# see also:

print( te$result())

