
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 7) == tail( c( 2:7), n=1)))
te$test( all( c( 6, 7) == tail( c( 2:7), n=2)))
te$test( all( c( 2:7) == tail( c( 2:7))))
te$test( all( c( 3:8) == tail( c( 1:8))))

te$checkComplainAndAdjustExpected( 4)

# see also: head.R, tail.R
# see also:

print( te$result())

