
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

a= approx( c( 1, 100, 2, 2, -100, 3), n=3 )
te$test( all( c( 1, 2, 3) == a$y))
te$test( all( c( 1, 3.5, 6) == a$x))

te$checkComplainAndAdjustExpected( 2)

# see also: seq.R, approx.R
# see also:

print( te$result())

