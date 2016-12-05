
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

einheitsmatrix3 <- diag( 3)

te$test( all( matrix( nrow=3, ncol=3, data=c( 1, 0, 0, 0, 1, 0, 0, 0, 1)) == einheitsmatrix3))
te$test( all( matrix( nrow=3, ncol=3, data=c( 2, 0, 0, 0, 2, 0, 0, 0, 2)) == einheitsmatrix3* 2))
te$test( all( einheitsmatrix3 * einheitsmatrix3 == einheitsmatrix3))
te$test( all( einheitsmatrix3 %*% einheitsmatrix3 == einheitsmatrix3))

te$test( all( matrix( nrow=3, ncol=3, data=c( 1, 0, 0, 0, 2, 0, 0, 0, 3)) == c( 1, 2, 3) * einheitsmatrix3))
te$test( all( matrix( nrow=3, ncol=3, data=c( 1, 0, 0, 0, 2, 0, 0, 0, 3)) == einheitsmatrix3 * c( 1, 2, 3)))

te$test( all( c( 1, 4, 9) == c( 1, 2, 3) * c( 1, 2, 3)))

te$test( all( matrix( nrow=3, ncol=3, data=c( 1, 2, 3, 2, 4, 6, 3, 6, 9)) == c( 1, 2, 3) %*% t( c( 1, 2, 3))))

te$test( all( matrix( nrow=1, ncol=1, data=c( 14)) == t( c( 1, 2, 3)) %*% c( 1, 2, 3)))

te$checkComplainAndAdjustExpected( 9)

# see also:

print( te$result())

