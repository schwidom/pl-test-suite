
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 1, 2, 3) == seq( 3)))
te$test( all( c( 2, 3, 4) == seq( 2, 4)))
te$test( all( c( 1, 3, 5) == seq( 1, 5, by=2)))
te$test( all( c( 1, 3, 5) == seq( 1, 5, 2)))
te$test( all( c( 1, 3, 5) == seq( 1, 5, length.out=3)))

te$checkComplainAndAdjustExpected( 5)

# see also: seq.R, approx.R
# see also:

print( te$result())

