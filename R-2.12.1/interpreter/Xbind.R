
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( matrix( nrow=3, ncol=2, data=c( 1, 2, 3, 9, 9, 9)) == cbind( 1:3, 9)))
te$test( all( t( cbind( 1:3, 9)) == rbind( 1:3, 9)))

te$test( all( matrix( nrow=5, ncol=3, data=c( 1, 2, 3, 1, 2, 1, 2, 3, 4, 5, 1, 2, 3, 4, 1)) == suppressWarnings( cbind( 1:3, 1:5, 1:4))))


te$checkComplainAndAdjustExpected( 3)

# see also:

print( te$result())

