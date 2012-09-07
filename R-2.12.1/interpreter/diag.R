
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

einheitsmatrix3 <- diag( 3)

te$test( all( matrix( nrow=3, ncol=3, data=c( 1, 0, 0, 0, 1, 0, 0, 0, 1)) == einheitsmatrix3))

diag( einheitsmatrix3) <- 9

te$test( all( matrix( nrow=3, ncol=3, data=c( 9, 0, 0, 0, 9, 0, 0, 0, 9)) == einheitsmatrix3))


te$checkComplainAndAdjustExpected( 2)

# see also:

print( te$result())

