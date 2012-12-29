
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 1:2, 1, 1:3) == sequence( c( 2,1,3))))
te$test( all( sequence( matrix( nrow=2, ncol=2, 1:4)) == sequence( 1:4)))
te$test( all( sequence( matrix( nrow=2, ncol=2, 1:4, byrow=TRUE)) == sequence( c( 1, 3, 2, 4))))

te$checkComplainAndAdjustExpected( 3)

# see also:

print( te$result())

