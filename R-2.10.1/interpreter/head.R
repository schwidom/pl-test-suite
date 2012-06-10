
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 2) == head( c( 2:7), n=1)))
te$test( all( c( 2, 3) == head( c( 2:7), n=2)))
te$test( all( c( 2:7) == head( c( 2:7))))
te$test( all( c( 1:6) == head( c( 1:8))))

te$checkComplainAndAdjustExpected( 4)

# see also: head.R, tail.R
# see also:

print( te$result())

