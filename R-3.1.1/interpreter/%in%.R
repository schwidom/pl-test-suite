
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( FALSE, TRUE, TRUE, FALSE) == ( c( 'c', 'a', 'b', 'c') %in% c( 'b', 'a'))))

te$checkComplainAndAdjustExpected( 1)

# see also:

print( te$result())

